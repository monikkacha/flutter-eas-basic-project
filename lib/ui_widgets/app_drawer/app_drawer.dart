import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/utils/app_font_size.dart';
import 'package:flutter_basics/utils/size_config.dart';

import '../../global_model/drawer_menu_items/drawer_menu_items.dart';
import '../../utils/app_color.dart';

class AppDrawer extends StatefulWidget {
  bool isDesktop;

  AppDrawer({this.isDesktop = false});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  double topRightRadius = AppFontSize.value36;
  double bottomRightRadius = AppFontSize.value36;
  double topLeftRadius = AppFontSize.value36;
  double bottomLeftRadius = AppFontSize.value36;
  double sideBarHorizontalPadding = AppFontSize.value20;

  List<DrawerMenuItem> drawerMenuItems = [
    DrawerMenuItem(
        headMenu: "Dashboard",
        subMenu: ["Hr dashboard", "Project dashboard"],
        icon: Icons.dashboard),
    DrawerMenuItem(
        headMenu: "Projects",
        subMenu: ["Tasks", "Timesheet"],
        icon: Icons.receipt_long_outlined),
    DrawerMenuItem(
        headMenu: "Tickets",
        subMenu: ["Tickets View", "Ticket Detail"],
        icon: Icons.local_activity_outlined),
    DrawerMenuItem(
        headMenu: "Our Clients",
        subMenu: ["Clients", "Client Profile"],
        icon: Icons.receipt_long_outlined),
    DrawerMenuItem(
        headMenu: "Employees",
        subMenu: ["Members", "Members Profile"],
        icon: Icons.groups_outlined),
    DrawerMenuItem(
        headMenu: "Accounts",
        subMenu: ["Invoices", "Payments"],
        icon: Icons.account_balance_outlined),
    DrawerMenuItem(
        headMenu: "Payroll",
        subMenu: ["Employee", "Salary"],
        icon: Icons.paid_outlined),
    DrawerMenuItem(
        headMenu: "Other Pages",
        subMenu: ["Apex Charts", "Forms Example"],
        icon: Icons.auto_stories_outlined),
  ];

  @override
  void initState() {
    topRightRadius =
        widget.isDesktop ? AppFontSize.value12 : AppFontSize.value36;
    bottomRightRadius =
        widget.isDesktop ? AppFontSize.value12 : AppFontSize.value36;
    topLeftRadius = widget.isDesktop ? AppFontSize.value12 : 0.0;
    bottomLeftRadius = widget.isDesktop ? AppFontSize.value12 : 0.0;
    sideBarHorizontalPadding = widget.isDesktop ? AppFontSize.value20 : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(topRightRadius),
        bottomRight: Radius.circular(bottomRightRadius),
        topLeft: Radius.circular(topLeftRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
      ),
      child: Drawer(
        backgroundColor: AppColor.eastBay,
        child: ListView(
          children: [
            widget.isDesktop ? height20() : SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sideBarHorizontalPadding),
              child: _buildPanel(),
            )
          ],
        ),
      ),
    );
  }

  _buildPanel() {
    return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: drawerMenuItems.length,
        itemBuilder: (_, index) {
          return ExpansionTile(
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            title: Text(
              drawerMenuItems[index].headMenu,
              style: TextStyle(color: AppColor.carrotOrange),
            ),
            leading: Icon(
              drawerMenuItems[index].icon,
              color: AppColor.carrotOrange,
            ),
            children: [
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: drawerMenuItems[index].subMenu.length,
                  itemBuilder: (_, subIndex) => ListTile(
                          title: Text(
                        drawerMenuItems[index].subMenu[subIndex],
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          );
        });
  }
}
