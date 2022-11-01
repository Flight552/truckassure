import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
