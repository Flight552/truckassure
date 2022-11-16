import 'package:flutter/foundation.dart';
import '../models/company_details_data.dart';

class CompanyDetailsProvider with ChangeNotifier {
      final List<CompanyDetailsData> _companyData = [];

      List<CompanyDetailsData> get companyData {
        return [..._companyData];
      }

      void addCompanyData(CompanyDetailsData data) {
        _companyData.add(data);
        notifyListeners();
      }

      void updateCompany(String id, CompanyDetailsData data) {
        var index = _companyData.indexWhere((element) => element.id == id);
        _companyData[index] = data;
      }
}