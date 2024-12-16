import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:whatsapp/screen/Home/HomePage.dart';
import 'package:whatsapp/screen/Home/Homemenutype/Linkeddevice.dart';
import 'package:whatsapp/screen/Home/Homemenutype/NewPayment.dart';
import 'package:whatsapp/screen/Home/Homemenutype/PaymentView.dart';
import 'package:whatsapp/screen/Home/Homemenutype/StarredView.dart';
import 'package:whatsapp/screen/Home/Searchview.dart';
import 'package:whatsapp/screen/Home/SelectContact.dart';
import 'package:whatsapp/screen/Setting/Accounts/AccountView.dart';
import 'package:whatsapp/screen/Setting/Accounts/ExportChat.dart';
import 'package:whatsapp/screen/Setting/Chat/ChatBackup.dart';
import 'package:whatsapp/screen/Setting/Chat/ChatHistory.dart';
import 'package:whatsapp/screen/Setting/Chat/ProfileChatview.dart';
import 'package:whatsapp/screen/Setting/HelpView.dart';
import 'package:whatsapp/screen/Setting/Managestorage.dart';
import 'package:whatsapp/screen/Setting/ProfileNotification.dart';
import 'package:whatsapp/screen/Setting/ProfileView.dart';
import 'package:whatsapp/screen/Setting/Accounts/RequestAccount.dart';
import 'package:whatsapp/screen/Setting/Accounts/SecurityView.dart';
import 'package:whatsapp/screen/Setting/SettingView.dart';
import 'package:whatsapp/screen/Setting/Accounts/Twoverfication.dart';
import 'package:whatsapp/screen/Setting/Accounts/changepassword.dart';
import 'package:whatsapp/screen/Setting/Accounts/deletemyAccount.dart';
import 'package:whatsapp/screen/Setting/Storageanddata.dart';
import 'package:whatsapp/screen/OnBording/Splashview.dart';
import 'package:whatsapp/screen/OnBording/WelcomeView.dart';
import 'package:whatsapp/screen/auth/Login_view.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';
import 'package:whatsapp/screen/auth/completeprofile.dart';

class AppPages {
  static const intialroute = RouteName.splashview;
  static final routes = [
    GetPage(name: RouteName.Loginview, page: () => Loginview()),
    GetPage(name: RouteName.splashview, page: () => splashview()),
    GetPage(name: RouteName.Completeprofile, page: () => Completeprofile()),
    GetPage(name: RouteName.HomePage, page: () => HomePage()),
    GetPage(name: RouteName.WelcomeView, page: () => WelcomeView()),
    // GetPage(name: RouteName.MessageView, page: () => MessageView()),
    GetPage(name: RouteName.SearchView, page: () => SearchView()),
    GetPage(name: RouteName.Selectcontact, page: () => Selectcontact()),
    GetPage(name: RouteName.StarrehView, page: () => StarrehView()),
    GetPage(name: RouteName.PaymentView, page: () => PaymentView()),
    GetPage(name: RouteName.NewPayment, page: () => NewPayment()),
    GetPage(name: RouteName.LinkeddeviceView, page: () => Linkeddevicesview()),
    GetPage(name: RouteName.SettingView, page: () => Settingview()),
    GetPage(name: RouteName.Profileview, page: () => Profileview()),
    GetPage(name: RouteName.AccountView, page: () => AccountView()),
    GetPage(name: RouteName.ProfileChatView, page: () => ChatViewProfile()),
    GetPage(name: RouteName.Storageanddata, page: () => Storageanddata()),
    GetPage(name: RouteName.Managestorage, page: () => Managestorage()),
    GetPage(
        name: RouteName.ProfileNotification, page: () => ProfileNotification()),
    GetPage(name: RouteName.HelpView, page: () => HelpView()),
    GetPage(name: RouteName.ChatHistory, page: () => ChatHistory()),
    GetPage(name: RouteName.ChatBackup, page: () => ChatBackup()),
    GetPage(name: RouteName.ExportChatView, page: () => ExportChatView()),
    GetPage(name: RouteName.SecurityView, page: () => SecurityView()),
    GetPage(name: RouteName.twostepVerfication, page: () => twoVerfication()),
    GetPage(name: RouteName.changepassword, page: () => changepassword()),
    GetPage(name: RouteName.requestaccount, page: () => RequestAccountinfo()),
    GetPage(name: RouteName.deleteaccount, page: () => deleteaccount()),
  ];
}
