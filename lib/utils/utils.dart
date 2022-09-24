import 'package:flutter/material.dart';

class Utils {
  bool isCompanyValid(
      String company,
      String zipcode,
      String street,
      String city,
      String country,
      String state,
      String contact,
      String title,
      String phone,
      String fax,
      String email,
      String taxId,
      String fmcsa) {
    if (company != null &&
        company.isNotEmpty &&
        zipcode != null &&
        zipcode.isNotEmpty &&
        street != null &&
        street.isNotEmpty &&
        city != null &&
        city.isNotEmpty &&
        country != null &&
        country.isNotEmpty &&
        state != null &&
        state.isNotEmpty &&
        contact != null &&
        contact.isNotEmpty &&
        title != null &&
        contact.isNotEmpty &&
        title != null &&
        title.isNotEmpty &&
        phone != null &&
        phone.isNotEmpty &&
        taxId != null &&
        taxId.isNotEmpty &&
        fax != null &&
        fax.isNotEmpty &&
        email != null &&
        email.isNotEmpty &&
        fmcsa != null &&
        fmcsa.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isDriverValid(String name, String date, String license) {
    if (name != null &&
        name.isNotEmpty &&
        date != null &&
        date.isNotEmpty &&
        license != null &&
        license.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool isVehicleValid(
      String vin, String modelYear, String makeModel, String type) {
    if (vin != null &&
        vin.isNotEmpty &&
        modelYear != null &&
        modelYear.isNotEmpty &&
        makeModel != null &&
        makeModel.isNotEmpty &&
        type != null &&
        type.isNotEmpty) {
      return true;
    }
    return false;
  }
}
