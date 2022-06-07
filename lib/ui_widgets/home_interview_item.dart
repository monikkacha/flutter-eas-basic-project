import 'package:flutter/material.dart';
import 'package:flutter_basics/ui/home/model/interview_model.dart';
import 'package:flutter_basics/utils/app_color.dart';

class HomeInterviewItem extends StatelessWidget {
  final InterviewModel item;

  HomeInterviewItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.pinkAccent,
            radius: 28.0,
            child: CircleAvatar(
              backgroundImage: NetworkImage(item.avatarUrl),
              radius: 24.0,
            ),
          ),
          SizedBox(
            width: 14.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                item.role,
                style: TextStyle(
                    fontSize: 12.0,
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
        ],
      ),
    );
  }
}
