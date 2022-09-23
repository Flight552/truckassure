import 'package:flutter/material.dart';
import 'package:truckassure/utils/utils.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/text.dart';
import 'package:truckassure/widgets/default/title_container.dart';
import 'package:truckassure/models/drivers_details_data.dart';

class DriversDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DriversDetailsState();
}

class _DriversDetailsState extends State<DriversDetails> {
  final _name = TextEditingController();
  final _date = TextEditingController();
  final _license = TextEditingController();
  bool _isEnabled;

  Utils _utils = Utils();

  @override
  void initState() {
    _isEnabled = false;
  }

  bool onResultCheck() {
    return (_utils.isDriverValid(_name.text, _date.text, _license.text));
  }

  void onSubmit() {
    setState(() {
      if (onResultCheck()) {
        _isEnabled = true;
      } else {
        _isEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ImageContainer(),
        PageTitleContainer(
          title: "Driver's Details",
        ),
        Expanded(
            child: Column(
          children: [
            TextFieldWidget(
              label: "Driver's name",
              controller: _name,
              keyboard: "text",
              result: onSubmit,
            ),
            TextFieldWidget(
              hint: "MM/DD/YYYY",
              label: "Date of Birth",
              controller: _date,
              keyboard: "text",
              result: onSubmit,
            ),
            TextFieldWidget(
              label: "License",
              controller: _license,
              keyboard: "text",
              result: onSubmit,
            )
          ],
        )),
        Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.black,
                    minimumSize: Size.square(40)),
                onPressed: !_isEnabled
                    ? null
                    : () {
                        if (onResultCheck()) {
                          var data = DriversDetailsData(
                              name: _name.text,
                              dateOfBirth: _date.text,
                              license: _license.text);
                          print("enter");
                        } else {
                          print("do not enter");
                        }
                      },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                )))
      ]),
    );
  }
}
