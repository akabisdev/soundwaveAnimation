import 'package:flutter/cupertino.dart';

class WaveState extends ChangeNotifier {
  bool _state = false;

  bool get state => _state;

  updateState(bool value) {
    _state = value;
    notifyListeners();
  }
}