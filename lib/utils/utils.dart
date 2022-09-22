import 'package:flutter/material.dart';

class Utils {
  final String company;
  final String zipcode;
  final String street;
  final String city;
  final String country;
  final String state;
  final String contact;
  final String title;
  final String phone;
  final String fax;
  final String email;
  final String taxId;
  final String fmcsa;
  Utils(
      {this.company,
      this.zipcode,
      this.street,
      this.city,
      this.country,
      this.state,
      this.contact,
      this.title,
      this.phone,
      this.taxId,
      this.fax,
      this.email,
      this.fmcsa});

  bool isValid() {
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
