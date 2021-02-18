import 'package:edustudio/view/DashBoardPage/Dashboard.dart';
import 'package:edustudio/view/DashBoardPage/mySubjectAllCategory.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customizeTextStyle(fontWeight, fontSize, fontColor) =>
    GoogleFonts.lato(
        textStyle: TextStyle(
            fontWeight: fontWeight,
            // fontFamily: 'Poppins',
            wordSpacing: 3,
            color: fontColor,
            fontSize: fontSize));

TextStyle customizeTextStyleSmallerSpace(fontWeight, fontSize, fontColor) =>
    GoogleFonts.lato(
        textStyle: TextStyle(
            fontWeight: fontWeight,
            // fontFamily: 'Poppins',
            wordSpacing: 1,
            letterSpacing: 0.3,
            color: fontColor,
            fontSize: fontSize));

showToast(msg, color) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
final FontWeight extraBoldTextWeight = FontWeight.w700;
final FontWeight boldTextWeight = FontWeight.w600;
final FontWeight mediumTextWeight = FontWeight.w500;
final FontWeight thinTextWeight = FontWeight.w400;
final FontWeight extraThinTextWeight = FontWeight.w300;
final Color backgroundColor = Color(0xff1ca3fd);
final Color loginButtonColor = Color(0xff01e0ff);
final Color white = Color(0xffffffff);
final Color lightWhite = Color(0xfffcf2f2);
final Color black = Color(0xff000000);
final Color green = Color(0xff336600);
final Color red = Color(0xffff1a1a);
final Color colorGreenAccent = Color(0xff00ff00);
final Color primaryColor2 = Color(0xFFfffbd5);
final Color grayColor = Color(0xFF6B7278);
final Color blueColor = Color(0xFF044fc8);
final Color darkRedColor = Color(0xFF6B7278);
final Color thinGrayColor = Color(0xFF6B7278);
final Color lightGrayColor = Color(0xFF6B7278);
final Color lightBlackBoldColor = Color(0xFF6B7278);

//=================================BASE URL====================================
final String BASE_URL = "https://laravel.gowebbidemo.com/122120/public/api/v1/";
//========================================sharedpreference======================

//---------------Parent Apis-----------------//
final String parentRegister = 'parentRegister'; //post
final String parentRegister2 = 'parentRegister2'; //post---access token
final String countryList = 'countryLists'; //get
final String stateList = 'countryWiseStateLists/'; //get
final String cityList = 'stateWiseCityList/'; //get
final String userRole = 'userRole'; //get
final String parentProfile = 'parentProfile'; //get--access token
final String studentSubscriptionPlanApi = 'studentSubscriptionPlan'; //get
final String studentsRegister = 'studentRegister'; //post
final String studentRegistaionFullApi = 'studentRegisterFull';

final String user_register = 'register'; //post
final String user_login = 'login'; //post
final String reset_password_new = 'forgot';
final String updateProfileUrl = 'updateProfile'; //post
final String allCatagory = 'allCategories'; //get
final String allSubCategory = 'allSubCategories/'; //get
final String allLanguages = 'allLanguages'; //get
final String categoryWiseTeachers = 'categoryWiseTeachers'; //get
final String recomandedTeacher = 'recommendedTeachers/'; //get
final String teacherProfile = 'teacherProfile/'; //get
final String teacherReviewCount = 'teacherReviewCount/'; //get
final String teacherReviews = 'teacherReviews/'; //get
final String save_review = 'saveReview'; //post

//==========================Text============================================
// final String appName = "EduStudio";

//========================assets======================
final String logInPageEdutationLogo = 'assets/images/education.svg';
final String premium = 'assets/images/premium.svg';
final String premium2 = 'assets/images/premium2.svg';
final String forgot = 'assets/images/forgot.svg';
final String video = 'assets/images/video.svg';
// final String logInShape = 'assets/shape.svg';
final String subscription = 'assets/images/subscription.svg';
final String logInShapePng = 'assets/shapePng.png';
final String user = 'assets/images/user.png';
final String user2 = 'assets/images/user2.jpg';
final String subject = 'assets/images/subjct.png';
final String dclass = 'assets/images/dclass.png';

// class Routes {
//   static const String dashBoradPage = DashBoradPage.routeName;
//   static const String mySubjectAllCategory = MySubjectAllCategory.routeName;
//   // static const String contacts = MySubjectAllCategory.routeName;
// }

/*
https://demo16.gowebbi.in/api/AccountApi/UserRegister --post -- user_email,first_name,last_name,password
https://demo16.gowebbi.in/api/AccountApi/CheckOtp -- get-- user_email,otp
https://demo16.gowebbi.in/api/AccountApi/Login -- post -- user_email,password
https://demo16.gowebbi.in/api/AccountApi/ForgetPassword -- get --user_email
https://demo16.gowebbi.in/api/AccountApi/SaveUserDetails -- post --user_email,first_name,last_name,user_phone,user_id -- access token
https://demo16.gowebbi.in/api/UserApi/FetchUser -- get --user_id -- access token
https://demo16.gowebbi.in/api/AccountApi/ResetPasswordNew --	POST --	user_id, password
https://demo16.gowebbi.in/api/AccountApi/ResetPassword --	GET --	user_email
 */
//========================================sharedpreference======================
//==========================Text============================================

final String INTERNET_ERROR = "Network connection appears to be offline";

final String SUCCESS = "success";
final String FAILED = "failed";

//========================assets======================
//https://demo16.gowebbi.in/api/AccountApi/ForgetPassword
