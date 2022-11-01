import 'package:flutter/material.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/scaffold_default.dart';
import 'package:truckassure/widgets/default/text_simple.dart';
import 'package:truckassure/widgets/default/title_container.dart';

class Success extends StatelessWidget {
  static const ROUTE_NAME = "/success";

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(title: "Membership purchased", widget: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        ImageContainer(),
        Container(
            margin: const EdgeInsets.only(top: 200),
            alignment: Alignment.center,
            child: SimpleText(
                text: "The document will be sent to your email",
                size: 20,
                weight: null))
      ],
    ),);
  }
}
