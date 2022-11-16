import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../providers/drivers_details_provider.dart';
import '../default/image_container.dart';
import '../default/scaffold_default.dart';
import '../../models/drivers_details_data.dart';

class DriversDetails extends StatefulWidget {
  static const ROUTE_NAME = "/drivers_details";

  @override
  State<StatefulWidget> createState() => new _DriversDetailsState();
}

class _DriversDetailsState extends State<DriversDetails> {
  bool _isDataValid = false;

  var _driversDetails = DriversDetailsData(
    id: null,
    name: "",
    dateOfBirth: "",
    license: "",
  );

  final _globalForm = GlobalKey<FormState>();

  var dateFormatter = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  void onChangeText(String value) {
    setState(() {
      if (value.isEmpty) {
        _isDataValid = false;
      }
    });
  }

  void _onSubmit() {
    final isValid = _globalForm.currentState.validate();
    if (isValid) {
      _globalForm.currentState.save();
      if (_driversDetails.id == null) {
        _driversDetails = DriversDetailsData(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            name: _driversDetails.name,
            dateOfBirth: _driversDetails.dateOfBirth,
            license: _driversDetails.license);
        Provider.of<DriversDetailsProvider>(context, listen: false)
            .addDriverData(_driversDetails);
      } else {
        Provider.of<DriversDetailsProvider>(context, listen: false)
            .updateDriver(_driversDetails.id, _driversDetails);
        _isDataValid = false;
      }
      _isDataValid = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      title: "Driver's Details",
      widget: Column(children: [
        ImageContainer(),
        Form(
          key: _globalForm,
          child: Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  decoration: InputDecoration(
                    labelText: "Driver's name",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  inputFormatters: null,
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    _driversDetails = DriversDetailsData(
                        id: _driversDetails.id,
                        name: value,
                        dateOfBirth: _driversDetails.dateOfBirth,
                        license: _driversDetails.license);
                  },
                  onFieldSubmitted: (_) => _onSubmit(),
                  onEditingComplete: () {
                    setState(() {});
                  },
                  onChanged: (value) {
                    onChangeText(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter drivers name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  decoration: InputDecoration(
                    labelText: "Date of birth",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    errorStyle: TextStyle(color: Colors.red),
                    hintText: "MM/DD/YYYY",
                  ),
                  inputFormatters: [dateFormatter],
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _driversDetails = DriversDetailsData(
                        id: _driversDetails.id,
                        name: _driversDetails.name,
                        dateOfBirth: value,
                        license: _driversDetails.license);
                  },
                  onChanged: (value) {
                    onChangeText(value);
                  },
                  onEditingComplete: () {
                    setState(() {});
                  },
                  onFieldSubmitted: (_) => _onSubmit(),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter drivers date of birth";
                    }
                    var year = value.substring(6);
                    try {
                      var validation = int.parse(year);
                      if (validation > 1995 || validation < 1940) {
                        return "Wrong date";
                      }
                    } catch (e) {
                      return "Invalid year";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  decoration: InputDecoration(
                      labelText: "License",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      errorStyle: TextStyle(color: Colors.red)),
                  inputFormatters: null,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (_) => _onSubmit(),
                  onSaved: (value) {
                    _driversDetails = DriversDetailsData(
                        id: _driversDetails.id,
                        name: _driversDetails.name,
                        dateOfBirth: _driversDetails.dateOfBirth,
                        license: value);
                  },
                  onChanged: (value) {
                    onChangeText(value);
                  },
                  onEditingComplete: () {
                    setState(() {});
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Licence";
                    }
                    return null;
                  },
                ),
              ],
            ),
          )),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.black,
                    minimumSize: const Size.square(40)),
                onPressed: _isDataValid
                    ? () {
                        if (!_isDataValid) {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text("Submit fields!"),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                    )
                                  ],
                                );
                              });
                        } else {
                          Navigator.of(context).pop();
                        }
                      }
                    : null,
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                )))
      ]),
    );
  }
}
