import 'package:flutter/material.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

// ignore: must_be_immutable
class RadioRow extends StatefulWidget {
  String tittle;
  var radiovalue;
  Function(String) ontap;
  RadioRow(
      {super.key,
      required this.radiovalue,
      required this.tittle,
      required this.ontap});

  @override
  State<RadioRow> createState() => _RadioRowState();
}

class _RadioRowState extends State<RadioRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            activeColor: Appcolors.darkgreen,
            value: widget.tittle,
            groupValue: widget.radiovalue,
            onChanged: (v) => {widget.ontap(v.toString())}),
        Text(
          widget.tittle,
          style: AppTextTheme.fs13Normal().copyWith(color: Appcolors.grey),
        )
      ],
    );
  }
}
