import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:whatsapp/Components/CommonBtn.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';
import 'package:whatsapp/resources/validators/app_validator.dart';

class Newcontact extends StatelessWidget {
  const Newcontact({super.key});

  @override
  Widget build(BuildContext context) {
    String data = "";
    TextEditingController _phncontroller = TextEditingController();
    return Scaffold(
      appBar:
          AppBar(title: Text("New contect", style: AppTextTheme.fs20Normal())),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
          child: CommonBtn(title: "Save", onPressed: () {})),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 13),
        children: [
          TextButton(
              onPressed: () {
                showCountryPicker(
                    context: context,
                    showPhoneCode: true,
                    searchAutofocus: false,
                    onSelect: (value) {
                      data = value.displayName;
                    });
              },
              child: Text(data)),
          IntlPhoneField(
              keyboardType: TextInputType.phone,
              validator: (v) =>
                  TextValidator().validator("Please Enter your Phone no."),
              controller: _phncontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Appcolors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Appcolors.darkgreen),
                      borderRadius: BorderRadius.circular(20)))),
        ],
      ),
    );
  }
}
