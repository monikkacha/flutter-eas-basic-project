import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/app_color.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  Color backgroundColor;
  Color borderColor;
  double borderRadius;
  VoidCallback onTap;
  final EdgeInsetsGeometry? padding;

  AppCard(
      {required this.child,
      required this.onTap,
      this.backgroundColor = Colors.white,
      this.borderColor = AppColor.gallery,
      this.borderRadius = 4.0,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: this.padding,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: AppColor.gallery),
              borderRadius: BorderRadius.circular(borderRadius)),
          child: child),
    );
  }
}
