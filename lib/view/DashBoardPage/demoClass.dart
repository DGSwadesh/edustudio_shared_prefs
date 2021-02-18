import 'package:edustudio/Widget/DashBoardWidget.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/view/DashBoardPage/recomanderTeacherWidget.dart';
import 'package:edustudio/view/DashBoardPage/session_schedule.dart';
import 'package:edustudio/view/DashBoardPage/teacher_timetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DemoClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: DashBoardWidget().dashBoardAppBar(_width, _height),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.blueAccent,
              width: 1.sw,
              height: 0.4.sh,
              child: Stack(
                children: [
                  Positioned(
                      child: Image.asset(
                        dclass,
                        width: 0.5.sw,
                        height: 0.5.sw,
                      ),
                      top: _height * 0.04,
                      right: _width * 0.05),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _topContainer(_width, _height),
                      RotatedBox(
                        quarterTurns: 18,
                        child: Image.asset(logInShapePng),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(0.03.sw),
                  child: Text(
                    'Schedule',
                    style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                  ),
                ),
                Icon(Icons.schedule)
              ],
            ),
            _bottomContainer(_width, _height),
          ],
        ),
      ),
    );
  }

  Widget _topContainer(_width, _height) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Demo Sessions',
            textAlign: TextAlign.justify,
            style: customizeTextStyle(FontWeight.w700, 0.06.sw, primaryColor2),
          ),
          Text(
            'By Our Top Exerts',
            style: customizeTextStyle(FontWeight.w700, 0.04.sw, primaryColor2),
          ),
          SigninSignUpWidget().getHeightSizedBox(0.04.sh),
          CircleAvatar(
            backgroundColor: white,
            radius: 25,
            child: IconButton(
              icon: Icon(
                Icons.play_arrow,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
          SigninSignUpWidget().getHeightSizedBox(0.04.sh),
        ],
      ),
    );
  }

  Widget _bottomContainer(_width, _height) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(TeacherTimetable());
              },
              // highlightColor: backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      SigninSignUpWidget().getWidthSizedBox(_height * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Biology',
                            style: customizeTextStyle(
                                FontWeight.w900, 0.04.sw, black),
                          ),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'live in 2:24:00',
                        style:
                            customizeTextStyle(FontWeight.w700, 0.04.sw, red),
                      ),
                      SigninSignUpWidget().getHeightSizedBox(_height * 0.02),
                      InkWell(
                        onTap: () {
                          Get.to(SessionSchedule());
                        },
                        child: Text(
                          'view More',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            wordSpacing: 1,
                            letterSpacing: 0.1,
                            color: Colors.blue,
                            fontSize: 0.04.sw,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
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
