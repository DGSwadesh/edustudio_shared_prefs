import 'dart:collection';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edustudio/Widget/DashBoardWidget.dart';
import 'package:edustudio/Widget/DrawerCustomPaint.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/util/constant.dart';
import 'package:edustudio/util/sharePreference_instance.dart';
import 'package:edustudio/view/DashBoardPage/Filter/filters.dart';
import 'package:edustudio/view/DashBoardPage/editProfile.dart';
import 'package:edustudio/view/DashBoardPage/teacher_timetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SessionSchedule extends StatefulWidget {
  @override
  _SessionScheduleState createState() => _SessionScheduleState();
}

class _SessionScheduleState extends State<SessionSchedule>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Text(
          'Session Schedule',
          style: customizeTextStyle(FontWeight.w600, 0.06.sw, white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.horizontal_split),
              onPressed: () {
                showbuttonSheet();
              }),
        ],
        bottom: PreferredSize(
          preferredSize: Size(200, 50),
          child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.white,
              isScrollable: true,
              labelColor: Colors.amber,
              tabs: [
                Tab(
                  text: 'physic',
                ),
                Tab(
                  text: 'Biology',
                ),
                Tab(
                  text: 'English',
                ),
                Tab(
                  text: 'History',
                ),
              ]),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SessionScheduleList(),
          SessionScheduleList(),
          SessionScheduleList(),
          SessionScheduleList(),
        ],
      ),
    );
  }

  void showbuttonSheet() {
    Get.bottomSheet(BottomSheet(onClosing: () {
      print('bottomsheet close');
    }, builder: (context) {
      return Container(
        width: 1.sw,
        height: 0.5.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 1.sw,
                height: 0.09.sh,
                color: backgroundColor,
                padding: EdgeInsets.all(0.03.sw),
                child: Text(
                  'Sort By',
                  style: customizeTextStyle(FontWeight.w700, 0.06.sw, white),
                )),
            Padding(
              padding: EdgeInsets.all(0.04.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alphabate A-Z',
                    style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  Text(
                    'Unread first',
                    style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  Text(
                    'Read first',
                    style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  Text(
                    'Date assending',
                    style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  Text(
                    'Date Descending',
                    style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  Text(
                    'Cancel',
                    style: customizeTextStyle(FontWeight.w700, 0.04.sw, red),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}

class SessionScheduleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(TeacherTimetable());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 0.25.sw,
                        height: 0.18.sw,
                        decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: AssetImage(
                          //   dclass,
                          // ))
                          borderRadius: BorderRadius.circular(10),
                          color: red,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: white,
                        ),
                      ),
                      SigninSignUpWidget().getWidthSizedBox(0.03.sw),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '20/04/2020 11:30 A.M',
                            style: customizeTextStyle(
                                FontWeight.w900, 0.03.sw, grayColor),
                          ),
                          SigninSignUpWidget().getHeightSizedBox(0.01.sw),
                          Text(
                            'Biology',
                            style: customizeTextStyle(
                                FontWeight.w900, 0.04.sw, black),
                          ),
                          SigninSignUpWidget().getHeightSizedBox(0.01.sw),
                          RichText(
                            text: TextSpan(
                                text: 'By ',
                                style: TextStyle(
                                    color: grayColor, fontSize: 0.04.sw),
                                children: [
                                  TextSpan(
                                      text: 'Mr. Jhon ',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 0.04.sw))
                                ]),
                          )
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notification_important,
                    color: grayColor,
                    size: 0.06.sw,
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 10),
    );
  }
}
