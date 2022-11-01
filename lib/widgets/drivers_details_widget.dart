import 'package:flutter/material.dart';
import 'package:truckassure/utils/utils.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/scaffold_default.dart';
import 'package:truckassure/widgets/default/text_field.dart';
import 'package:truckassure/widgets/default/title_container.dart';
import 'package:truckassure/models/drivers_details_data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:truckassure/widgets/drivers_list_widget.dart';

class DriversDetails extends StatefulWidget {
  static const ROUTE_NAME = "/drivers_details";
  @override
  State<StatefulWidget> createState() => new _DriversDetailsState();
}

class _DriversDetailsState extends State<DriversDetails> {
  final _name = TextEditingController();
  final _date = TextEditingController();
  final _license = TextEditingController();
  bool _isEnabled;

  var dateFormatter = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  Utils _utils = Utils();

  @override
  void initState() {
    super.initState();
    _isEnabled = false;
  }

  bool _onResultCheck() {
    return (_utils.isDriverValid(_name.text, _date.text, _license.text));
  }

  void onSubmit() {
    setState(() {
      if (_onResultCheck()) {
        _isEnabled = true;
      } else {
        _isEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(title: "Driver's Details", widget: Column(children: [
     ImageContainer(),
      Expanded(
          child: Column(
            children: [
              TextFieldWidget(
                label: "Driver's name",
                controller: _name,
                keyboard: "text",
                result: onSubmit,
                formatterList: null,
              ),
              TextFieldWidget(
                hint: "MM/DD/YYYY",
                label: "Date of Birth",
                controller: _date,
                keyboard: "text",
                result: onSubmit,
                formatterList: [dateFormatter],
              ),
              TextFieldWidget(
                label: "License",
                controller: _license,
                keyboard: "text",
                result: onSubmit,
                formatterList: null,
              )
            ],
          )),
      Container(
          margin: EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  primary: Colors.black,
                  minimumSize: const Size.square(40)),
              onPressed: !_isEnabled
                  ? null
                  : () {
                if (_onResultCheck()) {
                  var data = DriversDetailsData(
                      id: DateTime.now().millisecondsSinceEpoch
                          .toString(),
                      name: _name.text,
                      dateOfBirth: _date.text,
                      license: _license.text);
                  print("id = ${data.id}");
                  print("date = ${data.dateOfBirth}");
                  print("license = ${data.license}");
                  Navigator.of(context).pop(data);
                } else {
                  print("do not enter");
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              )))
    ]),);
  }
}
