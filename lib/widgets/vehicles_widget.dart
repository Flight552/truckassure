import 'package:flutter/material.dart';
import 'package:truckassure/widgets/default/scaffold_default.dart';
import '../models/vehicles_data.dart';
import '../widgets/default/image_container.dart';
import '../widgets/default/title_container.dart';
import '../utils/utils.dart';
import '../widgets/default/text_field.dart';

import 'default/drop_down_states.dart';
import 'default/text_simple.dart';

class Vehicles extends StatefulWidget {
  static const ROUTE_NAME = "/vehicles";

  @override
  State<StatefulWidget> createState() => new _VehiclesData();
}

class _VehiclesData extends State<Vehicles> {
  final _vin = TextEditingController();
  final _modelYear = TextEditingController();
  final _makeModel = TextEditingController();
  String _type = "Car";
  bool _isEnabled;
  Utils _utils = Utils();

  void initState() {
    super.initState();
    _isEnabled = _onResultCheck();
  }

  void onSubmit() {
    setState(() {
        _isEnabled = _onResultCheck();
    });
  }

  bool _onResultCheck() {
    return (_utils.isVehicleValid(
        _vin.text, _modelYear.text, _makeModel.text, type: _type));
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(title: "Vehicles and Equipment",widget: Column(
      children: [
        ImageContainer(),
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
                        padding: const EdgeInsets.only(left: 10, top: 20),
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
                                hint: "Choose type",
                                getAmount: (value) {
                                  _type = value;
                                },
                              )
                            ]))
                  ],
                ))),
        Container(
            margin: const EdgeInsets.only(bottom: 20),
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
                        id: DateTime.now().millisecondsSinceEpoch
                            .toString(),
                        vin: _vin.text,
                        modelYear: _modelYear.text,
                        makeModel: _makeModel.text,
                        type: _type);
                    print("enter");
                    Navigator.of(context).pop(data);
                  } else {
                    print("do not enter");
                  }
                },
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    ),);
  }
}
