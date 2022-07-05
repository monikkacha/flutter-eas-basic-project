import 'package:flutter/material.dart';
import 'package:flutter_basics/db/database_repository.dart';
import 'package:flutter_basics/ui/add_interview/screen/add_interview_form.dart';
import 'package:flutter_basics/utils/app_string.dart';
import 'package:flutter_basics/utils/size_config.dart';

import '../../../utils/app_color.dart';

class AddInterviewPage extends StatefulWidget {
  Interview? interview;

  AddInterviewPage({this.interview});

  @override
  State<AddInterviewPage> createState() => _AddInterviewPageState();
}

class _AddInterviewPageState extends State<AddInterviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.aquaSpring,
      appBar: AppBar(
        title: Text(AppString.addInterview),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        children: [
          height12(),
          AddInterviewForm(
            interview: widget.interview,
          ),
          height30(),
          Center(
              child: Text(
            AppString.allFieldsRequired,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.pickledBluewood),
          )),
          height30(),
        ],
      ),
    );
  }
}
