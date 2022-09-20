import 'package:flutter/material.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/title_container.dart';
import 'package:truckassure/widgets/default/text.dart';

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
      if (_company.text != null && _company.text.isNotEmpty) {
        print("${_company.text}");
        _isButtonEnabled = true;
      } else {
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
              ),
              TextFieldWidget(
                hint: null,
                label: "Title",
                controller: _title,
                keyboard: "text",
              ),
              TextFieldWidget(
                hint: "+1-555-xxx-xxx-x",
                label: "Phone",
                controller: _phone,
                keyboard: "number",
              ),
              TextFieldWidget(
                hint: "+1-555-xxx-xxx-x",
                label: "Fax",
                controller: _fax,
                keyboard: "number",
              ),
              TextFieldWidget(
                label: "Email",
                controller: _email,
                keyboard: "email",
              ),
              TextFieldWidget(
                  hint: "9xx-xx-xxxx",
                  label: "Tax ID",
                  controller: _taxId,
                  keyboard: "number"),
              TextFieldWidget(
                  hint: "FMCSA MC#",
                  label: "FMCSA MC#",
                  controller: _fmcsa,
                  keyboard: "text")
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
