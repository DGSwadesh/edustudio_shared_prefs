import 'package:carousel_slider/carousel_slider.dart';
import 'package:edustudio/Controller/allCategoryController.dart';
import 'package:edustudio/Controller/recomandedTeacher_controller.dart';
import 'package:edustudio/Widget/DashBoardWidget.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/view/DashBoardPage/recommended%20teacher.dart';
import 'package:edustudio/util/constant.dart';
import 'package:edustudio/view/DashBoardPage/mySubjectAllCategory.dart';
import 'package:edustudio/view/DashBoardPage/SubscriptionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:edustudio/view/DashBoardPage/teacher_profile.dart';
import 'package:edustudio/view/DashBoardPage/categoryWiseTeacherList.dart';

class DashBoradPage extends StatefulWidget {
  // static const String routeName = '/dashBoradPage';

  @override
  _DashBoradPageState createState() => _DashBoradPageState();
}

class _DashBoradPageState extends State<DashBoradPage> {
  // List<AllSubjectCatagory> subjList;
  final DashbordController _allCategoryController =
      Get.put(DashbordController());
  final _recomendedTeacherController = Get.put(DashbordController());

  @override
  void initState() {
    super.initState();
    _allCategoryController.fetchAllSubjectCatagory();

    _recomendedTeacherController.fetchRecomandedTeacher(cat_id: 1
        // _allCategoryController.listOfSubj[0].id
        );
  }

  // void fetchList() {
  //   _dashboardHomePageController.fetchAllSubjectCatagory();
  // }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: DashBoardWidget().dashBoardAppBar(_width, _height),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 0.05.sw, right: 0.05.sw, top: 0.05.sw),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Category',
                    style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(MySubjectAllCategory());
                    },
                    child: Text('See All',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          wordSpacing: 1,
                          letterSpacing: 0.3,
                          color: Colors.blue,
                          fontSize: 0.04.sw,
                          decoration: TextDecoration.underline,
                        )),
                  )
                ],
              ),
            ),
            // all subjectCategory
            Obx(
              () => GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  padding: EdgeInsets.all(0.02.sw),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      _allCategoryController.listOfSubj.length, (index) {
                    return Container(
                      padding: EdgeInsets.all(0.02.sw),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(CategoryWiseTeacherList(
                              id: _allCategoryController.listOfSubj[index].id));
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
                                    _allCategoryController
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
                                  _allCategoryController
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
            ),
            Padding(
              padding: EdgeInsets.all(0.05.sw),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(SubscriptionScreen());
                    },
                    child: Text(
                      'Recommanded Teacher',
                      style:
                          customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(RecommendedTeacher(
                        allCategoryController: _allCategoryController,
                      ));
                    },
                    child: Text('More',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            wordSpacing: 1,
                            letterSpacing: 0.3,
                            color: Colors.blue,
                            fontSize: 0.04.sw,
                            decoration: TextDecoration.underline)),
                  )
                ],
              ),
            ),
            // Recomanded teacher slider
            Container(
                width: 0.9.sw,
                height: 0.45.sh,
                child: BottomSlider(_recomendedTeacherController)),
            Container(
              height: 200,
            ),

            // Container(
            //   height: _height * 0.1,
            //   width: _width,
            //   color: blueColor,
            //   child: RotatedBox(
            //       quarterTurns: 10, child: Image.asset(logInShapePng)),
            // )
          ],
        ),
      ),
    );
  }

  // Widget _dashboardItem(index) {
  //   return Card(
  //     elevation: 5,
  //     color: loginButtonColor,
  //     child: Container(
  //       width: 0.15.sw,
  //       height: 0.15.sw,
  //       child: subjList[index].iconPath != null
  //           ? Image.network(subjList[index].iconPath)
  //           : CircularProgressIndicator(),
  //     ),
  //   );
  // }

  Widget BottomSlider(_recomendedTeacherController) {
    return Obx(() => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _recomendedTeacherController.recomandedTeacherList.length,
          itemBuilder: (context, index) {
            return Container(
              width: 0.4.sw,
              decoration: BoxDecoration(
                color: loginButtonColor,
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [
                //   BoxShadow(
                //       offset: Offset(-1, 5),
                //       blurRadius: 10.0,
                //       spreadRadius: 0.01,
                //       color: thinGrayColor)
                // ]
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Get.to(TeacherProfile(teacherUserId: 4)),
                    child: Container(
                      height: 0.4.sw,
                      width: 0.4.sw,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                        child: Image.asset(
                          user2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.03.sw),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _recomendedTeacherController
                              .recomandedTeacherList[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: customizeTextStyle(
                              FontWeight.w500, 0.04.sw, blueColor),
                        ),
                        Text(
                          'Biology Teacher',
                          overflow: TextOverflow.ellipsis,
                          style: customizeTextStyle(
                              FontWeight.w700, 0.04.sw, black),
                        ),
                        Text(
                          _recomendedTeacherController
                              .recomandedTeacherList[index].rating
                              .toString(),
                          style: customizeTextStyle(
                              FontWeight.w700, 0.05.sw, black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: _recomendedTeacherController
                                  .recomandedTeacherList[index].rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 0.05.sw,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              // onRatingUpdate: (rating) {
                              //   print(rating);
                              // },
                            ),
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: darkRedColor,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 15,
              height: 10,
            );
          },
        ));
  }
}
