import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/app_color.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  Color backgroundColor;
  Color borderColor;
  double borderRadius;
  VoidCallback onTap;
  bool isShadow;
  final EdgeInsetsGeometry? padding;

  AppCard(
      {required this.child,
      required this.onTap,
      this.backgroundColor = Colors.white,
      this.borderColor = AppColor.gallery,
      this.borderRadius = 4.0,
      this.isShadow = false,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: this.padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              isShadow
                  ? BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  : BoxShadow(),
            ],
          ),
          child: child),
    );
  }
}
