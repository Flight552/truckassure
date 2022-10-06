import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:truckassure/models/drivers_details_data.dart';

class DefaultListCard extends StatelessWidget {
  final List<DriversDetailsData> list;
  final int index;
  const DefaultListCard({this.list, this.index});
  @override
  Widget build(BuildContext context) {
    return const Card();
  }
}
