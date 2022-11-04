import 'package:flutter/foundation.dart';
import 'package:truckassure/models/drivers_details_data.dart';

class DriversDetailsProvider with ChangeNotifier {
  final List<DriversDetailsData> _driversData = [];

  List<DriversDetailsData> get driversData {
    return [..._driversData];
  }

  void addDriverData(DriversDetailsData data) {
    _driversData.add(data);
    notifyListeners();
  }

  void deleteDriver(String id) {
    _driversData.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
