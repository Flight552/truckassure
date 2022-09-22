import 'package:flutter/material.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/title_container.dart';
import 'package:truckassure/widgets/default/text.dart';
import 'package:truckassure/utils/utils.dart';

class CompanyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CompanyWidgetState();
}

class _CompanyWidgetState extends State<CompanyWidget> {
  final _company = TextEditingController();
  final _zipcode = TextEditingController();
  final _street = TextEditingController();
  final _city = TextEditingController();
  final _country = TextEditingController();
  final _state = TextEditingController();
  final _contact = TextEditingController();
  final _title = TextEditingController();
  final _phone = TextEditingController();
  final _fax = TextEditingController();
  final _email = TextEditingController();
  final _taxId = TextEditingController();
  final _fmcsa = TextEditingController();

  bool _isButtonEnabled;

  @override
  void initState() {
    _isButtonEnabled = false;
  }

  void onSubmit() {
    setState(() {
      Utils _utils = Utils(
          company: _company.text,
          zipcode: _zipcode.text,
          street: _street.text,
          city: _city.text,
          state: _state.text,
          contact: _contact.text,
          country: _country.text,
          email: _email.text,
          fax: _fax.text,
          phone: _phone.text,
          taxId: _taxId.text,
          title: _title.text,
          fmcsa: _fmcsa.text);
      bool isTrue = _utils.isValid();
      if (isTrue) {
        print("inside if true ${_utils.isValid()}");
        print("fmcsa: ${_utils.fmcsa}");
        _isButtonEnabled = true;
      } else {
        print("inside if false ${_utils.isValid()}");
        print("fmcsa: ${_utils.fmcsa}");

        _isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ImageContainer(),
        PageTitleContainer(
          title: "Company details",
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldWidget(
                hint: null,
                label: "Company name",
                controller: _company,
                keyboard: "text",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: null,
                label: "Zip Code",
                controller: _zipcode,
                keyboard: "number",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: null,
                label: "Street",
                controller: _street,
                keyboard: "text",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: null,
                label: "City",
                controller: _city,
                keyboard: "text",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: null,
                label: "Country",
                controller: _country,
                keyboard: "text",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: null,
                label: "State",
                controller: _state,
                keyboard: "text",
                result: onSubmit,
              ),
              TextFieldWidget(
                label: "Contact",
                controller: _contact,
                keyboard: "text",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: null,
                label: "Title",
                controller: _title,
                keyboard: "text",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: "+1-555-xxx-xxx-x",
                label: "Phone",
                controller: _phone,
                keyboard: "number",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: "+1-555-xxx-xxx-x",
                label: "Fax",
                controller: _fax,
                keyboard: "number",
                result: onSubmit,
              ),
              TextFieldWidget(
                label: "Email",
                controller: _email,
                keyboard: "email",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: "9xx-xx-xxxx",
                label: "Tax ID",
                controller: _taxId,
                keyboard: "number",
                result: onSubmit,
              ),
              TextFieldWidget(
                hint: "FMCSA MC#",
                label: "FMCSA MC#",
                controller: _fmcsa,
                keyboard: "text",
                result: onSubmit,
              )
            ],
          ),
        )),
        Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.black,
                    minimumSize: Size.square(40)),
                onPressed: !_isButtonEnabled
                    ? null
                    : () {
                        // var data = CompanyDetailsData(
                        //     companyName: _company.text,
                        //     zipcode: int.parse(_zipcode.text),
                        //     street: _street.text,
                        //     city: _city.text,
                        //     country: _country.text,
                        //     state: _state.text,
                        //     contact: _contact.text,
                        //     title: _title.text,
                        //     phone: _phone.text,
                        //     fax: _fax.text,
                        //     email: _email.text,
                        //     taxId: _taxId.text,
                        //     fmcsa: _fmcsa.text);
                      },
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    ));
  }
}
