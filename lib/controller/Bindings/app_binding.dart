import 'package:get/get.dart';
import 'package:whatsapp/controller/authcontroller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
   
  }
}
