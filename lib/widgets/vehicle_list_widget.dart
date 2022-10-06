import 'package:flutter/material.dart';
import 'package:truckassure/models/vehicles_data.dart';

import 'default/image_container.dart';
import 'default/text_simple.dart';
import 'default/title_container.dart';

class VehiclesList extends StatelessWidget {
  final List<VehiclesData> list;
  VehiclesList({this.list});
  @override
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
                                key: ValueKey(list[index].id),
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
                                                  text: "${list[index].vin}",
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
                                                          text: "Model/Year:",
                                                          size: 20,
                                                          weight: null)),
                                                  title: SimpleText(
                                                    text:
                                                        "${list[index].modelYear}",
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
                                                        "${list[index].makeModel}",
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
                                                    text: "${list[index].type}",
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
