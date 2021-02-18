import 'package:carousel_slider/carousel_slider.dart';
import 'package:edustudio/Controller/allCategoryController.dart';
import 'package:edustudio/Controller/recomandedTeacher_controller.dart';
import 'package:edustudio/Widget/DashBoardWidget.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/view/DashBoardPage/teacher_profile.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MySubjectAllCategory extends StatefulWidget {
  // static const String routeName = '/mySubjectAllCategory';

  @override
  _MySubjectAllCategoryState createState() => _MySubjectAllCategoryState();
}

class _MySubjectAllCategoryState extends State<MySubjectAllCategory> {
  final DashbordController _dashboardHomePageController =
      Get.put(DashbordController());

  @override
  void initState() {
    super.initState();
    _dashboardHomePageController.fetchAllSubjectCatagory();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: DashBoardWidget().dashBoardAppBar(_width, _height),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: _width,
              height: _height * 0.9,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    color: backgroundColor,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                              width: 0.5.sw,
                              height: 0.3.sh,
                              child: Image.asset(
                                subject,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            top: _height * 0.04,
                            right: _width * 0.05),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
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
                  _bottomContainer(_width, _height),
                ],
              )),
        ),
      ),
    );
  }

  Widget _topContainer(_width, _height) {
    return Padding(
      padding: EdgeInsets.only(
          top: _width * 0.06, left: _width * 0.01, right: _height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Category',
                  textAlign: TextAlign.justify,
                  style: customizeTextStyle(
                      FontWeight.w500, 0.07.sw, primaryColor2),
                ),
                SigninSignUpWidget().getHeightSizedBox(_height * 0.02),
                Text(
                  '9 Subject',
                  style: customizeTextStyle(
                      FontWeight.w500, 0.04.sw, primaryColor2),
                ),
                SigninSignUpWidget().getHeightSizedBox(_height * 0.02),
                CircleAvatar(
                  radius: 0.08.sw,
                  backgroundColor: white,
                  child: Icon(
                    Icons.book,
                    size: 0.09.sw,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomContainer(_width, _height) {
    return Obx(
      () => GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          padding: EdgeInsets.all(0.02.sw),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(
              _dashboardHomePageController.listOfSubj.length, (index) {
            return Container(
              padding: EdgeInsets.all(0.02.sw),
              child: GestureDetector(
                onTap: () {
                  Get.to(TeacherProfile());
                },
                child: Card(
                  borderOnForeground: false,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0.01.sw,
                  child: Container(
                    margin: EdgeInsets.all(0.01.sw),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Image.network(
                            _dashboardHomePageController
                                .listOfSubj[index].iconPath,
                            fit: BoxFit.cover,
                          ),
                          width: 0.09.sw,
                          height: 0.09.sw,
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        Text(
                          _dashboardHomePageController
                              .listOfSubj[index].categoryName,
                          style: customizeTextStyle(
                              FontWeight.w900, 0.03.sw, Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }

  Widget _dashboardItem() {
    return Container(
      width: 0.20.sw,
      height: 0.20.sw,
      margin: EdgeInsets.all(0.03.sw),
      padding: EdgeInsets.all(0.02.sw),
      decoration: BoxDecoration(
          color: loginButtonColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(-1, 5),
                blurRadius: 10.0,
                spreadRadius: 0.01,
                color: thinGrayColor)
          ]),
      child: SvgPicture.asset(
        logInPageEdutationLogo,
        // semanticsLabel: 'Acme Logo',
        //height: _width * 0.13,
        // width: _width * 0.2,
        // fit: BoxFit.cover,
      ),
    );
  }
}
