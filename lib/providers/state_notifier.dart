import 'package:flutter/foundation.dart';

class StateNotifier extends ChangeNotifier {
  String _myText = "0";

  void changeText(String text) {
    _myText = text;
    notifyListeners();
  }

  String get myText {
    return _myText;
  }
}
