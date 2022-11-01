import 'package:flutter/material.dart';
import 'package:truckassure/models/vehicles_data.dart';
import 'package:truckassure/widgets/membership_widget.dart';
import 'package:truckassure/widgets/vehicles_widget.dart';

import 'default/image_container.dart';
import 'default/text_simple.dart';

class VehiclesList extends StatefulWidget {
  static const ROUTE_NAME = "/vehicle_list";

  @override
  _VehiclesList createState() => _VehiclesList();
}

class _VehiclesList extends State<VehiclesList> {
  List<VehiclesData> _list = [];
  bool _isEnable = false;

  @override
  void initState() {
    super.initState();
    _isEnable = _list.isNotEmpty ? true : false;
  }

  void fillIn(VehiclesData data) {
    setState(() {
      try {
        if(data != null) {
          _list.add(data);
        }
        _isEnable = _list.isNotEmpty ? true : false;
      } catch(e) {

      }
    });
  }

  void  onDelete(String id) {
    setState(() {
      try {
        _list.removeWhere((element) => element.id == id);
        _isEnable = _list.isNotEmpty ? true : false;
      }
      catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Container(
          child: FittedBox(
            alignment: Alignment.center,
            child: Text(
              "Vehicle's List",
              style: TextStyle(fontSize: 25),
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ImageContainer(),
            Expanded(
                child: Container(
              child: _list.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                            key: ValueKey(_list[index].id),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.all(4),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: Container(
                                                width: 130,
                                                child: SimpleText(
                                                    text: "V.I.N:",
                                                    size: 20,
                                                    weight: null)),
                                            title: SimpleText(
                                              text: "${_list[index].vin}",
                                              size: 20,
                                              weight: FontWeight.bold,
                                            ),
                                            trailing: IconButton(
                                              icon: Icon(Icons.delete),
                                              color: Colors.red[900],
                                              splashColor: Colors.red,
                                              onPressed: () {
                                                onDelete(_list[index].id);
                                              },
                                            ),
                                          ),
                                          ListTile(
                                              leading: Container(
                                                  width: 130,
                                                  child: SimpleText(
                                                      text: "Model/Year:",
                                                      size: 20,
                                                      weight: null)),
                                              title: SimpleText(
                                                text:
                                                    "${_list[index].modelYear}",
                                                size: 20,
                                                weight: FontWeight.bold,
                                              )),
                                          ListTile(
                                              leading: Container(
                                                  width: 130,
                                                  child: SimpleText(
                                                      text: "Make/Model:",
                                                      size: 20,
                                                      weight: null)),
                                              title: SimpleText(
                                                text:
                                                    "${_list[index].makeModel}",
                                                size: 20,
                                                weight: FontWeight.bold,
                                              )),
                                          ListTile(
                                              leading: Container(
                                                  width: 130,
                                                  child: SimpleText(
                                                      text: "Type:",
                                                      size: 20,
                                                      weight: null)),
                                              title: SimpleText(
                                                text: "${_list[index].type}",
                                                size: 20,
                                                weight: FontWeight.bold,
                                              ))
                                        ],
                                      )),
                                ],
                              ),
                            ));
                      },
                      itemCount: _list.length,
                    )
                  : Center(
                      child: SimpleText(
                      text: "Vehicle list is empty",
                      size: 24,
                      weight: FontWeight.bold,
                    )),
            )),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        primary: Colors.black,
                        minimumSize: const Size.square(40)),
                    onPressed: !_isEnable
                        ? null
                        : () {
                            if (_list.isNotEmpty) {
                              print("enter");
                              Navigator.of(context)
                                  .pushNamed(MembershipDetails.ROUTE_NAME);
                            } else {
                              print("do not enter");
                            }
                          },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        autofocus: false,
        onPressed: () {
          Navigator.of(context).pushNamed(Vehicles.ROUTE_NAME).then((value) {
            fillIn(value as VehiclesData);
          });
        },
      ),
    );
  }
}
