import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/backend/Apis/Apis.dart';
import 'package:whatsapp/backend/Firebaseresponse/Firebaseresponse.dart';
import 'package:whatsapp/backend/repo/sharedPerf.dart';
import 'package:whatsapp/controller/authcontroller.dart';
import 'package:whatsapp/model/authmodel.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';
import 'package:whatsapp/screen/OnBording/WelcomeView.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Apis.auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text("error==${snapshot.error}"),
          );
        } else if (snapshot.data != null) {
          relogin();
        } else {
          return WelcomeView();
        }
        return SizedBox();
      },
    );
  }

  relogin() async {
    final _controller = Get.find<UserController>();
    final id = SpData.getprafdata(SpData.userid);

    if (id.isNotEmpty) {
      try {
        final db = await Apis.userDocumentRef(id).get();
        if (db.exists) {
          final data =
              Usermodel.fromJson(FirebaseResponseModel.fromResponse(db));
          _controller.setUser(data);
          Get.toNamed(RouteName.HomePage);
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
