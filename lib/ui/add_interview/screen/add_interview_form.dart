import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_basics/db/database_repository.dart';
import 'package:flutter_basics/ui/home/screen/home_page.dart';
import 'package:flutter_basics/ui_widgets/app_button.dart';
import 'package:flutter_basics/ui_widgets/app_card/app_card.dart';
import 'package:flutter_basics/utils/app_font_size.dart';
import 'package:flutter_basics/utils/global.dart';
import 'package:flutter_basics/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';
import '../store/add_interview_store.dart';

class AddInterviewForm extends StatefulWidget {
  Interview? interview;

  bool isDesktop;

  @override
  State<AddInterviewForm> createState() => _AddInterviewFormState();

  AddInterviewForm({this.isDesktop = false, this.interview});
}

class _AddInterviewFormState extends State<AddInterviewForm> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  double _currentSliderValue = 20;
  String defaultGender = AppString.male;
  late AddInterviewStore addInterviewStore;

  TextEditingController nameController = TextEditingController();
  TextEditingController avatarController = TextEditingController();

  List<String> roleArray = [
    "Select a role",
    "UI/UX Designer",
    "Flutter Developer",
    "IOS Developer",
    "React Developer",
    "Node Developer",
    "Laravel Developer"
  ];

  String currentRole = "";

  @override
  void initState() {
    currentRole = roleArray[0];
    checkForUpdate();
    addInterviewStore = Provider.of<AddInterviewStore>(context, listen: false);
  }

  checkForUpdate() {
    if (widget.interview == null) return;
    nameController.text = widget.interview!.name;
    avatarController.text = widget.interview!.avatarUrl!;
    currentRole = widget.interview!.role;
    _currentSliderValue = widget.interview!.productivity.toDouble();
    defaultGender =
        widget.interview!.isMale ? AppString.male : AppString.female;
    startTime = convertStringIntoTime(widget.interview!.timing.split("-")[0]);
    endTime = convertStringIntoTime(widget.interview!.timing.split("-")[1]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppFontSize.value12, vertical: AppFontSize.value12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isDesktop
                  ? Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  : SizedBox(),
              Text(AppString.name),
              height8(),
              Container(
                height: AppFontSize.value30,
                decoration: BoxDecoration(
                  color: AppColor.gallery,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 10, top: 10, right: 10),
                        hintText: AppString.nameHint),
                  ),
                ),
              ),
              height16(),
              Text(AppString.avatarUrl),
              height8(),
              Container(
                height: AppFontSize.value30,
                decoration: BoxDecoration(
                  color: AppColor.gallery,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: TextField(
                    controller: avatarController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 10, top: 10, right: 10),
                        hintText: AppString.avatarUrlHint),
                  ),
                ),
              ),
              height16(),
              Text(AppString.role),
              height8(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppFontSize.value12),
                height: AppFontSize.value30,
                decoration: BoxDecoration(
                  color: AppColor.gallery,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 6,
                    top: 6,
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    value: currentRole,
                    isExpanded: true,
                    items: roleArray.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      currentRole = newValue ?? roleArray[0];
                      setState(() {});
                    },
                  ),
                ),
              ),
              height16(),
              _getTimeSelection(),
              height16(),
              Text(AppString.productivity),
              height8(),
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 20,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              height16(),
              Text(AppString.gender),
              height8(),
              getGender(),
              height16(),
              AppButton(
                  onTap: () => scheduleInterview(),
                  text: AppString.scheduleInterview),
            ],
          ),
        ),
        onTap: () {});
  }

  _selectTime(isStartTime) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != startTime) {
      if (isStartTime)
        startTime = timeOfDay;
      else
        endTime = timeOfDay;
      setState(() {});
    }
  }

  _getTimeSelection() {
    return Row(
      children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(AppString.startTime),
            height8(),
            _timeButton("${startTime.hour}:${startTime.minute}", true),
          ]),
        ),
        width12(),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(AppString.endTime),
            height8(),
            _timeButton("${endTime.hour}:${endTime.minute}", false),
          ]),
        ),
      ],
    );
  }

  _timeButton(time, isStartTime) => GestureDetector(
        onTap: () => _selectTime(isStartTime),
        child: Container(
          height: AppFontSize.value40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.gallery,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Stack(
            children: [
              Container(
                height: AppFontSize.value40,
                width: AppFontSize.value40,
                decoration: BoxDecoration(
                  color: AppColor.eastBay,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  child: Text(
                    time,
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      );

  getGender() => Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => AppColor.eastBay),
                groupValue: defaultGender,
                value: AppString.male,
                onChanged: (newValue) {
                  defaultGender = newValue.toString();
                  setState(() {});
                },
              ),
              title: Text(AppString.male),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => AppColor.eastBay),
                focusColor: AppColor.eastBay,
                groupValue: defaultGender,
                value: AppString.female,
                onChanged: (newValue) {
                  defaultGender = newValue.toString();
                  setState(() {});
                },
              ),
              title: Text(AppString.female),
            ),
          ),
        ],
      );

  scheduleInterview() async {
    if (!validateForm()) return;
    int? id = null;
    if (widget.interview != null) {
      id = widget.interview!.id;
    }
    Interview interview = Interview(
        id: id,
        name: nameController.value.text,
        role: currentRole,
        timing: "${startTime.format(context)} - ${endTime.format(context)}",
        isMale: defaultGender == AppString.male ? true : false,
        productivity: _currentSliderValue.toInt(),
        avatarUrl: AppString.robotDummyImgUrl);
    bool isSuccess = false;

    if (widget.interview == null) {
      isSuccess = await addInterviewStore.addInterviewItem(interview);
    } else {
      isSuccess = await addInterviewStore.updateInterviewItem(interview);
    }

    if (isSuccess) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => HomePage(),
        ),
        (route) => true,
      );
    } else {
      showFloatSnackBar(context: context, text: "Something went wrong");
    }
  }

  bool validateForm() {
    String name = nameController.value.text;
    String avatarUrl = avatarController.value.text;
    if (name.isEmpty) {
      showFloatSnackBar(context: context, text: AppString.fillName);
      return false;
    } else if (avatarUrl.isEmpty) {
      showFloatSnackBar(context: context, text: AppString.fillAvatar);
      return false;
    } else if (currentRole == roleArray[0]) {
      showFloatSnackBar(context: context, text: AppString.fillCurrentRole);
      return false;
    }
    return true;
  }

  static TimeOfDay convertStringIntoTime(String stringTime) {
    stringTime = stringTime.trim();
    TimeOfDay time = TimeOfDay(
        hour: int.parse(stringTime.split(":")[0]),
        minute: int.parse(stringTime.split(":")[1]));
    return time;
  }

}
