import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wildSand,
      appBar: getAppBar(),
      body: ListView(
        children: [],
      ),
    );
  }

  PreferredSize getAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(60), // Set this height
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
          color: AppColor.wildSand,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.menu_outlined),
              SizedBox(width: 10),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(right: 20.0),
                height: 48.0,
                decoration: BoxDecoration(
                  color: AppColor.gallery,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Search Here..."),
                    )),
                    Icon(Icons.search)
                  ],
                ),
              )),
              SizedBox(width: 10),
              Icon(Icons.account_circle_outlined),
            ],
          ),
        ),
      );
}
