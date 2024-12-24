import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

// ignore: must_be_immutable
class SwitchAdaptivetile extends StatefulWidget {
  String title;

  bool value;
  final ValueChanged<bool> onChanged;

  SwitchAdaptivetile({
    super.key,
    required this.onChanged,
    required this.title,
    required this.value,
  });

  @override
  State<SwitchAdaptivetile> createState() => _SecurityTileState();
}

class _SecurityTileState extends State<SwitchAdaptivetile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(widget.title, style: AppTextTheme.fs15medium()),
          ),
          Switch.adaptive(
              splashRadius: 10,
              inactiveThumbColor: Appcolors.white,
              activeColor:  Appcolors.white,
              activeTrackColor:  Appcolors.darkgreen,
              inactiveTrackColor: Appcolors.black,
              value: widget.value,
              onChanged: widget.onChanged)
        ]),
      ],
    );
  }
}
