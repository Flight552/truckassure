import 'package:flutter/material.dart';
import 'package:truckassure/models/drivers_details_data.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/text_simple.dart';
import 'package:truckassure/widgets/default/title_container.dart';

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
                                                leading: Container(
                                                    width: 130,
                                                    child: SimpleText(
                                                        text: "Name:",
                                                        size: 20,
                                                        weight: null)),
                                                title: SimpleText(
                                                  text: "${list[index].name}",
                                                  size: 20,
                                                  weight: FontWeight.bold,
                                                ),
                                                trailing: IconButton(
                                                  icon: Icon(Icons.delete),
                                                  color: Colors.red[900],
                                                  splashColor: Colors.red,
                                                  onPressed: () {},
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
                                                    text:
                                                        "${list[index].dateOfBirth}",
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
                                                    text:
                                                        "${list[index].license}",
                                                    size: 20,
                                                    weight: FontWeight.bold,
                                                  ))
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        autofocus: false,
        onPressed: () {},
      ),
    );
  }
}
