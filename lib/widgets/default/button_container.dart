import 'package:flutter/material.dart';

class ButtonContainer extends StatefulWidget {
  final Function onPress;
  final bool isEnabled;
  ButtonContainer({this.onPress, this.isEnabled});
  @override
  State<StatefulWidget> createState() => new _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  bool _isButtonDisabled;

  @override
  void initState() {
    super.initState();
    _isButtonDisabled = true;
    print("isEnabled: ${widget.isEnabled}");
  }

  void _enable() {
    setState(() {
      _isButtonDisabled = widget.isEnabled;
      print("isEnabled: ${widget.isEnabled}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        child: ElevatedButton(
            clipBehavior: Clip.hardEdge,
            style: ElevatedButton.styleFrom(
                elevation: 4,
                primary: Theme.of(context).primaryColor,
                minimumSize: const Size.square(40)),
            onPressed: _isButtonDisabled ? null : _enable,
            child: Text(
              "Next",
              style: const TextStyle(color: Colors.white),
            )));
  }
}
