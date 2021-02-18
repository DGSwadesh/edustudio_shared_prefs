
import 'package:edustudio/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Price extends StatelessWidget {
  var _priceController;
  Price(this._priceController);

  // bool _isPickles = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 0.006.sw,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Obx(() => CheckboxListTile(
              activeColor: Colors.indigo,
              title: Text(
                _priceController.listOfPrice[index].name,
                style:
                    customizeTextStyle(FontWeight.w500, 0.05.sw, Colors.black),
              ),
              value: _priceController.listOfPrice[index].isSelected,
              //  activeColor: AddToCartButton,
              onChanged: (Value) {
                _priceController.priceToggleSelection(index);
              },
              controlAffinity: ListTileControlAffinity.leading,
            ));
      },
    ));
  }
}
