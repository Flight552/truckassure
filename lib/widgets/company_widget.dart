import 'package:flutter/material.dart';
import 'package:truckassure/widgets/default/drop_down_states.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/text_simple.dart';
import 'package:truckassure/widgets/default/title_container.dart';
import 'package:truckassure/widgets/default/text_field.dart';
import 'package:truckassure/utils/utils.dart';
import 'package:truckassure/models/company_details_data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompanyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CompanyWidgetState();
}

class _CompanyWidgetState extends State<CompanyWidget> {
  Utils _utils = Utils();

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

  var phoneFormatter = new MaskTextInputFormatter(
      mask: '+# (###) ###-###-#',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var taxFormatter = new MaskTextInputFormatter(
      mask: '###-##-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  bool _isButtonEnabled;

  @override
  void initState() {
    super.initState();
    _isButtonEnabled = false;
  }

  bool checkFields() {
    return _utils.isCompanyValid(
        _company.text,
        _zipcode.text,
        _street.text,
        _city.text,
        _state.text,
        _contact.text,
        _country.text,
        _email.text,
        _fax.text,
        _phone.text,
        _taxId.text,
        _title.text,
        _fmcsa.text);
  }

  void onSubmit() {
    setState(() {
      if (checkFields()) {
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
                formatterList: null,
              ),
              TextFieldWidget(
                hint: null,
                label: "Zip Code",
                controller: _zipcode,
                keyboard: "number",
                result: onSubmit,
                formatterList: [],
              ),
              TextFieldWidget(
                hint: null,
                label: "Street",
                controller: _street,
                keyboard: "text",
                result: onSubmit,
                formatterList: null,
              ),
              TextFieldWidget(
                hint: null,
                label: "City",
                controller: _city,
                keyboard: "text",
                result: onSubmit,
                formatterList: null,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SimpleText(
                          text: "Country",
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                        DropDownItems(
                          choice: "country",
                          hint: "Choose country",
                          getAmount: null,
                        )
                      ])),
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SimpleText(
                          text: "States",
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                        DropDownItems(
                          choice: "states",
                          hint: "Choose state",
                          getAmount: null,
                        )
                      ])),
              TextFieldWidget(
                label: "Contact",
                controller: _contact,
                keyboard: "text",
                result: onSubmit,
                formatterList: null,
              ),
              TextFieldWidget(
                hint: null,
                label: "Title",
                controller: _title,
                keyboard: "text",
                result: onSubmit,
                formatterList: null,
              ),
              TextFieldWidget(
                hint: "+1-555-xxx-xxx-x",
                label: "Phone",
                controller: _phone,
                keyboard: "number",
                result: onSubmit,
                formatterList: [phoneFormatter],
              ),
              TextFieldWidget(
                hint: "+1-555-xxx-xxx-x",
                label: "Fax",
                controller: _fax,
                keyboard: "number",
                result: onSubmit,
                formatterList: [phoneFormatter],
              ),
              TextFieldWidget(
                label: "Email",
                controller: _email,
                keyboard: "email",
                result: onSubmit,
                formatterList: null,
              ),
              TextFieldWidget(
                hint: "9xx-xx-xxxx",
                label: "Tax ID",
                controller: _taxId,
                keyboard: "number",
                result: onSubmit,
                formatterList: [taxFormatter],
              ),
              TextFieldWidget(
                hint: "FMCSA MC#",
                label: "FMCSA MC#",
                controller: _fmcsa,
                keyboard: "text",
                result: onSubmit,
                formatterList: null,
              )
            ],
          ),
        )),
        Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.black,
                    minimumSize: const Size.square(40)),
                onPressed: !_isButtonEnabled
                    ? null
                    : () {
                        if (checkFields()) {
                          var data = CompanyDetailsData(
                              companyName: _company.text,
                              zipcode: int.parse(_zipcode.text),
                              street: _street.text,
                              city: _city.text,
                              country: _country.text,
                              state: _state.text,
                              contact: _contact.text,
                              title: _title.text,
                              phone: _phone.text,
                              fax: _fax.text,
                              email: _email.text,
                              taxId: _taxId.text,
                              fmcsa: _fmcsa.text);
                          print("enter");
                        } else {
                          print("do not enter");
                        }
                      },
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    ));
  }
}
