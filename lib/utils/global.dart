import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/app_color.dart';

void showFloatSnackBar({required BuildContext context, required String text}) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.red.shade300,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
