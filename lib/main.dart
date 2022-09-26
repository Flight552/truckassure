import 'package:flutter/material.dart';
import 'package:truckassure/models/drivers_details_data.dart';
import 'package:truckassure/models/vehicles_data.dart';
import 'package:truckassure/widgets/company_widget.dart';
import 'package:truckassure/widgets/credit_card.dart';
import 'package:truckassure/widgets/drivers_details_widget.dart';
import 'package:truckassure/widgets/drivers_list_widget.dart';
import 'package:truckassure/widgets/success.dart';
import 'package:truckassure/widgets/vehicle_list_widget.dart';
import 'package:truckassure/widgets/vehicles_widget.dart';
import 'package:truckassure/widgets/membership_widget.dart';

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
    return Scaffold(body: SafeArea(child: CreditCard()));
  }
}

//         child: VehiclesList(
            //   list: [
            //     VehiclesData(
            //         vin: "123-aadfdsaaadf",
            //         makeModel: "Toyota Fortuner",
            //         modelYear: "2022",
            //         type: "CrossOver"),
            //     VehiclesData(
            //         vin: "432-aadfdsfsdfsdfsdfsdaaadf",
            //         makeModel: "Mersedes CRV",
            //         modelYear: "2022",
            //         type: "CrossOver")
            //   ],
            // )
            // Success()
            // child: Vehicles()
            // child: CompanyWidget()
            // child: DriversDetails()
            // child: MembershipDetails()
    //                child: DriversList(
    //   list: [
    //     DriversDetailsData(
    //         name: "Ozzy Osborne", dateOfBirth: "07/31/1979", license: "123456"),
    //     DriversDetailsData(
    //         name: "Curt Donald Cobain",
    //         dateOfBirth: "07/31/1979",
    //         license: "123456")
    //   ],
    // )