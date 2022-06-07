import 'package:flutter/material.dart';
import 'package:flutter_basics/ui/home/model/char_data_model.dart';
import 'package:flutter_basics/ui/home/model/employee_availability_model.dart';
import 'package:flutter_basics/ui/home/model/interview_model.dart';
import 'package:flutter_basics/ui/home/model/toatal_employee_model.dart';
import 'package:flutter_basics/ui_widgets/app_card/app_card.dart';
import 'package:flutter_basics/ui_widgets/home_interview_item.dart';
import 'package:flutter_basics/utils/app_color.dart';
import 'package:flutter_basics/utils/app_string.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  final List<ChartDataModel> chartData = [
    ChartDataModel(2010, 35),
    ChartDataModel(2011, 28),
    ChartDataModel(2012, 34),
    ChartDataModel(2013, 32),
    ChartDataModel(2014, 40)
  ];

  final List<TotalEmployeeModel> totalEmployeeData = [
    TotalEmployeeModel('Man', 64, Colors.blue),
    TotalEmployeeModel('Woman', 36, Colors.pink),
  ];

  // final List<InterviewModel> interviewData = [
  //   InterviewModel(
  //       name: 'Natelie Gibson',
  //       avatarUrl: AppString.dummyImgUrl4,
  //       isMale: false,
  //       role: "UI / UX",
  //       timing: "12:00 - 13:00"),
  //   InterviewModel(
  //       name: 'James Willey',
  //       avatarUrl: AppString.dummyImgUrl1,
  //       isMale: false,
  //       role: "Flutter Developer",
  //       timing: "12:00 - 13:00"),
  //   InterviewModel(
  //       name: 'Mark Welsmon',
  //       avatarUrl: AppString.dummyImgUrl2,
  //       isMale: false,
  //       role: "Backend Developer",
  //       timing: "12:00 - 13:00"),
  //   InterviewModel(
  //       name: 'Lee Chan',
  //       avatarUrl: AppString.dummyImgUrl3,
  //       isMale: false,
  //       role: "Project Manager",
  //       timing: "12:00 - 13:00"),
  //   InterviewModel(
  //       name: 'Meave Willey',
  //       avatarUrl: AppString.dummyImgUrl5,
  //       isMale: false,
  //       role: "HR Manager",
  //       timing: "12:00 - 13:00"),
  //   InterviewModel(
  //       name: 'Natelie Portman',
  //       avatarUrl: AppString.dummyImgUrl6,
  //       isMale: false,
  //       role: "Delievery Lead",
  //       timing: "12:00 - 13:00"),
  // ];

  final List<InterviewModel> interviewData = [
    InterviewModel(
        name: 'Natelie Gibson',
        avatarUrl: AppString.robotDummyImgUrl,
        isMale: false,
        role: "UI / UX",
        timing: "12:00 - 13:00"),
    InterviewModel(
        name: 'James Willey',
        avatarUrl: AppString.robotDummyImgUrl,
        isMale: false,
        role: "Flutter Developer",
        timing: "12:00 - 13:00"),
    InterviewModel(
        name: 'Mark Welsmon',
        avatarUrl: AppString.robotDummyImgUrl,
        isMale: false,
        role: "Backend Developer",
        timing: "12:00 - 13:00"),
    InterviewModel(
        name: 'Lee Chan',
        avatarUrl: AppString.robotDummyImgUrl,
        isMale: false,
        role: "Project Manager",
        timing: "12:00 - 13:00"),
    InterviewModel(
        name: 'Meave Willey',
        avatarUrl: AppString.robotDummyImgUrl,
        isMale: false,
        role: "HR Manager",
        timing: "12:00 - 13:00"),
    InterviewModel(
        name: 'Natelie Portman',
        avatarUrl: AppString.robotDummyImgUrl,
        isMale: false,
        role: "Delievery Lead",
        timing: "12:00 - 13:00"),
  ];

  final List<EmployeeAvailabilityModel> employeeAvailabilityData = [
    EmployeeAvailabilityModel(
        Icons.task_alt_outlined, AppString.attendance, 400),
    EmployeeAvailabilityModel(
        Icons.history_toggle_off_outlined, AppString.lateComing, 17),
    EmployeeAvailabilityModel(Icons.block, AppString.absent, 06),
    EmployeeAvailabilityModel(
        Icons.beach_access_outlined, AppString.leaveApply, 400),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.aquaSpring,
        appBar: getAppBar(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          children: [
            SizedBox(
              height: 20.0,
            ),
            employeesInfo(),
            SizedBox(
              height: 20.0,
            ),
            employeeAvailabilty(),
            SizedBox(
              height: 20.0,
            ),
            totalEmployees(),
            SizedBox(
              height: 20.0,
            ),
            upcomingInterviews(),
            SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }

  employeesInfo() => AppCard(
        onTap: () {},
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                AppString.employInfo,
                style:
                    TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
                height: 240.0,
                child: SfCartesianChart(series: <ChartSeries>[
                  // Renders line chart
                  LineSeries<ChartDataModel, int>(
                      dataSource: chartData,
                      xValueMapper: (ChartDataModel data, _) => data.x,
                      yValueMapper: (ChartDataModel data, _) => data.y)
                ])),
          ],
        ),
      );

  employeeAvailabilty() => AppCard(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Text(
            AppString.employAvailability,
            style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 230.0,
            child: GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: employeeAvailabilityData.length,
                itemBuilder: (BuildContext ctx, index) {
                  EmployeeAvailabilityModel item =
                      employeeAvailabilityData[index];
                  return AppCard(
                    padding: EdgeInsets.only(left: 12.0, top: 12.0),
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(item.icon),
                        Text(
                          item.label,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, letterSpacing: 0.3),
                        ),
                        Text(
                          item.count.toString(),
                          style: TextStyle(fontSize: 12.0),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      onTap: () {});

  PreferredSize getAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(60), // Set this height
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
          color: AppColor.aquaSpring,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.menu_outlined),
              SizedBox(width: 10),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(right: 20.0),
                height: 48.0,
                decoration: BoxDecoration(
                  color: AppColor.gallery,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: AppString.searchHere),
                    )),
                    Icon(Icons.search)
                  ],
                ),
              )),
              SizedBox(width: 10),
              Icon(Icons.account_circle_outlined),
            ],
          ),
        ),
      );

  totalEmployees() => AppCard(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        onTap: () {},
        child: Column(
          children: [
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.totalEmployees,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, letterSpacing: 0.3),
                ),
                Text(
                  "100",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                      fontSize: 20.0),
                ),
              ],
            ),
            Container(
                height: 200.0,
                child: SfCircularChart(
                    legend: Legend(isVisible: true),
                    tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries>[
                      DoughnutSeries<TotalEmployeeModel, String>(
                          enableTooltip: false,
                          dataSource: totalEmployeeData,
                          pointColorMapper: (TotalEmployeeModel data, _) =>
                              data.color,
                          xValueMapper: (TotalEmployeeModel data, _) => data.x,
                          yValueMapper: (TotalEmployeeModel data, _) => data.y,
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ])),
          ],
        ),
      );

  upcomingInterviews() => AppCard(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.0,
          ),
          Text(
            AppString.upcomingInterviews,
            style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
          ),
          SizedBox(
            height: 12.0,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: interviewData.length,
            itemBuilder: (context, index) =>
                HomeInterviewItem(item: interviewData[index]),
            separatorBuilder: (context, index) => Divider(),
          ),
          SizedBox(
            height: 12.0,
          ),
        ],
      ),
      onTap: () {});
}
