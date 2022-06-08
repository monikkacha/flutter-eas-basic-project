import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/app_color.dart';
import 'package:flutter_basics/utils/app_string.dart';
import 'package:flutter_basics/utils/size_config.dart';

PreferredSize getAppBar() => PreferredSize(
      preferredSize: Size.fromHeight(
          SizeConfig.isTabletDevice ? 200.0 : 100.0), // Set this height
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.aquaSpring,
          border: Border(
            bottom: BorderSide(width: 1.5, color: AppColor.gallery),
          ),
        ),
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 40.0, bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.menu_outlined),
            const SizedBox(width: 10),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(right: 20.0),
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.gallery,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 10, top: 10, right: 10),
                    hintText: AppString.searchHere),
              ),
            )),
            const SizedBox(width: 10),
            const Icon(Icons.account_circle_outlined),
          ],
        ),
      ),
    );
