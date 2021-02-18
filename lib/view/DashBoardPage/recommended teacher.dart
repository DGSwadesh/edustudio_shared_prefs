import 'package:edustudio/Controller/recomandedTeacher_controller.dart';
import 'package:flutter/material.dart';
import 'package:edustudio/view/DashBoardPage/recomanderTeacherWidget.dart';
import 'package:get/get.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecommendedTeacher extends StatefulWidget {
  var allCategoryController;
  RecommendedTeacher({
    this.allCategoryController,
  });

  @override
  _RecommendedTeacherState createState() => _RecommendedTeacherState();
}

class _RecommendedTeacherState extends State<RecommendedTeacher> {
  // TabController _tabController;
  // PageController controller = PageController();
  var recomendedTeacherController = Get.put(DashbordController());
  @override
  void initState() {
    recomendedTeacherController.fetchAllSubjectCatagory();


    // recomendedTeacherController.selectTab(0, widget.allCategoryController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var controllerList = widget.allCategoryController.listOfSubj;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blue,
          title: Text("Recommended Teacher"),
          bottom: PreferredSize(
            preferredSize: Size(100, 20),
            child: Container(
              width: 1.sw,
              height: 0.04.sh,
              child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.allCategoryController.listOfSubj.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: widget.allCategoryController.listOfSubj.length <= 4
                          ? width /
                              widget.allCategoryController.listOfSubj.length
                          : 0.3.sw,
                      height: 0.01.sh,
                      // padding: EdgeInsets.all(0),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            recomendedTeacherController.selectTab(
                                index);

                            // recomendedTeacherController.fetchRecomandedTeacher(
                            //     cat_id: widget.allCategoryController.listOfSubj[index].id);

                            // widget.allCategoryController.listOfSubj[index].selectedCategory(index);
                          },
                          child: Text(
                            recomendedTeacherController
                                .listOfSubj[index].categoryName,
                            style: customizeTextStyle(
                                FontWeight.w500,
                                0.04.sw,
                                recomendedTeacherController
                                        .listOfSubj[index].isSelected
                                    ? white
                                    : black),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
          ),
        ),
        body: RecomandedTeacherWidget(
            recomendedTeacherController: recomendedTeacherController));
  }
}
