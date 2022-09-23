import 'package:flutter/material.dart';
import 'package:truckassure/models/drivers_details_data.dart';
import 'package:truckassure/widgets/company_widget.dart';
import 'package:truckassure/widgets/drivers_details_widget.dart';
import 'package:truckassure/widgets/drivers_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TruckAssure',
      theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorDark: Colors.grey.shade800,
          fontFamily: "TruckSans",
          textTheme: ThemeData.dark().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: "TruckSans",
                  fontWeight: FontWeight.normal,
                  fontSize: 25),
              button: TextStyle(color: Colors.white))),
      home: MyHomePage(title: 'Truck Assure'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: /*CompanyWidget()*/ DriversList(
      list: [
        DriversDetailsData(
            name: "Andrey", dateOfBirth: "07/31/1979", license: "123456"),
        DriversDetailsData(
            name: "Elton John Malkovich",
            dateOfBirth: "07/31/1979",
            license: "123456")
      ],
    )));
  }
}
