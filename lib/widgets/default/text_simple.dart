import 'package:flutter/material.dart';

class SimpleText extends StatefulWidget {
  final String text;
  final double size;
  final FontWeight weight;
  SimpleText({this.text, this.size, this.weight});

  @override
  State<StatefulWidget> createState() => _SimpleText();
}

class _SimpleText extends State<SimpleText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(widget.text,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: widget.size,
                    fontWeight: widget.weight != null
                        ? widget.weight
                        : FontWeight.normal))));
  }
}
