import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/app_color.dart';
import 'package:flutter_basics/utils/size_config.dart';

PreferredSize commonAppBar(
        {required child,
        backgroundColor = AppColor.aquaSpring,
        bottomBorderColor = AppColor.gallery}) =>
    PreferredSize(
      preferredSize: Size.fromHeight(
          SizeConfig.isTabletDevice ? 220.0 : 120.0), // Set this height
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            bottom: BorderSide(width: 1.5, color: bottomBorderColor),
          ),
        ),
        padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: SizeConfig.isTabletDevice ? 40.0 : 60.0,
            bottom: 8.0),
        child: child,
      ),
    );
