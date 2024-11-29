import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';

class SingleTonClass {
  SingleTonClass._init();
  static SingleTonClass get instance => SingleTonClass._init();

  // ---------------- APP COLORS ------------------

  final _appcolors = Appcolors();
  Appcolors get appcolors => _appcolors;
  // ---------------- APP TEXT THEME ------------------

  final _texttheme = AppTextTheme();
  AppTextTheme get textthme => _texttheme;

  // ---------------- APP IMAGE ------------------

  final _Appimg = AppImage();
  AppImage get appimg => _Appimg;
  // ---------------- APP ICON ------------------

  final _Appicon = Appicon();
  Appicon get appicon => _Appicon;
}
