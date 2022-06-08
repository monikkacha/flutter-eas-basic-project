import 'package:flutter/material.dart';
import 'package:flutter_basics/ui_widgets/appbar/appbar.dart';

class AddInterview extends StatefulWidget {
  const AddInterview({Key? key}) : super(key: key);

  @override
  State<AddInterview> createState() => _AddInterviewState();
}

class _AddInterviewState extends State<AddInterview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
    );
  }
}
