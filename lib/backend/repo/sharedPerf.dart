import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/model/theme/Thememodel.dart';

class SpData {
  static late SharedPreferences _preferences;
  static const String userid = " ";
  static get _theme => "Theme";

  // --
  SpData._init();
  static SpData get instance => SpData._init();

  //  ----set shared---
  sharedSet() async {
    _preferences = await SharedPreferences.getInstance();
  }
  //  ----set user data---

  static Future setprafdata(String key, String value) async {
    await _preferences.setString(key, value);
  }
//----getuserdata---

  static String getprafdata(String key) {
    return _preferences.getString(key).toString();
  }

//----remove---
  static removeprafdata(String key) async {
    await _preferences.remove(key);
  }

  // ------------THEME SHARED PERF -------

  Settheme(Thememodel model) {
    _preferences.setString(_theme, model.toJson());
  }

  // get---
  Thememodel gettheme() {
    return Thememodel.fromJson(_preferences.getString(_theme) ?? "");
  }
}
