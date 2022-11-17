import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/vehicle_details_provider.dart';
import '../default/scaffold_default.dart';
import '../../models/vehicles_data.dart';
import '../default/image_container.dart';
import '../../utils/utils.dart';
import '../default/text_field.dart';

import '../default/drop_down_states.dart';
import '../default/text_simple.dart';

class Vehicles extends StatefulWidget {
  static const ROUTE_NAME = "/vehicles";

  @override
  State<StatefulWidget> createState() => new _VehiclesData();
}

class _VehiclesData extends State<Vehicles> {
  String _type = "Car";
  bool _isDataValid = false;
  final _yearController = TextEditingController();
  final _modelController = TextEditingController();
  final _typeController = TextEditingController();
  final _globalForm = GlobalKey<FormState>();

  VehiclesData _vehicleData;

  //  VehiclesData(id: null, vin: "", modelYear: "", makeModel: "", type: "");

  void onChangeText(String value) {
    if (value.isEmpty) {
      setState(() {
        _isDataValid = false;
      });
    }
  }

  void _onSubmit() {
    final isValid = _globalForm.currentState.validate();
    if (isValid) {
      _globalForm.currentState.save();
      print("Checking id = ${_vehicleData.id}");
      if (_vehicleData.id == null) {
        _vehicleData = VehiclesData(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            vin: _vehicleData.vin,
            modelYear: _vehicleData.modelYear,
            makeModel: _vehicleData.makeModel,
            type: _type);
        Provider.of<VehicleDetailsProvider>(context, listen: false)
            .addVehicleData(_vehicleData);
      } else {
        Provider.of<VehicleDetailsProvider>(context, listen: false)
            .updateVehicle(_vehicleData.id, _vehicleData);
        _isDataValid = false;
      }
      _isDataValid = true;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  var text = "some text";

  void fillIn() {
    var result =
        Provider.of<VehicleDetailsProvider>(context, listen: false).getVehicle;
    setState(() {
      if (result != null) {
        print(result.makeModel);
        _yearController.text = result.modelYear;
        _modelController.text = result.makeModel;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var result =
        Provider.of<VehicleDetailsProvider>(context).getVehicle;
    return ScaffoldDefault(
      title: "Vehicles and Equipment",
      widget: Column(
        children: [
          ImageContainer(),
          Expanded(
              child: SingleChildScrollView(
                  child: Form(
            key: _globalForm,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  decoration: InputDecoration(
                    labelText: "V.I.N",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  inputFormatters: null,
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    _vehicleData = VehiclesData(
                        id: _vehicleData.id,
                        vin: value,
                        modelYear: _vehicleData.modelYear,
                        makeModel: _vehicleData.makeModel,
                        type: _type);
                  },
                  onFieldSubmitted: (_) {
                    _onSubmit();
                  },
                  onEditingComplete: () {
                    setState(() {});
                  },
                  onChanged: (value) {
                    fillIn();
                    onChangeText(value);
                    try {
                      final vin = "JH4DA9470PS008042";
                      Future.delayed(Duration(milliseconds: 500)).then((_) {
                        Provider.of<VehicleDetailsProvider>(context,
                                listen: false)
                            .getVin(value);
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter V.I.N";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _yearController,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  decoration: InputDecoration(
                    labelText: "Model / Year",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  inputFormatters: null,
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    _vehicleData = VehiclesData(
                        id: _vehicleData.id,
                        vin: _vehicleData.vin,
                        modelYear: value,
                        makeModel: _vehicleData.makeModel,
                        type: _vehicleData.type);
                  },
                  onFieldSubmitted: (_) {
                    _onSubmit();
                  },
                  onEditingComplete: () {
                    setState(() {});
                  },
                  onChanged: (value) {
                    onChangeText(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Model / Year";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _modelController,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  decoration: InputDecoration(
                    labelText: "Make / Model",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  inputFormatters: null,
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    _vehicleData = VehiclesData(
                        id: _vehicleData.id,
                        vin: _vehicleData.vin,
                        modelYear: _vehicleData.modelYear,
                        makeModel: value,
                        type: _vehicleData.type);
                  },
                  onFieldSubmitted: (_) {
                    _onSubmit();
                  },
                  onChanged: (value) {
                    onChangeText(value);
                  },
                  onEditingComplete: () {
                    setState(() {});
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter make / model";
                    }
                    return null;
                  },
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
                              _onSubmit();
                            },
                          )
                        ]))
              ],
            ),
          ))),
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4,
                      primary: Colors.black,
                      minimumSize: Size.square(40)),
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
        ],
      ),
    );
  }
}
