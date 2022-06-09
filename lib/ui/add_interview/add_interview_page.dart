import 'package:flutter/material.dart';
import 'package:flutter_basics/ui/add_interview/add_interview_form.dart';
import 'package:flutter_basics/utils/app_string.dart';
import 'package:flutter_basics/utils/size_config.dart';

import '../../utils/app_color.dart';

class AddInterviewPage extends StatefulWidget {
  const AddInterviewPage({Key? key}) : super(key: key);

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
          AddInterviewForm(),
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
