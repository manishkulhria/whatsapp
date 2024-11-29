import 'package:flutter/material.dart';

class AllController extends ChangeNotifier {
  var _themedata = ThemeMode.light;
  ThemeMode get themedata => _themedata;
  setthemedata(themedata) {
    _themedata = themedata;
    notifyListeners();
  }
}
