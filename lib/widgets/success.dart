import 'package:flutter/material.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/text_simple.dart';
import 'package:truckassure/widgets/default/title_container.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ImageContainer(),
          const SizedBox(
            height: 40,
          ),
          PageTitleContainer(title: "Membership purchased"),
          Container(
              margin: const EdgeInsets.only(top: 200),
              alignment: Alignment.center,
              child: SimpleText(
                  text: "The document will be sent to your emai",
                  size: 20,
                  weight: null))
        ],
      ),
    );
  }
}
