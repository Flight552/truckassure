import 'package:flutter/material.dart';

class Utils {
  bool isValid(
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
}
