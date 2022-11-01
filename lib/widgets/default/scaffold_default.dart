import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldDefault extends StatelessWidget {
  final Widget widget;
  final String title;

  ScaffoldDefault({this.title,this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Container(
          child: FittedBox(
            alignment: Alignment.center,
            child: Text(title, style: TextStyle(
              fontSize: 25
            ),),
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        padding: EdgeInsets.all(10),
        child: widget,
      ),
    );
  }
}
