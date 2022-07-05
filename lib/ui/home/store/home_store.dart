import 'package:flutter/material.dart';

import '../../../db/database_repository.dart';
import '../../../utils/app_string.dart';

class HomeStore extends ChangeNotifier {

  List<Interview> interviewList = [];
  late DataBase db = DataBase.instance;
  int availableDataSize = 0;
  final pageSize = 6;
  int page = 1;

  getData() async {
    List<Interview> _interviewList = await db.allTodoEntries();
    if (_interviewList.isEmpty)
      await _fillWithDummyData();
    else
      availableDataSize = _interviewList.length;

    this.interviewList = [];
    this.interviewList = _interviewList;
    notifyListeners();

    // TODO :: for pagination
    // _interviewList = await db.pageOfInterviews(page, pageSize: pageSize).get();
    // List<Interview> tempList = this.interviewList;
    // tempList.addAll(_interviewList);
    // this.interviewList = [];
    // notifyListeners();
    // this.interviewList = tempList;
    // page += pageSize;
    // notifyListeners();
  }

  _fillWithDummyData() async {
    List<Interview> interviews = [
      Interview(
          name: 'Natelie Gibson',
          isMale: false,
          role: "UI / UX",
          avatarUrl: AppString.dummyImgUrl1,
          productivity: 50,
          timing: "12:00 - 13:00"),
      Interview(
          name: 'James Willey',
          isMale: false,
          role: "UI / UX",
          productivity: 50,
          avatarUrl: AppString.dummyImgUrl2,
          timing: "12:00 - 13:00"),
      Interview(
          name: 'Mark Welsmon',
          isMale: false,
          avatarUrl: AppString.dummyImgUrl3,
          role: "UI / UX",
          productivity: 50,
          timing: "12:00 - 13:00"),
      Interview(
          name: 'Lee Chan',
          isMale: false,
          role: "UI / UX",
          productivity: 50,
          avatarUrl: AppString.dummyImgUrl5,
          timing: "12:00 - 13:00"),
      Interview(
          name: 'Meave Willey',
          isMale: false,
          role: "UI / UX",
          productivity: 50,
          avatarUrl: AppString.dummyImgUrl6,
          timing: "12:00 - 13:00"),
      Interview(
          name: 'Natelie Portman',
          isMale: false,
          role: "UI / UX",
          productivity: 50,
          avatarUrl: AppString.dummyImgUrl4,
          timing: "12:00 - 13:00"),
    ];

    interviews.forEach((element) async {
      await db.addInterviews(element);
    });

    availableDataSize = interviews.length;
  }

  Future deleteInterview(int index, int id) async {
    try {
      int result = await db.deleteInterviews(interviewList[index]);
      if (result == 1) {
        getData();
      } else {
        print('something went wrong while deleting the interview');
      }
    } catch (e) {
      print('e : $e');
    }
  }

}
