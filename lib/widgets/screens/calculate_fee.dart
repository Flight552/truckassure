import 'package:flutter/material.dart';
import 'package:truckassure/widgets/default/scaffold_default.dart';
import '../default/text_simple.dart';

class CalculateFee extends StatefulWidget {
  static const ROUTE_NAME = "/calculate_fee";
  final String getFee;
  CalculateFee({this.getFee});
  @override
  State<StatefulWidget> createState() => _CalculateFeeState();
}

class _CalculateFeeState extends State<CalculateFee> {
  String txt;

  void onSubmit(String change) {
    setState(() {
      txt = change;
    });
  }

  Widget build(BuildContext context) {
    return ScaffoldDefault(title: "Membership Fee",widget: Container(
        child: SimpleText(
          text: txt,
          size: 25,
          weight: FontWeight.bold,
        )),);
  }
}
