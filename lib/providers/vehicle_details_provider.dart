import 'package:flutter/foundation.dart';
import '../models/vehicles_data.dart';

class VehicleDetailsProvider with ChangeNotifier {
  final List<VehiclesData> _vehicleData = [];

  List<VehiclesData> get vehicleData {
    return [..._vehicleData];
  }

  void addVehicleData(VehiclesData data) {
    _vehicleData.add(data);
    notifyListeners();
  }

  void deleteVehicle(String id) {
    _vehicleData.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
