import 'package:whatsapp/model/authmodel.dart';

abstract class Authentication {
  // Future<Usermodel> login({required String Phoneno});
  Future<Usermodel> signup({required Usermodel user});
}


