import 'package:flutter/material.dart';
import '../models/drivers_details_data.dart';
import '../widgets/default/image_container.dart';
import '../widgets/default/text_simple.dart';
import '../widgets/drivers_details_widget.dart';
import '../widgets/vehicle_list_widget.dart';

class DriversList extends StatefulWidget {
  static const ROUTE_NAME = "/drivers_list";

  @override
  _DriversList createState() => _DriversList();
}

class _DriversList extends State<DriversList> {
  List<DriversDetailsData> _list = [];
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    if (_list.isEmpty) {
      print("List is empty!!!");
    } else {
      print("inside init List is not empty!!!");
    }
  }

  void fillIn(DriversDetailsData data) {
    setState(() {
      try {
        if(data != null) {
          _list.add(data);
        }
        _isEnabled = _list.isNotEmpty ? true : false;
      } catch (e) {
        print("data is null");
      }
    });
  }

  void onDelete(String id) {
    setState(() {
      _list.removeWhere((element) => element.id == id);
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
              "Driver's List",
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
                            print("${_list.length}");
                            print("List is not empty!!!");
                            var _id = "";
                            var _name = "";
                            var _dateOfBirth = "";
                            var _license = "";
                            try {
                              _id = _list[index].id;
                              _name = _list[index].name;
                              _dateOfBirth = _list[index].dateOfBirth;
                              _license = _list[index].license;
                            } catch (e) {
                              _id = "-1";
                            }
                            return Card(
                                key: ValueKey(_id),
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
                                                        text: "Name:",
                                                        size: 20,
                                                        weight: null)),
                                                title: SimpleText(
                                                  text: _name,
                                                  size: 20,
                                                  weight: FontWeight.bold,
                                                ),
                                                trailing: IconButton(
                                                  icon: Icon(Icons.delete),
                                                  color: Colors.red[900],
                                                  splashColor: Colors.red,
                                                  onPressed: () {
                                                    onDelete(_list[index].id);
                                                    fillIn(null);
                                                  },
                                                ),
                                              ),
                                              ListTile(
                                                  leading: Container(
                                                      width: 130,
                                                      child: SimpleText(
                                                          text:
                                                              "Date of birth:",
                                                          size: 20,
                                                          weight: null)),
                                                  title: SimpleText(
                                                    text: _dateOfBirth,
                                                    size: 20,
                                                    weight: FontWeight.bold,
                                                  )),
                                              ListTile(
                                                  leading: Container(
                                                      width: 130,
                                                      child: SimpleText(
                                                          text: "License:",
                                                          size: 20,
                                                          weight: null)),
                                                  title: SimpleText(
                                                    text: _license,
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
                          child: const SimpleText(text:
                            "Drivers List is empty",
                            size: 24, weight: FontWeight.bold,
                          ))),
            ),
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
                            if (_list.isNotEmpty) {
                              print("enter");
                              Navigator.of(context)
                                  .pushNamed(VehiclesList.ROUTE_NAME);
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
          Navigator.of(context)
              .pushNamed(DriversDetails.ROUTE_NAME)
              .then((value) {
            fillIn(value as DriversDetailsData);
          });
        },
      ),
    );
  }
}
