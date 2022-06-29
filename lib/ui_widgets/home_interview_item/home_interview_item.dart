import 'package:flutter/material.dart';
import 'package:flutter_basics/ui/home/model/interview_model.dart';
import 'package:flutter_basics/ui/home/model/interview_popup_model.dart';
import 'package:flutter_basics/utils/app_color.dart';
import 'package:flutter_basics/utils/app_font_size.dart';
import 'package:flutter_basics/utils/app_string.dart';
import 'package:flutter_basics/utils/size_config.dart';

import '../../db/database_repository.dart';

class HomeInterviewItem extends StatelessWidget {
  final Interview item;
  bool isDesktop;

  HomeInterviewItem({required this.item, required this.isDesktop});

  List<InterviewPopupModel> interviewPopupMode = [
    InterviewPopupModel(icon: Icons.edit, label: AppString.edit),
    InterviewPopupModel(icon: Icons.delete, label: AppString.delete),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.pinkAccent,
            radius: 24.0,
            child: CircleAvatar(
              backgroundImage: NetworkImage(item.avatarUrl.toString()),
              radius: 22.0,
            ),
          ),
          width8(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(
                    fontSize:
                        isDesktop ? AppFontSize.value10 : AppFontSize.value14),
              ),
              Text(
                item.role,
                style: TextStyle(
                    fontSize:
                        isDesktop ? AppFontSize.value8 : AppFontSize.value10,
                    color: AppColor.bombay,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.schedule_outlined,
            size: 16.0,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            item.timing,
            style: TextStyle(fontSize: 12.0),
          ),
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppFontSize.value8),
              ),
            ),
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {AppString.edit, AppString.delete}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Row(
                    children: [
                      Icon(
                        choice == AppString.edit ? Icons.edit : Icons.delete,
                        color: AppColor.eastBay,
                        size: AppFontSize.value16,
                      ),
                      width10(),
                      Text(
                        choice,
                        style: TextStyle(fontSize: AppFontSize.value12),
                      )
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case AppString.edit:
        break;
      case AppString.delete:
        break;
    }
  }
}
