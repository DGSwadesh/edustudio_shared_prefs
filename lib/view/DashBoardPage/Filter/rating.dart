import 'package:edustudio/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Rating extends StatelessWidget {
  var _ratingController;
  Rating(this._ratingController);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) => Divider(
                  thickness: 0.006.sw,
                ),
            itemBuilder: (BuildContext ctx, int index) {
              return Obx(() => Container(
                      child: CheckboxListTile(
                    activeColor: Colors.indigo,
                    value: _ratingController.listOfRating[index].isSelected,
                    //  activeColor: AddToCartButton,
                    onChanged: (Value) {
                      _ratingController.ratingToggleSelection(index);
                    },
                    title: Text(
                      _ratingController.listOfRating[index].name,
                      style: customizeTextStyle(
                          FontWeight.w500, 0.05.sw, Colors.black),
                      // style: customizeTextStyle(
                      //     mediumTextWeight,
                      //     16.0,
                      //     Colors.black)
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  )));
            }));
  }
}
