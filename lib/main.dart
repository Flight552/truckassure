import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckassure/models/drivers_details_data.dart';
import 'package:truckassure/models/vehicles_data.dart';
import 'package:truckassure/providers/company_details_provider.dart';
import 'package:truckassure/providers/drivers_details_provider.dart';
import 'package:truckassure/providers/state_notifier.dart';
import 'package:truckassure/providers/vehicle_details_provider.dart';
import 'package:truckassure/widgets/calculate_fee.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CompanyDetailsProvider()),
        ChangeNotifierProvider.value(value: DriversDetailsProvider()),
        ChangeNotifierProvider.value(value: VehicleDetailsProvider()),
        ChangeNotifierProvider.value(value: StateNotifier()),
      ],
      child: MaterialApp(
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
        routes: {
          "/": (ctx) => CompanyWidget(),
          DriversDetails.ROUTE_NAME: (ctx) => DriversDetails(),
          DriversList.ROUTE_NAME: (ctx) => DriversList(),
          Vehicles.ROUTE_NAME: (ctx) => Vehicles(),
          VehiclesList.ROUTE_NAME: (ctx) => VehiclesList(),
          MembershipDetails.ROUTE_NAME: (ctx) => MembershipDetails(),
          CalculateFee.ROUTE_NAME: (ctx) => CalculateFee(),
          CreditCard.ROUTE_NAME: (ctx) => CreditCard(),
          Success.ROUTE_NAME: (ctx) => Success()
        },
      ),
    );
  }
}
