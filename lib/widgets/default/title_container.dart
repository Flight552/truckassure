import 'package:flutter/material.dart';

class PageTitleContainer extends StatelessWidget {
  final String title;
  const PageTitleContainer({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Center(child:
      Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),)
    );
  }
}
