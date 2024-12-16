import 'package:get/get.dart';
import 'package:whatsapp/model/messagemodel.dart';

class MessageController extends GetxController {
  var _message = Message().obs;
  Message get message => _message.value;
  void setUser(Message msgdata) {
    _message.value = msgdata;
  }
}
