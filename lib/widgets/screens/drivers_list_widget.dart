import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/drivers_details_provider.dart';
import '../../models/drivers_details_data.dart';
import '../default/image_container.dart';
import '../default/text_simple.dart';
import 'drivers_details_widget.dart';
import 'vehicle_list_widget.dart';

class DriversList extends StatefulWidget {
  static const ROUTE_NAME = "/drivers_list";

  @override
  _DriversList createState() => _DriversList();
}

class _DriversList extends State<DriversList> {
  bool _isEnabled = false;

  void fillIn(List<DriversDetailsData> _list) {
    setState(() {
      _isEnabled = _list.isNotEmpty ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DriversDetailsProvider>(context);
    fillIn(provider.driversData);
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
                  child: provider.driversData.isNotEmpty
                      ? ListView.builder(
                          itemBuilder: (context, index) {
                            print("${provider.driversData.length}");
                            print("List is not empty!!!");
                            var _id = "";
                            var _name = "";
                            var _dateOfBirth = "";
                            var _license = "";
                            try {
                              _id = provider.driversData[index].id;
                              _name = provider.driversData[index].name;
                              _dateOfBirth =
                                  provider.driversData[index].dateOfBirth;
                              _license = provider.driversData[index].license;
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
                                                    provider.deleteDriver(
                                                        provider
                                                            .driversData[index]
                                                            .id);
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
                          itemCount: provider.driversData.length,
                        )
                      : Center(
                          child: const SimpleText(
                          text: "Drivers List is empty",
                          size: 24,
                          weight: FontWeight.bold,
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
                            if (provider.driversData.isNotEmpty) {
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
          Navigator.of(context).pushNamed(DriversDetails.ROUTE_NAME);
        },
      ),
    );
  }
}
