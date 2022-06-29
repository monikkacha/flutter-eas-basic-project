import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../../db/database_repository.dart';
import '../../../utils/app_string.dart';

class HomeStore extends ChangeNotifier {
  List<Interview> interviewList = [];
  late DataBase db = DataBase();
  final pageSize = 6;
  int page = 0;

  HomeStore() {
    _getData();
  }

  _getData() async {
    List<Interview> interviewList = await db
        .pageOfInterviews(
          page,
          pageSize: pageSize,
        )
        .get();
    if (interviewList.isEmpty) {
      _fillWithDummyData();
    } else {
      this.interviewList.addAll(interviewList);
      notifyListeners();
    }
  }



  _fillWithDummyData() {
    List<Interview> interviews = [
      Interview(
          name: 'Natelie Gibson',
          isMale: false,
          role: "UI / UX",
          avatarUrl: AppString.dummyImgUrl1,
          timing: "12:00 - 13:00"),
      Interview(
          name: 'James Willey',
          isMale: false,
          role: "UI / UX",
          avatarUrl: AppString.dummyImgUrl2,
          timing: "12:00 - 13:00"),
      Interview(
          name: 'Mark Welsmon',
          isMale: false,
          avatarUrl: AppString.dummyImgUrl3,
          role: "UI / UX",
          timing: "12:00 - 13:00"),
      Interview(
          name: 'Lee Chan',
          isMale: false,
          role: "UI / UX",
          avatarUrl: AppString.dummyImgUrl5,
          timing: "12:00 - 13:00"),
      Interview(
          name: 'Meave Willey',
          isMale: false,
          role: "UI / UX",
          avatarUrl: AppString.dummyImgUrl6,
          timing: "12:00 - 13:00"),
      Interview(
          name: 'Natelie Portman',
          isMale: false,
          role: "UI / UX",
          avatarUrl: AppString.dummyImgUrl4,
          timing: "12:00 - 13:00"),
    ];

    interviews.forEach((element) async {
      await db.addInterviews(element);
    });
  }
}
