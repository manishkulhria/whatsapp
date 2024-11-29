import 'package:flutter/material.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

// ignore: must_be_immutable
class CheckBoxListTile extends StatelessWidget {
  bool CheckboxValue;
  String title;
  CheckBoxListTile(
      {super.key, required this.CheckboxValue, required this.title});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, restate) => CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          activeColor: Appcolors.darkgreen,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(title,
              style: AppTextTheme.fs11Normal().copyWith(color: Appcolors.grey)),
          value: CheckboxValue,
          onChanged: (value) => restate(() {
                CheckboxValue = !CheckboxValue;
              })),
    );
  }
}
