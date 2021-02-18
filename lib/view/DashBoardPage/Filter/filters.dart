import 'package:edustudio/Controller/filter_controller.dart';
import 'package:edustudio/util/constant.dart';
import 'package:edustudio/view/DashBoardPage/Filter/language.dart';
import 'package:edustudio/view/DashBoardPage/Filter/price.dart';
import 'package:edustudio/view/DashBoardPage/Filter/rating.dart';
import 'package:edustudio/view/DashBoardPage/Filter/sub_catagory.dart';
import 'package:edustudio/view/DashBoardPage/categoryWiseTeacherList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Filters extends StatefulWidget {
  int id;
  // var languageController;
  // var ratingController;
  // var priceController;
  // var allCategoryController;
  var filterController;
  // var categorywiseTeacherListController;
  Filters({
    this.id,
    // this.languageController,
    // this.ratingController,
    // this.priceController,
    // this.allCategoryController,
    this.filterController,
    // this.categorywiseTeacherListController,
  });

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  //List<CheckBoxListTileModel> checkBoxListTileModel =
  //CheckBoxListTileModel.getUsers();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    final tabController = DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          title: Text("Filters"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  "Language",
                  style:
                      TextStyle(fontSize: 0.04.sw, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  "Rating",
                  style:
                      TextStyle(fontSize: 0.04.sw, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  "Price",
                  style:
                      TextStyle(fontSize: 0.04.sw, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  "Subcategory",
                  style:
                      TextStyle(fontSize: 0.04.sw, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 26.0,
                ),
                onPressed: () {
                  Get.back();
                }),
          ],
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                Language(widget.filterController),
                Rating(widget.filterController),
                Price(widget.filterController),
                SubCatagory(id: widget.id, controller: widget.filterController)
              ],
            ),
            Positioned(
                bottom: 0.0,
                child: Container(
                  width: 1.sw,
                  child: Material(
                    elevation: 10.0,
                    /* */
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: _width * 0.07,
                          right: _width * 0.03,
                          bottom: _height * 0.04,
                          top: _height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1200 Results found',
                            style: customizeTextStyle(
                                FontWeight.w500, 0.04.sw, Colors.black),
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  widget.filterController.clearFilter();
                                },
                                child: Container(
                                  width: 0.4.sw,
                                  height: 0.12.sw,
                                  decoration: BoxDecoration(
                                      color: primaryColor2,
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
                                    "CLEAR FILTERS",
                                    style: customizeTextStyle(
                                        FontWeight.w800, 0.05.sw, black),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  widget.filterController
                                      .applyFilter(widget.id);
                                },
                                child: Container(
                                  width: 0.4.sw,
                                  height: 0.12.sw,
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
                                    "ApplyFilters",
                                    style: customizeTextStyle(FontWeight.w600,
                                        0.05.sw, primaryColor2),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
    return tabController;
  }
}
