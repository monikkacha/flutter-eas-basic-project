import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/db/database_repository.dart';
import 'package:flutter_basics/ui/add_interview/screen/add_interview_form.dart';
import 'package:flutter_basics/ui/add_interview/screen/add_interview_page.dart';
import 'package:flutter_basics/ui/home/model/char_data_model.dart';
import 'package:flutter_basics/ui/home/model/employee_availability_model.dart';
import 'package:flutter_basics/ui/home/model/interview_model.dart';
import 'package:flutter_basics/ui/home/model/stacked_column_model.dart';
import 'package:flutter_basics/ui/home/model/toatal_employee_model.dart';
import 'package:flutter_basics/ui/home/store/home_store.dart';
import 'package:flutter_basics/ui_widgets/app_card/app_card.dart';
import 'package:flutter_basics/ui_widgets/appbar/common_app_bar.dart';
import 'package:flutter_basics/ui_widgets/home_interview_item/home_interview_item.dart';
import 'package:flutter_basics/ui_widgets/responsive/responsive.dart';
import 'package:flutter_basics/utils/app_color.dart';
import 'package:flutter_basics/utils/app_font_size.dart';
import 'package:flutter_basics/utils/app_string.dart';
import 'package:flutter_basics/utils/size_config.dart';
import 'package:my_popup_menu/my_popup_menu.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../ui_widgets/app_drawer/app_drawer.dart';
import '../model/notification_model.dart';
import '../model/top_performer_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  late HomeStore homeStore;

  final List<ChartDataModel> chartData = [
    ChartDataModel(2010, 35),
    ChartDataModel(2011, 28),
    ChartDataModel(2012, 34),
    ChartDataModel(2013, 32),
    ChartDataModel(2014, 40)
  ];
  final List<String> avatarList = [
    AppString.dummyImgUrl1,
    AppString.dummyImgUrl2,
    AppString.dummyImgUrl3,
    AppString.dummyImgUrl4,
    AppString.dummyImgUrl5,
    AppString.dummyImgUrl6,
  ];

  final List<NotificationModel> notificationData = [
    NotificationModel(
        notification:
            "Building Blocks of Life Discovered on Asteroid Located 200 Million Miles Away From Earth",
        ago: "5 Minutes ago"),
    NotificationModel(
        notification:
            "Rajya Sabha Polls: Cross-Voting Allegations Against 5 MLAs in 2 States",
        ago: "10 Minutes ago"),
    NotificationModel(
        notification: "Here's What Kriti Sanon Posted On 5 Years Of Raabta",
        ago: "12 Minutes ago"),
    NotificationModel(
        notification:
            "Guru Nanak Dev University CET: Application For BEd Admission 2022 Opens; Exam On July 24",
        ago: "17 Minutes ago"),
    NotificationModel(
        notification:
            "Rajiv Bajaj Had This To Say On Mushrooming Electric Vehicle Startups",
        ago: "33 Minutes ago"),
  ];

  final List<TotalEmployeeModel> totalEmployeeData = [
    TotalEmployeeModel('Man', 64, Colors.blue),
    TotalEmployeeModel('Woman', 36, Colors.pink),
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

  final List<StackedColumnModel> stackedColumnModel = [
    StackedColumnModel('Jan', "12", "10", "14", "20"),
    StackedColumnModel('Feb', "14", "11", "18", "23"),
    StackedColumnModel('Mar', "16", "10", "15", "20"),
    StackedColumnModel('Apr', "20", "22", "18", "24"),
    StackedColumnModel('May', "24", "1", "10", "25"),
    StackedColumnModel('Jun', "28", "22", "35", "5"),
    StackedColumnModel('Jul', "40", "1", "8", "14"),
    StackedColumnModel('Aug', "30", "22", "12", "34"),
    StackedColumnModel('Sep', "10", "6", "8", "29"),
    StackedColumnModel('Oct', "20", "22", "24", "18"),
    StackedColumnModel('Nov', "11", "22", "16", "10"),
    StackedColumnModel('Dec', "30", "16", "18", "10"),
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
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.eastBay,
    ));
    homeStore = Provider.of<HomeStore>(context, listen: false);
    homeStore.getData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppFontSize.init();
    return Responsive(
        mobile: mobileView(), tablet: mobileView(), desktop: desktopView());
  }

  desktopView() => Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: AppFontSize.value26),
          child: Row(children: [
            width24(),
            // Drawer
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: AppFontSize.value40),
                child: AppDrawer(
                  isDesktop: true,
                ),
              ),
              flex: 4,
            ),
            // Main Body
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: AppFontSize.value20),
                children: [
                  webTopBar(),
                  height10(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              employeesInfo(),
                              height20(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child:
                                          employeeAvailabilty(isDesktop: true)),
                                  width12(),
                                  Expanded(child: totalEmployees())
                                ],
                              ),
                              height20(),
                              topHiringSources(),
                              height20(),
                              topPerformers(isDesktop: true),
                            ],
                          )),
                      width20(),
                      Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              upcomingInterviews(isDesktop: true),
                            ],
                          ))
                    ],
                  ),
                  height30(),
                ],
              ),
              flex: 16,
            ),
          ]),
        ),
      );

  webTopBar() => Row(children: [
        Expanded(
          child: searchBar(),
          flex: 3,
        ),
        Spacer(),
        Expanded(
          child: Container(),
          flex: 1,
        ),
        Expanded(
          child: AvatarStack(height: AppFontSize.value24, avatars: [
            for (var avatar in avatarList) NetworkImage(avatar),
          ]),
        ),
        width12(),
        MyPopupIconButton(
          isSelected: true,
          menuContent: Container(
            width: 350.0,
            child: ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: notificationData.length + 1,
              itemBuilder: (_, index) => index == notificationData.length
                  ? TextButton(
                      onPressed: () {},
                      child: Text(
                        "MORE",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                  : ListTile(
                      title: Text(
                        notificationData[index].notification,
                        style: TextStyle(
                            fontSize: AppFontSize.value10,
                            color: AppColor.eastBay),
                      ),
                      subtitle: Text(notificationData[index].ago,
                          style: TextStyle(fontSize: AppFontSize.value8)),
                    ),
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          icon: Icon(
            Icons.notifications_rounded,
          ),
          notSelectedIcon: Icon(
            Icons.notifications_rounded,
          ),
        ),
        width12(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Dylan Hunter",
              style: TextStyle(
                  fontSize: AppFontSize.value10, fontWeight: FontWeight.bold),
            ),
            Text(
              "Admin Profile",
              style: TextStyle(
                fontSize: AppFontSize.value8,
              ),
            ),
          ],
        ),
        width10(),
        CircleAvatar(
          backgroundColor: AppColor.bombay,
          radius: 24.0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22.0,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(AppString.dummyImgUrl2),
              radius: 20.0,
            ),
          ),
        ),
      ]);

  mobileView() => Scaffold(
      key: _key,
      backgroundColor: AppColor.aquaSpring,
      appBar: getAppBar(),
      drawer: AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        children: [
          height20(),
          employeesInfo(),
          height20(),
          employeeAvailabilty(),
          height20(),
          totalEmployees(),
          height20(),
          topHiringSources(),
          height20(),
          upcomingInterviews(),
          height20(),
          topPerformers(),
          height20(),
        ],
      ));

  searchBar() => Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.gallery,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 1, top: 8, right: 10),
              hintText: AppString.searchHere),
        ),
      );

  getAppBar() => commonAppBar(
      backgroundColor: AppColor.eastBay,
      bottomBorderColor: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () => _key.currentState!.openDrawer(),
              child: const Icon(
                Icons.menu_outlined,
                color: Colors.white,
              )),
          const SizedBox(width: 10),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(right: 20.0),
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.gallery,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 10, top: 10, right: 10),
                  hintText: AppString.searchHere),
            ),
          )),
          const SizedBox(width: 10),
          const Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
        ],
      ));

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

  topHiringSources() => AppCard(
        onTap: () {},
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height12(),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                AppString.topHiringSources,
                style:
                    TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
              ),
            ),
            height12(),
            SfCartesianChart(primaryXAxis: CategoryAxis(), series: <
                ChartSeries>[
              StackedColumnSeries<StackedColumnModel, String>(
                  dataSource: stackedColumnModel,
                  xValueMapper: (StackedColumnModel data, _) => data.x,
                  yValueMapper: (StackedColumnModel data, _) =>
                      int.parse(data.y1),
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
              StackedColumnSeries<StackedColumnModel, String>(
                  dataSource: stackedColumnModel,
                  xValueMapper: (StackedColumnModel data, _) => data.x,
                  yValueMapper: (StackedColumnModel data, _) =>
                      int.parse(data.y2),
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
              StackedColumnSeries<StackedColumnModel, String>(
                  dataSource: stackedColumnModel,
                  xValueMapper: (StackedColumnModel data, _) => data.x,
                  yValueMapper: (StackedColumnModel data, _) =>
                      int.parse(data.y3),
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
              StackedColumnSeries<StackedColumnModel, String>(
                  dataSource: stackedColumnModel,
                  xValueMapper: (StackedColumnModel data, _) => data.x,
                  yValueMapper: (StackedColumnModel data, _) =>
                      int.parse(data.y4),
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
            ]),
          ],
        ),
      );

  employeeAvailabilty({isDesktop = false}) => AppCard(
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isDesktop
                        ? 2
                        : SizeConfig.isTabletDevice
                            ? 4
                            : 2,
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
                          style: TextStyle(fontSize: AppFontSize.value12),
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
        padding: EdgeInsets.symmetric(horizontal: AppFontSize.value12),
        onTap: () {},
        child: Column(
          children: [
            height12(),
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
                      fontSize: AppFontSize.value20),
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

  upcomingInterviews({isDesktop = false}) => AppCard(
      padding: EdgeInsets.symmetric(horizontal: AppFontSize.value12),
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
                  if (isDesktop) {
                    _showDesktopAddInterviewDialog();
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddInterviewPage()));
                  }
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
          Consumer<HomeStore>(builder: (_, store, widget) {
            return store.interviewList.isEmpty
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: store.interviewList.length,
                    itemBuilder: (context, index) => HomeInterviewItem(
                        onDeletePressed: () {
                          store.deleteInterview(index , store.interviewList[index].id!);
                        },
                        onEditPressed: () {
                          if (isDesktop) {
                            // TODO :: implement edit here
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddInterviewPage(
                                          interview: store.interviewList[index],
                                        )));
                          }
                        },
                        item: store.interviewList[index],
                        isDesktop: isDesktop),
                    separatorBuilder: (context, index) => const Divider(),
                  );
          }),
          // TODO :: for pagination
          // TextButton(
          //     onPressed: () {
          //       homeStore.getData();
          //     },
          //     child: Center(
          //       child: Text(
          //         "LOAD MORE",
          //         textAlign: TextAlign.center,
          //       ),
          //     )),
        ],
      ),
      onTap: () {});

  topPerformers({isDesktop = false}) => AppCard(
        backgroundColor: AppColor.vanillaIce,
        borderColor: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: AppFontSize.value12),
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
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'You have 140 ',
                      style: TextStyle(fontSize: AppFontSize.value12)),
                  TextSpan(
                    text: 'influencers',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.value12),
                  ),
                  TextSpan(
                      text: ' in your company.',
                      style: TextStyle(fontSize: AppFontSize.value12)),
                ],
              ),
            ),
            height12(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "350",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.value16),
                    ),
                    Text(
                      "New Task",
                      style: TextStyle(fontSize: AppFontSize.value10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "130",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.value16),
                    ),
                    Text(
                      "Task Completed",
                      style: TextStyle(fontSize: AppFontSize.value10),
                    ),
                  ],
                ),
              ],
            ),
            height12(),
            GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: SizeConfig.isTabletDevice ? 3 : 2,
                    childAspectRatio: isDesktop
                        ? 1 / 1.3
                        : SizeConfig.isTabletDevice
                            ? 1 / 1.1
                            : 1 / 1.3,
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
                        height6(),
                        Text(
                          item.name,
                          style: TextStyle(
                              fontSize: isDesktop
                                  ? AppFontSize.value12
                                  : AppFontSize.value14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "@${item.username}",
                          style: TextStyle(
                              fontSize: isDesktop
                                  ? AppFontSize.value10
                                  : AppFontSize.value12,
                              color: AppColor.eastBay,
                              fontWeight: FontWeight.w600),
                        ),
                        height12(),
                        Text(
                          "${item.productivity} %",
                          style: TextStyle(
                              fontSize: isDesktop
                                  ? AppFontSize.value24
                                  : AppFontSize.value30,
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

  _showDesktopAddInterviewDialog() => showDialog(
      context: context,
      builder: (_) => Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
                padding:
                    EdgeInsets.symmetric(horizontal: AppFontSize.value100 * 3),
                children: [
                  height30(),
                  AddInterviewForm(
                    isDesktop: true,
                  ),
                ]),
          ));

  @override
  void dispose() {
    homeStore.dispose();
  }
}
