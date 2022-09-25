import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  SimpleText({this.text, this.size, this.weight});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(text,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size,
                    fontWeight: weight != null ? weight : FontWeight.normal))));
  }
}
