import 'package:get/get.dart';
import 'package:whatsapp/controller/Theme/themecontroller.dart';
import 'package:whatsapp/controller/authcontroller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(Themecontroller());
  }
}
