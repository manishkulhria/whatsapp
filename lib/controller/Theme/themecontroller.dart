import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:whatsapp/main.dart';
import 'package:whatsapp/model/theme/Thememodel.dart';

class Themecontroller extends GetxController {
  Themecontroller() {
    setcurrenttheme(pref.gettheme());
  }

  Thememodel get _light => Thememodel(title: "Light", mode: ThemeMode.light);
  Thememodel get _dark => Thememodel(title: "Dark", mode: ThemeMode.dark);
  Thememodel get _system => Thememodel(title: "System", mode: ThemeMode.system);

  List<Thememodel> get theme => [_light, _dark, _system];
  // --get
  late Rx<Thememodel> _currenttheme = Rx<Thememodel>(_light);
  Thememodel get currenttheme => _currenttheme.value;

// ------set current theme
  setcurrenttheme(Thememodel model) {
    pref.Settheme(model);
    Get.changeThemeMode(model.mode);
    _currenttheme(model);
  }

  bool isdarkmode() {
    return currenttheme == _dark ||
        (currenttheme == _system &&
            SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark);
  }
}
