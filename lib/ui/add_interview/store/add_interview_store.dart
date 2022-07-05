import 'package:flutter/material.dart';

import '../../../db/database_repository.dart';

class AddInterviewStore extends ChangeNotifier {
  List<Interview> interviewList = [];
  late DataBase db = DataBase.instance;

  Future<bool> addInterviewItem(Interview item) async {
    try {
      await db.addInterviews(item);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateInterviewItem(Interview item) async {
    try {
      bool isSuccess = await db.updateInterviews(item);
      return isSuccess;
    } catch (e) {
      return false;
    }
  }
}
