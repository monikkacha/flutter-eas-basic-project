import 'package:flutter/material.dart';
import 'package:flutter_basics/ui/add_interview/add_interview.dart';
import 'package:flutter_basics/ui/home/model/char_data_model.dart';
import 'package:flutter_basics/ui/home/model/employee_availability_model.dart';
import 'package:flutter_basics/ui/home/model/interview_model.dart';
import 'package:flutter_basics/ui/home/model/toatal_employee_model.dart';
import 'package:flutter_basics/ui_widgets/app_card/app_card.dart';
import 'package:flutter_basics/ui_widgets/appbar/appbar.dart';
import 'package:flutter_basics/ui_widgets/home_interview_item.dart';
import 'package:flutter_basics/utils/app_color.dart';
import 'package:flutter_basics/utils/app_font_size.dart';
import 'package:flutter_basics/utils/app_string.dart';
import 'package:flutter_basics/utils/size_config.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/top_performer_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

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

  List<TopPerformerModel> topPerformerData = [
    TopPerformerModel(
        name: "Luke Short",
        productivity: 95,
        username: "lukes",
        avatarUrl: AppString.dummyImgUrl1),
    TopPerformerModel(
        name: "James William",
        productivity: 80,
        username: "jameswii",
        avatarUrl: AppString.dummyImgUrl2),
    TopPerformerModel(
        name: "Max Lopez",
        productivity: 77,
        username: "lopez22",
        avatarUrl: AppString.dummyImgUrl1),
    TopPerformerModel(
        name: "Megan Heartly",
        productivity: 77,
        username: "heartlymeg",
        avatarUrl: AppString.dummyImgUrl5),
    TopPerformerModel(
        name: "Naomi Scott",
        productivity: 72,
        username: "naomi332",
        avatarUrl: AppString.dummyImgUrl5),
    TopPerformerModel(
        name: "Emma Watson",
        productivity: 65,
        username: "emmawat",
        avatarUrl: AppString.dummyImgUrl6),
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
    SizeConfig().init(context);
    AppFontSize.init();
    return Scaffold(
        backgroundColor: AppColor.aquaSpring,
        appBar: getAppBar(),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          children: [
            const SizedBox(
              height: 20.0,
            ),
            employeesInfo(),
            const SizedBox(
              height: 20.0,
            ),
            employeeAvailabilty(),
            const SizedBox(
              height: 20.0,
            ),
            totalEmployees(),
            const SizedBox(
              height: 20.0,
            ),
            upcomingInterviews(),
            const SizedBox(
              height: 20.0,
            ),
            topPerformers(),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }

  employeesInfo() => AppCard(
        onTap: () {},
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height12(),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                AppString.employInfo,
                style:
                    TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
              ),
            ),
            height12(),
            Container(
                height: 240.0,
                child: SfCartesianChart(series: <ChartSeries>[
                  LineSeries<ChartDataModel, int>(
                      dataSource: chartData,
                      xValueMapper: (ChartDataModel data, _) => data.x,
                      yValueMapper: (ChartDataModel data, _) => data.y,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true))
                ])),
          ],
        ),
      );

  employeeAvailabilty() => AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height12(),
          const Text(
            AppString.employAvailability,
            style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
          ),
          height12(),
          Container(
            child: GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: employeeAvailabilityData.length,
                itemBuilder: (BuildContext ctx, index) {
                  EmployeeAvailabilityModel item =
                      employeeAvailabilityData[index];
                  return AppCard(
                    padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(item.icon),
                        Text(
                          item.label,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, letterSpacing: 0.3),
                        ),
                        Text(
                          item.count.toString(),
                          style: const TextStyle(fontSize: 12.0),
                        )
                      ],
                    ),
                  );
                }),
          ),
          height12(),
        ],
      ),
      onTap: () {});



  totalEmployees() => AppCard(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        onTap: () {},
        child: Column(
          children: [
            height12(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppString.totalEmployees,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, letterSpacing: 0.3),
                ),
                const Text(
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
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true))
                    ])),
          ],
        ),
      );

  upcomingInterviews() => AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height12(),
          Row(
            children: [
              const Text(
                AppString.upcomingInterviews,
                style:
                    TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddInterview()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColor.pickledBluewood,
                    ),
                    const Text(
                      AppString.add,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, letterSpacing: 0.3),
                    ),
                  ],
                ),
              )
            ],
          ),
          height12(),
          ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: interviewData.length,
            itemBuilder: (context, index) =>
                HomeInterviewItem(item: interviewData[index]),
            separatorBuilder: (context, index) => const Divider(),
          ),
          height12(),
        ],
      ),
      onTap: () {});

  topPerformers() => AppCard(
        backgroundColor: AppColor.vanillaIce,
        borderColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height12(),
            const Text(
              AppString.topPerformers,
              style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
            ),
            height12(),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'You have 140 ', style: TextStyle(fontSize: 12.0)),
                  TextSpan(
                    text: 'influencers',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                  ),
                  TextSpan(
                      text: ' in your company.',
                      style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
            height12(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "350",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "New Task",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "130",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Task Completed",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ],
            ),
            height12(),
            GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: topPerformerData.length,
                itemBuilder: (BuildContext ctx, index) {
                  TopPerformerModel item = topPerformerData[index];
                  return AppCard(
                    isShadow: true,
                    borderColor: Colors.transparent,
                    onTap: () {},
                    child: Column(
                      children: [
                        height12(),
                        CircleAvatar(
                          backgroundColor: AppColor.bombay,
                          radius: 28.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 27.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(item.avatarUrl),
                              radius: 24.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          item.name,
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "@${item.username}",
                          style: const TextStyle(
                              fontSize: 12.0,
                              color: AppColor.bombay,
                              fontWeight: FontWeight.w600),
                        ),
                        height12(),
                        Text(
                          "${item.productivity} %",
                          style: const TextStyle(
                              fontSize: 30.0,
                              color: AppColor.pickledBluewood,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  );
                }),
            height12(),
          ],
        ),
      );

  height12() => const SizedBox(
        height: 12.0,
      );
}
