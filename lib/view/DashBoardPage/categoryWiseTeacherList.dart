import 'package:edustudio/Controller/filter_controller.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/view/DashBoardPage/Filter/filters.dart';
import 'package:edustudio/view/DashBoardPage/session_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryWiseTeacherList extends StatefulWidget {
  int id;
  CategoryWiseTeacherList({this.id});

  @override
  _CategoryWiseTeacherListState createState() =>
      _CategoryWiseTeacherListState();
}

class _CategoryWiseTeacherListState extends State<CategoryWiseTeacherList> {
  // final _allCategoryController = Get.put(AllSubCategoryController());
  final _filterController = Get.put(FilterController());
  // final _categorywiseTeacherListController =
  //     Get.put(categorywiseTeacherListController());

  // var list = [1, 2];

  @override
  void initState() {
    // var url = Uri.parse('$BASE_URL + $categoryWiseTeachers + ? + cat=1');
    // print(url);
    // print('digggggggg');
    // print(list.join(","));
    _filterController.fetchAllcategorywiseTeacherList(
      widget.id,
    );
    _filterController.fetchAllLanguages();
    _filterController.addRatingList();
    _filterController.addPriceListList();
    _filterController.fetchAllSubCategories(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('dgiiiiiiiiiii');
    // print(_filterController.filter_listOfLang.join(","));
    // print(_filterController.filter_listOfRating);
    // print(_filterController.filter_listOfPrice);
    // print(_filterController.filter_listOfSubCategory);
    // print('dgiiiiiiiiiiii');

    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Educational',
          style: customizeTextStyle(FontWeight.w700, 0.06.sw, white),
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.to(Filters(
                    id: widget.id,
                    // languageController: _languageController,
                    // ratingController: _ratingController,
                    // priceController: _priceController,
                    // allCategoryController: _allCategoryController,
                    filterController: _filterController,
                    // categorywiseTeacherListController:
                    //     _categorywiseTeacherListController,
                  ));
                },
                child: Container(
                  width: 0.24.sw,
                  height: 0.05.sh,
                  decoration: BoxDecoration(
                      color: loginButtonColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(0.02.sw),
                    child: Row(
                      children: [
                        Text(
                          'Filter ',
                          style: customizeTextStyle(
                              FontWeight.w700, 0.05.sw, white),
                        ),
                        FaIcon(
                          FontAwesomeIcons.filter,
                          color: white,
                          size: 0.04.sw,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SigninSignUpWidget().getWidthSizedBox(0.01.sw),
              InkWell(
                onTap: () {
                  showbuttonSheet();
                },
                child: Container(
                  width: 0.22.sw,
                  height: 0.05.sh,
                  decoration: BoxDecoration(
                      color: loginButtonColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(0.02.sw),
                    child: Row(
                      children: [
                        Text(
                          'Sort ',
                          style: customizeTextStyle(
                              FontWeight.w700, 0.05.sw, white),
                        ),
                        FaIcon(
                          FontAwesomeIcons.sortAlphaUp,
                          color: white,
                          size: 0.05.sw,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(70, 0.08.sh),
          child: Container(
            width: double.infinity,
            color: backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 0.03.sw, left: 0.03.sw, right: 0.03.sw),
              child: Container(
                height: 0.11.sw,
                padding: EdgeInsets.only(left: 0.05.sw, bottom: 0.01.sw),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search Your want...',
                      hintStyle: customizeTextStyle(
                          FontWeight.w700, 0.04.sw, thinGrayColor),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        size: 0.07.sw,
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _filterController.categorywiseTeacherList.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Padding(
                      padding: EdgeInsets.all(0.03.sw),
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 0.23.sw,
                            width: 0.23.sw,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: _filterController
                                          .categorywiseTeacherList[index]
                                          .photo
                                          .path !=
                                      null
                                  ? Image.network(_filterController
                                      .categorywiseTeacherList[index]
                                      .photo
                                      .path)
                                  : Image.asset(
                                      user2,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          SigninSignUpWidget().getWidthSizedBox(0.01.sh),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _filterController
                                        .categorywiseTeacherList[index].name ??
                                    '',
                                overflow: TextOverflow.ellipsis,
                                style: customizeTextStyle(
                                    FontWeight.w700, 0.05.sw, black),
                              ),
                              SigninSignUpWidget().getHeightSizedBox(0.01.sh),
                              RatingBar.builder(
                                initialRating: _filterController
                                        .categorywiseTeacherList[index]
                                        .rating ??
                                    0.0,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 0.04.sw,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.red,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SigninSignUpWidget().getHeightSizedBox(0.01.sh),
                              RichText(
                                text: TextSpan(
                                    text: 'Language ',
                                    style: TextStyle(
                                        color: grayColor, fontSize: 0.03.sw),
                                    children: [
                                      TextSpan(
                                          text: 'Hindi ',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 0.03.sw)),
                                      TextSpan(
                                          text: 'Upcoming Classes ',
                                          style: TextStyle(
                                              color: grayColor,
                                              fontSize: 0.03.sw)),
                                      TextSpan(
                                          text: _filterController
                                                  .categorywiseTeacherList[
                                                      index]
                                                  .upcomingClass ??
                                              '',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 0.03.sw)),
                                    ]),
                              ),
                              SigninSignUpWidget().getHeightSizedBox(0.01.sh),
                              Row(
                                children: [
                                  Text(
                                    'Price ',
                                    style: TextStyle(
                                        color: grayColor, fontSize: 0.03.sw),
                                  ),
                                  Text(
                                      _filterController
                                              .categorywiseTeacherList[index]
                                              .perClassPrice ??
                                          0,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 0.03.sw)),
                                  FaIcon(
                                    FontAwesomeIcons.check,
                                    color: red,
                                    size: 0.04.sw,
                                  ),
                                  Text(
                                    ' Premium | ',
                                    style: TextStyle(
                                        color: grayColor, fontSize: 0.03.sw),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.check,
                                    color: green,
                                    size: 0.04.sw,
                                  ),
                                  Text(
                                    ' Free',
                                    style: TextStyle(
                                        color: grayColor, fontSize: 0.03.sw),
                                  ),
                                ],
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
                ),
              ),
            ),
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
                Get.to(SessionSchedule());
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

  void showbuttonSheet() {
    Get.bottomSheet(BottomSheet(onClosing: () {
      // print('bottomsheet close');
    }, builder: (context) {
      return Container(
        width: 1.sw,
        height: 0.45.sh,
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
                  InkWell(
                    onTap: () {
                      _filterController.priceSort = 'asc';
                    },
                    child: Text(
                      'Price Ascending',
                      style:
                          customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                    ),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  InkWell(
                    onTap: () {
                      _filterController.priceSort = 'desc';
                    },
                    child: Text(
                      'Price Descending',
                      style:
                          customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                    ),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  InkWell(
                    onTap: () {
                      _filterController.ratingSort = 'asc';
                    },
                    child: Text(
                      'Rating Ascending',
                      style:
                          customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                    ),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  InkWell(
                    onTap: () {
                      _filterController.ratingSort = 'desc';
                    },
                    child: Text(
                      'Rating Descending',
                      style:
                          customizeTextStyle(FontWeight.w700, 0.04.sw, black),
                    ),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'Cancel',
                      style: customizeTextStyle(FontWeight.w900, 0.04.sw, red),
                    ),
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
