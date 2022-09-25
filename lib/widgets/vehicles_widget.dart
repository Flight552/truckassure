import 'package:flutter/material.dart';
import 'package:truckassure/models/vehicles_data.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/title_container.dart';
import 'package:truckassure/utils/utils.dart';
import 'package:truckassure/widgets/default/text_field.dart';

import 'default/drop_down_states.dart';
import 'default/text_simple.dart';

class Vehicles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _VehiclesData();
}

class _VehiclesData extends State<Vehicles> {
  final _vin = TextEditingController();
  final _modelYear = TextEditingController();
  final _makeModel = TextEditingController();
  final _type = TextEditingController();
  bool _isEnabled;
  Utils _utils = Utils();

  void initState() {
    _isEnabled = false;
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

  bool _onResultCheck() {
    return (_utils.isVehicleValid(
        _vin.text, _modelYear.text, _makeModel.text, _type.text));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ImageContainer(),
          PageTitleContainer(title: "Vehicles and Equipment"),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              TextFieldWidget(
                label: "V.I.N",
                controller: _vin,
                keyboard: "text",
                result: onSubmit,
              ),
              TextFieldWidget(
                label: "Model / Year",
                controller: _modelYear,
                keyboard: "text",
                result: onSubmit,
              ),
              TextFieldWidget(
                label: "Make / Model",
                controller: _makeModel,
                keyboard: "text",
                result: onSubmit,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SimpleText(
                          text: "Type",
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                        DropDownItems(
                          choice: "types",
                          getAmount: null,
                        )
                      ]))
            ],
          ))),
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
                          if (_onResultCheck()) {
                            var data = VehiclesData(
                                vin: _vin.text,
                                modelYear: _modelYear.text,
                                makeModel: _makeModel.text,
                                type: _type.text);
                            print("enter");
                          } else {
                            print("do not enter");
                          }
                        },
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
