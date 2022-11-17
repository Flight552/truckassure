import 'package:flutter/foundation.dart';
import '../models/vehicles_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VehicleDetailsProvider with ChangeNotifier {
  final List<VehiclesData> _vehicleData = [];
  var _vehicle;

  List<VehiclesData> get vehicleData {
    return [..._vehicleData];
  }

  VehiclesData get getVehicle {
    return _vehicle;
  }

  void addVehicleData(VehiclesData data) {
    _vehicleData.add(data);
    notifyListeners();
  }

  Future<void> getVin(String vin) async {
    final vinUri =
        "https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/$vin?format=json";
    final url = Uri.parse(vinUri);
    if(vin.isNotEmpty && vin.length > 8) {
      try {
        var response = await http.get(url);
        var converted = json.decode(response.body);
        _convertJsonToVinResult(converted);
        notifyListeners();
        // print(converted);
      } catch (e) {
        print("This is some big error");
        notifyListeners();
      }
    } else{
      _vehicle = null;
    }
  }

//---------------------------
  void _convertJsonToVinResult(Map<String, dynamic> data) {
    String modelMake;
    String modelYear;
    String type;
    var vin = data["SearchCriteria"].substring(4);
    var results = data["Results"];
    if (data == null) {
      return;
    }
    if (results != null) {
      results.forEach((value) {
        if (value["Variable"] == "Make") {
          if (value["Value"] != null) {
            modelMake = value["Value"];
          }
        }
        if (value["Variable"] == "Model Year") {
          if (value["Value"] != null) {
            modelYear = value["Value"];
          }
        }
        if (value["Variable"] == "Vehicle Type") {
          if (value["Value"] != null) {
            type = value["Value"];
          }
        }
        if (modelMake != null) {
          if (value["Variable"] == "Model") {
            if (value["Value"] != null) {
              type = value["Value"];
            }
          }
        }
      });
      if ((modelYear != null) &&
          (modelMake != null) &&
          (vin != null) &&
          (type != null)) {
        _createVehicleData(vin, modelMake, modelYear, type);
      }
     // print(" $vin, $modelMake, $modelYear, $type");
    }
  }

//------------------

  void _createVehicleData(
      String vin, String makeModel, String modelYear, String type) {
    _vehicle = VehiclesData(
        id: DateTime.now().toIso8601String(),
        modelYear: modelYear,
        makeModel: makeModel,
        type: type);
  }

  void updateVehicle(String id, VehiclesData driver) {
    int index = _vehicleData.indexWhere((element) => element.id == id);
    _vehicleData[index] = driver;
    notifyListeners();
  }

  void deleteVehicle(String id) {
    _vehicleData.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
