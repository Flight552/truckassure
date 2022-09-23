import 'package:flutter/material.dart';
import 'package:truckassure/models/drivers_details_data.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/title_container.dart';
import 'package:truckassure/widgets/default/text.dart';

class DriversList extends StatelessWidget {
  final List<DriversDetailsData> list;
  DriversList({this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ImageContainer(),
            PageTitleContainer(
              title: "Driver's List",
            ),
            Expanded(
              child: Container(
                  child: list.isNotEmpty
                      ? ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(4),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: Text(
                                                  "Name:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                                title: Text(
                                                  "${list[index].name}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                trailing: IconButton(
                                                  icon: Icon(Icons.delete),
                                                  color: Colors.red,
                                                ),
                                              ),
                                              ListTile(
                                                leading: Text(
                                                  "Date of birth:",
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                                title: Text(
                                                  "${list[index].dateOfBirth}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Text(
                                                  "License:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                                title: Text(
                                                  "${list[index].license}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ));
                          },
                          itemCount: list.length,
                        )
                      : Text("List is empty")),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add)),
    );
  }
}
