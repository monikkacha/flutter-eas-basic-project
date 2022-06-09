import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_font_size.dart';

class AppButton extends StatelessWidget {
  VoidCallback onTap;
  Color backgroundColor;
  Color textColor;
  String text;

  AppButton(
      {required this.onTap,
      required this.text,
      this.backgroundColor = AppColor.eastBay,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: this.onTap,
        child: Ink(
          height: AppFontSize.value48,
          decoration: BoxDecoration(
            color: this.backgroundColor,
            borderRadius: BorderRadius.circular(AppFontSize.value4),
          ),
          child: Center(
              child: Text(
            this.text,
            style: TextStyle(color: this.textColor),
          )),
        ),
      ),
    );
  }
}
