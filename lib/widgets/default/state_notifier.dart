import 'package:flutter/foundation.dart';

class StateNotifier extends ChangeNotifier {
  String myText = "0";

  void changeText(String text) {
    myText = text;
    notifyListeners();
  }
}
