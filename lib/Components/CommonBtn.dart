import 'package:flutter/material.dart';
import 'package:whatsapp/constants/Appcolors.dart';
import 'package:whatsapp/constants/TextTheme.dart';

// ignore: must_be_immutable
class CommonBtn extends StatelessWidget {
  String title;
  Color? backgroundcol, textcol;
  Function onPressed;
  bool minimumSize;
  CommonBtn(
      {super.key,
      required this.title,
      required this.onPressed,
      this.textcol,
      this.minimumSize = false,
      this.backgroundcol});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: minimumSize
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(4)),
            backgroundColor:
                backgroundcol == null ? Appcolors.darkgreen : backgroundcol,
            minimumSize: minimumSize
                ? Size(MediaQuery.of(context).size.width, 40)
                : null),
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: minimumSize
              ? AppTextTheme.fs14Normal()
                  .copyWith(color: textcol != null ? textcol : Appcolors.white)
              : AppTextTheme.fs12Normal()
                  .copyWith(color: textcol != null ? textcol : Appcolors.white),
        ));
  }
}
