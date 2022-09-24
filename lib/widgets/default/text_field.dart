import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final String keyboard;
  final Function() result;

  TextFieldWidget(
      {this.hint, this.label, this.controller, this.keyboard, this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
            decoration: InputDecoration(
                hintText: hint == null ? null : hint,
                labelText: label,
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorDark)),
            style: TextStyle(color: Colors.black, fontSize: 25),
            keyboardType: keyboard == "number"
                ? TextInputType.number
                : (keyboard == "email"
                    ? TextInputType.emailAddress
                    : TextInputType.text),
            controller: this.controller,
            autocorrect: false,
            onSubmitted: (_) {
              result();
            }));
  }
}