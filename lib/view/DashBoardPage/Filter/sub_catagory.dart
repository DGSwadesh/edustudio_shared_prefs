import 'package:edustudio/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SubCatagory extends StatefulWidget {
  int id;
  var controller;
  SubCatagory({this.id, this.controller});

  @override
  _SubCatagoryState createState() => _SubCatagoryState();
}

class _SubCatagoryState extends State<SubCatagory> {
  bool _isPickles = false;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
            child: ListView.separated(
          itemCount: widget.controller.listOfSubCatagory.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 0.006.sw,
          ),
          itemBuilder: (BuildContext context, int index) {
            // print('dggg${widget.controller.listOfSubCatagory.length}');
            return Padding(
              padding: EdgeInsets.all(0.03.sw),
              child: InkWell(
                onTap: () {
                  widget.controller.subCategoryToggleSelection(index);
                },
                child: Row(
                  children: [
                    widget.controller.listOfSubCatagory[index].isSelected
                        ? Icon(
                            Icons.circle,
                            color: Colors.indigo,
                            size: 0.07.sw,
                          )
                        : FaIcon(
                            FontAwesomeIcons.circle,
                            color: Colors.indigo,
                            size: 0.06.sw,
                          ),
                    SizedBox(
                      width: 0.03.sw,
                    ),
                    Text(
                      widget.controller.listOfSubCatagory[index].categoryName,
                      style: customizeTextStyle(
                          FontWeight.w500, 0.05.sw, Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}
