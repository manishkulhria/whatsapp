import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Classes/Singletonclass.dart';
import 'package:whatsapp/Classes/Themeclass.dart';
import 'package:whatsapp/backend/repo/sharedPerf.dart';
import 'package:whatsapp/controller/Bindings/app_binding.dart';
import 'package:whatsapp/firebase_options.dart';
import 'package:whatsapp/resources/utils/app_config.dart';
import 'package:whatsapp/resources/utils/routes/route.dart';

late SingleTonClass appstyle;
SpData pref = SpData.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await pref.sharedSet();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    appstyle = SingleTonClass.instance;
    // final controller = Get.put(ThemeController());

    return ScreenUtilInit(
        child: GetMaterialApp(
            themeMode: ThemeMode.light,
            // controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
            theme: Gettheme.lightTheme,
            darkTheme: Gettheme.darkTheme,
            initialRoute: AppPages.intialroute,
            getPages: AppPages.routes,
            title: 'Flutter Demo',
            initialBinding: AppBindings()),
        designSize: Size(AppConfig.screenwidth, AppConfig.screenHeight));
  }
}
