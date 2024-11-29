import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/constants/icon_image.dart';
import 'package:whatsapp/resources/utils/routes/routename.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Appcolors.white,
        backgroundColor: Appcolors.darkgreen,
        title: Text("Payments"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "History",
                  style: AppTextTheme.fs13Normal()
                      .copyWith(color: Appcolors.darkgreen),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(Appicon.PaymentHistory)),
              Gap(20),
              Center(
                child: Text(
                  "No payment history",
                  style:
                      AppTextTheme.fs13Normal().copyWith(color: Appcolors.grey),
                ),
              ),
              Gap(5),
              Divider(
                thickness: 5,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Payment method",
                    style: AppTextTheme.fs12Normal()
                        .copyWith(color: Appcolors.darkgreen),
                  )),
              ListTile(
                  leading: Icon(
                    Icons.security,
                    color: Appcolors.darkgreen,
                    size: 40,
                  ),
                  title: Text.rich(TextSpan(children: [
                    TextSpan(
                      text:
                          "To protect your security. WhatsApp does not store upi pin or full bank account number.",
                      style: AppTextTheme.fs12Normal(),
                    ),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => print("dpkfj"),
                        text: "Learn more",
                        style: AppTextTheme.fs14Normal()
                            .copyWith(color: Appcolors.blue)),
                  ]))),
              Gap(7),
              ListTile(
                  leading: Icon(
                    Icons.add_circle_outline,
                    color: Appcolors.darkgreen,
                    size: 35,
                  ),
                  title: Text(
                    "Add payment method",
                    style: AppTextTheme.fs12Normal(),
                  )),
              Divider(
                thickness: 5,
              ),
              ListTile(
                  leading: Icon(
                    Icons.help_outline,
                    color: Appcolors.darkgreen,
                    size: 40,
                  ),
                  title: Text(
                    "Help",
                    style: AppTextTheme.fs12Normal(),
                  )),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Appicon.Bhim),
                  Image.asset(Appicon.upi),
                ],
              ),
              Gap(100),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                        backgroundColor: Appcolors.darkgreen),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.NewPayment);
                    },
                    icon: Image.asset(Appicon.payment),
                    label: Text(
                      "NEW PAYMENT",
                      style: AppTextTheme.fs12Normal()
                          .copyWith(color: Appcolors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
