import 'package:cached_network_image/cached_network_image.dart';
import 'package:edustudio/Controller/teacherProfile_controller.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/Widget/star_rating_display_widget.dart';
import 'package:edustudio/util/constant.dart';
import 'package:edustudio/view/DashBoardPage/addRating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:badges/badges.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherProfile extends StatefulWidget {
  var teacherUserId;
  TeacherProfile({this.teacherUserId});
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  var _teacherProfileController = Get.put(TeacherProfileController());

  @override
  void initState() {
    _teacherProfileController.fetchTeacherProfile(4);
    _teacherProfileController.fetchTeacherRating(4
        // widget.teacherUserId
        );
    _teacherProfileController.fetchTeacherReviews(4
        // widget.teacherUserId
        );

    // _teacherProfileController.selectTab(
    //     0, _teacherProfileController.courseList, 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _teacherProfileController.teachersProfile.value != null
        ? SafeArea(
            child: Material(
              child: NestedScrollView(
                physics: NeverScrollableScrollPhysics(),
                //  floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      leading: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: black,
                        ),
                      ),
                      // title: Text(
                      //   "TeacherProfile",
                      //   style: customizeTextStyle(
                      //       FontWeight.w500, 0.06.sw, black),
                      // ),
                      // centerTitle: true,
                      backgroundColor: backgroundColor,
                      collapsedHeight: 0.5.sh,
                      expandedHeight: 0.5.sh,
                      flexibleSpace: teacherProfileImageWidget(),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: MyDelegate(teacherTabBar()),
                    )
                  ];
                },
                body: SingleChildScrollView(
                    child: Column(
                  children: [
                    courseDetails(),
                    ratingAndReview(),
                    commentSection(),
                    // ratingAndReview(),
                    // Divider(
                    //   thickness: 0.001.sh,
                    // ),
                    // commentSection(),
                  ],
                )),
              ),
            ),
          )
        : Center(child: CircularProgressIndicator()));
  }

  Widget teacherProfileImageWidget() {
    return Stack(
      children: [
        SizedBox(
          width: 1.sw,
          child: Image.network(
            //_teacherProfileController.teachersProfile.value.data.profile.photo.path ??

            'https://laravel.gowebbidemo.com/122120/public/uploads/teacher/u3Y5Vh1609246581.png',
            // placeholder: (context, url) => CircularProgressIndicator(),
            // errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(bottom: 1, child: teacherNameAndOthers())
        // Align(
        //     alignment: Alignment.topRight,
        //     child: FaIcon(
        //       FontAwesomeIcons.heart,
        //       color: red,
        //     )),
      ],
    );
  }

  Widget teacherNameAndOthers() {
    return Padding(
      padding: EdgeInsets.all(0.03.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _teacherProfileController.teachersProfile.value.data.profile.name,
            overflow: TextOverflow.ellipsis,
            style: customizeTextStyle(FontWeight.w500, 0.06.sw, blueColor),
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          // Text(
          //   'Biology Teacher',
          //   overflow: TextOverflow.ellipsis,
          //   style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
          // ),
          // SizedBox(
          //   height: 0.02.sh,
          // ),
          // Row(
          //   children: [
          //     CircleAvatar(
          //         backgroundColor: grayColor,
          //         radius: 0.06.sw,
          //         child: CircleAvatar(
          //           backgroundColor: white,
          //           radius: 0.07.sw,
          //           child: Icon(Icons.call),
          //         )),
          //     SizedBox(
          //       width: 0.1.sw,
          //     ),
          //     Text(
          //       "+000 000 0000",
          //       style:
          //           customizeTextStyle(FontWeight.w500, 0.04.sw, black),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     CircleAvatar(
          //         backgroundColor: grayColor,
          //         radius: 0.06.sw,
          //         child: CircleAvatar(
          //           backgroundColor: white,
          //           radius: 0.07.sw,
          //           child: Icon(Icons.message),
          //         )),
          //     SizedBox(
          //       width: 0.1.sw,
          //     ),
          //     Text(
          //       "john@gmail.com",
          //       style:
          //           customizeTextStyle(FontWeight.w500, 0.04.sw, black),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     CircleAvatar(
          //         backgroundColor: grayColor,
          //         radius: 0.06.sw,
          //         child: CircleAvatar(
          //           backgroundColor: white,
          //           radius: 0.07.sw,
          //           child: Icon(Icons.watch_later_outlined),
          //         )),
          //     SizedBox(
          //       width: 0.1.sw,
          //     ),
          //     Text(
          //       "6 hour",
          //       style:
          //           customizeTextStyle(FontWeight.w500, 0.04.sw, black),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     CircleAvatar(
          //         backgroundColor: grayColor,
          //         radius: 0.06.sw,
          //         child: CircleAvatar(
          //           backgroundColor: white,
          //           radius: 0.07.sw,
          //           child: Icon(Icons.airplay),
          //         )),
          //     SizedBox(
          //       width: 0.1.sw,
          //     ),
          //     Text(
          //       "\$20",
          //       style:
          //           customizeTextStyle(FontWeight.w500, 0.04.sw, black),
          //     )
          //   ],
          // ),
          SizedBox(
            height: 0.01.sh,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //>>>>>>>>>>>>>> Star Rating Display <<<<<<<<<<<<<<<<<<<<<<<<<<<
              StarDisplayWidget(
                value: double.parse(_teacherProfileController
                    .teachersProfile.value.data.profile.rating),
                filledStar:
                    Icon(Icons.star, color: Colors.green, size: 0.05.sw),
                unfilledStar: Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 0.04.sw,
                ),
              ),
              SizedBox(
                width: 0.1.sw,
              ),
              Text(
                _teacherProfileController
                    .teachersProfile.value.data.profile.rating
                    .toString(),
                style: customizeTextStyle(FontWeight.w500, 0.04.sw, black),
              ),
              SigninSignUpWidget().getWidthSizedBox(0.01.sw),
              Text(
                "(108 ratings)",
                style: customizeTextStyle(FontWeight.w500, 0.04.sw, black),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget teacherProfileTabBar() {
    return Container(
      // color: red,
      width: 1.sw,
      // height: 0.6.sh - 0.06.sh,
      child: Column(children: [
        // courseDetails(),
        Container(
            height: 0.6.sh - (0.06.sh + 0.21.sh),
            width: 1.sw,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              //  physics: NeverScrollableScrollPhysics(),
              itemCount: _teacherProfileController.upcomingClassList.length,
              separatorBuilder: (ctx, int index) {
                return Divider();
              },
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, int index) {
                return Obx(() => Container(
                          width: 0.7.sw,
                        )

                    // Container(
                    //       padding: EdgeInsets.all(0.02.sw),
                    //       child: Table(
                    //         //  defaultColumnWidth: FixedColumnWidth(0.3.sw),
                    //         border: TableBorder.all(
                    //           color: Colors.black,
                    //           width: 2,
                    //         ),
                    //         children: [
                    //           // DataColumn(label: Text('dg')),
                    //           TableRow(
                    //             children: [
                    //               Table(
                    //                 children: [
                    //                   TableRow(children: [
                    //                     Padding(
                    //                       padding: EdgeInsets.all(0.02.sw),
                    //                       child: Table(
                    //                           border: TableBorder.all(
                    //                             color: Colors.black,
                    //                             width: 2,
                    //                           ),
                    //                           children: [

                    //                             myTableRow(
                    //                                 'course_name: ',
                    //                                 _teacherProfileController
                    //                                     .upcomingClassList[index]
                    //                                     .courseName),
                    //                             myTableRow(
                    //                                 'batchName: ',
                    //                                 _teacherProfileController
                    //                                     .upcomingClassList[index]
                    //                                     .batchName),
                    //                             myTableRow(
                    //                                 'scheduleDate: ',
                    //                                 _teacherProfileController
                    //                                     .upcomingClassList[index]
                    //                                     .scheduleDate),
                    //                             myTableRow(
                    //                                 'fromTime: ',
                    //                                 _teacherProfileController
                    //                                     .upcomingClassList[index]
                    //                                     .fromTime),
                    //                             myTableRow(
                    //                                 'toTime: ',
                    //                                 _teacherProfileController
                    //                                     .upcomingClassList[index]
                    //                                     .toTime),
                    //                             myTableRow(
                    //                                 'studentEnroll: ',
                    //                                 _teacherProfileController
                    //                                     .upcomingClassList[index]
                    //                                     .studentEnroll
                    //                                     .toString()),
                    //                             myTableRow(
                    //                                 'languages: ',
                    //                                 _teacherProfileController
                    //                                     .upcomingClassList[index]
                    //                                     .languages),
                    //                           ]),
                    //                     ),
                    //                   ]),
                    //                 ],
                    //               ),
                    //               secondeTableCell(),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     )
                    );
              },
            ))
      ]),
    );
  }

  Widget teacherTabBar() {
    return Container(
      width: 1.sw,
      height: 40,
      color: backgroundColor,
      child: _teacherProfileController.courseList != null
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _teacherProfileController.courseList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: _teacherProfileController.courseList.length <= 4
                      ? 1.sw / _teacherProfileController.courseList.length
                      : 0.3.sw,
                  height: 0.01.sh,
                  // padding: EdgeInsets.all(0),
                  child: Obx(
                    () {
                      // print(_teacherProfileController.courseList[index].isSelected);
                      return Center(
                        child: InkWell(
                          onTap: () {
                            _teacherProfileController.selectTab(index, 4);
                          },
                          child: Text(
                            _teacherProfileController
                                .courseList[index].categoryName,
                            style: customizeTextStyle(
                                FontWeight.w500,
                                0.04.sw,
                                _teacherProfileController
                                        .courseList[index].isSelected
                                    ? white
                                    : black),
                          ),
                        ),
                      );
                    },
                  ),
                );
              })
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget courseDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                _teacherProfileController
                    .courseList[
                        _teacherProfileController.selectedTabIndex.value]
                    .title,
                style:
                    customizeTextStyle(boldTextWeight, 0.04.sw, Colors.black))
          ],
        ),
        SizedBox(
          height: 0.01.sw,
        ),
        Text(
            _teacherProfileController
                .courseList[_teacherProfileController.selectedTabIndex.value]
                .description,
            style: customizeTextStyle(FontWeight.w500, 0.03.sw, Colors.black)),
        SizedBox(
          height: 0.01.sw,
        ),
        Text(
            'allow demo class: ${_teacherProfileController.courseList[_teacherProfileController.selectedTabIndex.value].allowDemoClass}',
            style: customizeTextStyle(FontWeight.w500, 0.03.sw, Colors.black)),
        SizedBox(
          height: 0.01.sw,
        ),
        Text(
            '@${_teacherProfileController.courseList[_teacherProfileController.selectedTabIndex.value].perClassPrice.toString()}',
            style: customizeTextStyle(FontWeight.w500, 0.03.sw, Colors.black)),
        // SizedBox(
        //   height: 0.01.sw,
        // ),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (ctx, index) {
              return Text(
                  _teacherProfileController
                      .courseList[
                          _teacherProfileController.selectedTabIndex.value]
                      .highlights,
                  style: customizeTextStyle(
                      FontWeight.w900, 0.03.sw, Colors.blue));
            },
            separatorBuilder: (ctx, index) {
              return SizedBox(
                height: 2,
                // height: 0.08.sw,
              );
            }),

        Container(
          width: 1.sw,
          height: 0.4.sh,
          // color: red,
          child: ListView.separated(
            itemCount: _teacherProfileController.upcomingClassList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Card(
                  child: Container(
                    width: 0.6.sw,
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0.01.sw,
                          ),
                          Text(
                              _teacherProfileController
                                  .upcomingClassList[index].courseName,
                              style: customizeTextStyle(
                                  FontWeight.w900, 0.03.sw, black)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 0.01.sw,
                              ),
                              Text(
                                  "batchName: ${_teacherProfileController.upcomingClassList[index].batchName}",
                                  style: customizeTextStyle(
                                      FontWeight.w900, 0.03.sw, black)),
                              SizedBox(
                                height: 0.01.sw,
                              ),
                              Text(
                                  "scheduleDate: ${_teacherProfileController.upcomingClassList[index].scheduleDate}",
                                  style: customizeTextStyle(
                                      FontWeight.w900, 0.03.sw, black)),
                              SizedBox(
                                height: 0.01.sw,
                              ),
                              Text(
                                  "fromTime: ${_teacherProfileController.upcomingClassList[index].fromTime}",
                                  style: customizeTextStyle(
                                      FontWeight.w900, 0.03.sw, black)),
                              SizedBox(
                                height: 0.01.sw,
                              ),
                              Text(
                                  "toTime: ${_teacherProfileController.upcomingClassList[index].toTime}",
                                  style: customizeTextStyle(
                                      FontWeight.w900, 0.03.sw, black)),
                              SizedBox(
                                height: 0.01.sw,
                              ),
                              Text(
                                  "studentEnroll: ${_teacherProfileController.upcomingClassList[index].studentEnroll.toString()}",
                                  style: customizeTextStyle(
                                      FontWeight.w900, 0.03.sw, black)),
                              SizedBox(
                                height: 0.01.sw,
                              ),
                              Text(
                                  "languages: ${_teacherProfileController.upcomingClassList[index].languages}",
                                  style: customizeTextStyle(
                                      FontWeight.w900, 0.03.sw, black)),
                              enrolButton(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
          ),
        )
      ],
    );
  }

  Widget enrolButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.09.sw),
      child: Container(
        width: 0.3.sw,
        height: 0.10.sw,
        decoration: BoxDecoration(
            color: loginButtonColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-1, 1),
                  blurRadius: 2.0,
                  spreadRadius: 0.01,
                  color: lightBlackBoldColor)
            ]),
        child: Center(
            child: Text(
          "Enroll Now",
          style: customizeTextStyle(FontWeight.w600, 0.05.sw, primaryColor2),
        )),
      ),
    );
  }

  Widget ratingAndReview() {
    return Container(
      margin: EdgeInsets.all(0.03.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rating & Reviews",
                style: customizeTextStyle(FontWeight.w800, 0.05.sw, black),
              ),
              // SigninSignUpWidget().getWidthSizedBox(0.07.sw),
              SizedBox(
                height: 0.06.sh,
                width: 0.33.sw,
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  // color: AddToCartButton,
                  onPressed: () {
                    Get.to(Review());
                  },
                  child: Text(
                    'Review Teacher',
                    style: customizeTextStyle(
                        FontWeight.w800, 0.03.sw, Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.01.sh,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.all(0.03.sw),
                        width: 0.30.sw,
                        height: 0.11.sh,
                        decoration: BoxDecoration(color: Colors.green),
                        child: Center(
                            child: Text(
                          '${_teacherProfileController.averageRating.value} \n out of ${_teacherProfileController.totalRating.value}',
                          style: customizeTextStyle(
                              FontWeight.w800, 15.0, Colors.white),
                          textAlign: TextAlign.center,
                        )),
                      ),
                      StarDisplayWidget(
                        value: double.parse(_teacherProfileController
                            .teachersProfile.value.data.profile.rating),
                        filledStar: Icon(Icons.star,
                            color: Colors.green, size: 0.05.sw),
                        unfilledStar: Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 0.04.sw,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 0.17.sw,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Excellent',
                              style: customizeTextStyle(
                                  FontWeight.w800, 0.04.sw, Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        LinearPercentIndicator(
                          width: 0.32.sw,
                          lineHeight: 8.0,
                          percent: _teacherProfileController
                                  .teacherRating.value.data.excellent /
                              _teacherProfileController.totalRating.value,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.orange,
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        Text(
                          _teacherProfileController
                              .teacherRating.value.data.excellent
                              .toString(),
                          style: customizeTextStyle(
                              FontWeight.w800, 0.04.sw, Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(
                      height: 0.015.sh,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Good',
                              style: customizeTextStyle(
                                  FontWeight.w800, 0.04.sw, Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          width: 0.17.sw,
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        new LinearPercentIndicator(
                          width: 0.32.sw,
                          lineHeight: 8.0,
                          percent: _teacherProfileController
                                  .teacherRating.value.data.good /
                              _teacherProfileController.totalRating.value,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.orange,
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        Text(
                          _teacherProfileController
                              .teacherRating.value.data.good
                              .toString(),
                          style: customizeTextStyle(
                              FontWeight.w800, 0.04.sw, Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(
                      height: 0.015.sh,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Average',
                              style: customizeTextStyle(
                                  FontWeight.w800, 0.04.sw, Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          width: 0.17.sw,
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        new LinearPercentIndicator(
                          width: 0.32.sw,
                          lineHeight: 8.0,
                          percent: _teacherProfileController
                                  .teacherRating.value.data.average /
                              _teacherProfileController.totalRating.value,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.orange,
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        Text(
                          _teacherProfileController
                              .teacherRating.value.data.average
                              .toString(),
                          style: customizeTextStyle(
                              FontWeight.w800, 0.04.sw, Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(
                      height: 0.015.sh,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Poor',
                              style: customizeTextStyle(
                                  FontWeight.w800, 0.04.sw, Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          width: 0.17.sw,
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        new LinearPercentIndicator(
                          width: 0.32.sw,
                          lineHeight: 8.0,
                          percent: _teacherProfileController
                                  .teacherRating.value.data.poor /
                              _teacherProfileController.totalRating.value,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.orange,
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        Text(
                          _teacherProfileController
                              .teacherRating.value.data.poor
                              .toString(),
                          style: customizeTextStyle(
                              FontWeight.w800, 0.04.sw, Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(
                      height: 0.015.sh,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Terrible',
                              style: customizeTextStyle(
                                  FontWeight.w800, 0.04.sw, Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          width: 0.17.sw,
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        new LinearPercentIndicator(
                          width: 0.32.sw,
                          lineHeight: 8.0,
                          percent: _teacherProfileController
                                  .teacherRating.value.data.terrible /
                              _teacherProfileController.totalRating.value,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.orange,
                        ),
                        SizedBox(
                          width: 0.01.sw,
                        ),
                        Text(
                          _teacherProfileController
                              .teacherRating.value.data.terrible
                              .toString(),
                          style: customizeTextStyle(
                              FontWeight.w800, 0.04.sw, Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget commentSection() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _teacherProfileController.teacherReviews.value.data.length,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 0.03.sw,
                ),
                CircleAvatar(
                    backgroundColor: grayColor,
                    radius: 0.06.sw,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 0.07.sw,
                      child: CachedNetworkImage(
                        imageUrl: _teacherProfileController.teacherReviews.value
                                .data[index].studentPhoto.path ??
                            "https://crop-circle.imageonline.co/crop-circle.png",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )),
                SizedBox(
                  width: 0.03.sw,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _teacherProfileController
                            .teacherReviews.value.data[index].studentName,
                        style:
                            customizeTextStyle(FontWeight.w800, 0.05.sw, black),
                      ),
                      SizedBox(
                        height: 0.01.sw,
                      ),
                      Text(
                        "20/04/20 no api",
                        style:
                            customizeTextStyle(FontWeight.w500, 0.04.sw, black),
                      ),
                      SizedBox(
                        height: 0.01.sw,
                      ),
                      StarDisplayWidget(
                        value: double.parse(_teacherProfileController
                            .teacherReviews.value.data[index].rating),
                        filledStar: Icon(Icons.star,
                            color: Colors.green, size: 0.05.sw),
                        unfilledStar: Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 0.04.sw,
                        ),
                      ),
                      SizedBox(
                        height: 0.01.sw,
                      ),
                      Text(
                        _teacherProfileController
                            .teacherReviews.value.data[index].heading,
                        style:
                            customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                      ),
                      Text(
                        _teacherProfileController
                            .teacherReviews.value.data[index].description,
                        style:
                            customizeTextStyle(FontWeight.w500, 0.04.sw, black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (ctx, index) {
        return Divider();
      },
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.widget);
  final widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => 30;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
