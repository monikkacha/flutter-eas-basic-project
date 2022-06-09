import 'package:flutter/material.dart';

class DrawerMenuItem {
  String headMenu;
  List<String> subMenu;
  IconData icon;

  DrawerMenuItem(
      {required this.headMenu, required this.subMenu, required this.icon});
}
