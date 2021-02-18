import 'package:flutter/material.dart';
import '../util/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninSignUpWidget {
  Widget customTextField({
    height,
    controller,
    hintText,
    icon,
    validationFunction,
    color,
    borderColor,
  }) {
    return TextFormField(
      controller: controller,
      validator: validationFunction,
      style: customizeTextStyle(FontWeight.w500, 0.05.sw, color),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: borderColor,
          size: 0.06.sw,
        ),
        hintText: hintText,
        hintStyle: customizeTextStyle(FontWeight.w500, 0.04.sw, white),
        contentPadding: EdgeInsets.all(15),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }

  Widget getLoginSignupButton({
    width,
    text,
  }) {
    return Container(
      width: 0.7.sw,
      height: 0.13.sw,
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
        text,
        style: customizeTextStyle(FontWeight.w600, 0.06.sw, primaryColor2),
      )),
    );
  }

  Widget getHeightSizedBox(height) {
    return SizedBox(
      height: height,
    );
  }

  Widget getWidthSizedBox(width) {
    return SizedBox(
      width: width,
    );
  }
}
