import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final String keyboard;
  final List<TextInputFormatter> formatterList;
  final Function() result;

  TextFieldWidget(
      {this.hint,
      this.label,
      this.controller,
      this.keyboard,
      this.result,
      this.formatterList});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
            decoration: InputDecoration(
                hintText: widget.hint == null ? null : widget.hint,
                labelText: widget.label,
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorDark)),
            style: const TextStyle(color: Colors.black, fontSize: 25),
            keyboardType: widget.keyboard == "number"
                ? TextInputType.number
                : (widget.keyboard == "email"
                    ? TextInputType.emailAddress
                    : TextInputType.text),
            controller: this.widget.controller,
            autocorrect: false,
            inputFormatters:
                widget.formatterList != null ? widget.formatterList : [],
            onChanged: (_) {
              widget.result();
            },
            onSubmitted: (_) {
              widget.result();
            }));
  }
}
