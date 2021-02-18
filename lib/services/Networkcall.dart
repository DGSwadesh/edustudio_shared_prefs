import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:edustudio/Model/RecomendedTeacherModel.dart';
import 'package:edustudio/Model/StudentSubsPlanModel.dart';
import 'package:edustudio/Model/TeacherProfileModel.dart';
import 'package:edustudio/Model/allSubjectCatagoryModel.dart';
import 'package:edustudio/Model/categorywiseTeacherList_model.dart';
import 'package:edustudio/Model/countryListModel.dart';
import 'package:edustudio/Model/header.dart';
import 'package:edustudio/Model/languageModel.dart';
import 'package:edustudio/Model/subCatagoryModel.dart';
import 'package:edustudio/Model/teacher_reviews_model.dart';
import 'package:edustudio/services/MyClient.dart';
import 'package:edustudio/util/error_handler.dart';
import 'package:edustudio/util/sharePreference_instance.dart';
import 'package:http/http.dart';
import 'package:edustudio/util/constant.dart';
import 'package:edustudio/Model/teacherRatingModel.dart';

class Networkcall {
  static final Networkcall networkcall = new Networkcall._internal();

  Networkcall._internal();

  factory Networkcall() {
    return networkcall;
  }

  final auth_token = 'Bearer ${SharePreferenceInstance().getToken()}';

  //>>>>>>>>>>>>>>>>>>>>>>>>>>>parentRegister<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<bool> parentRegisterApiCall({
    String name,
    String email,
    String password,
    String confirm_password,
    String mobile,
  }) async {
    String url = BASE_URL + parentRegister;
    Map<String, dynamic> body = {
      "name": name,
      "email": email,
      "password": password,
      "confirm_password": confirm_password,
      "mobile": mobile,
    };
    // make POST request
    // print(json.encode(body));
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .post(url, body: body, headers: HeaderModelJSON("").toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('parentRegister $jsonResponse');
        sharePrefereceInstance.saveParentsData(jsonResponse);
        if (jsonResponse['status'] == SUCCESS) {
          return true;
        } else {
          showToast(jsonResponse["message"], red);
          return false;
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //>>>>>>>>>>>>>>>>>>>>>>>>>>>parentRegister 2<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<bool> parentRegister2ApiCall({
    String dob,
    String alt_mobile,
    String education,
    String address_line1,
    String address_line2,
    String zip,
    String country,
    String state,
    String city,
  }) async {
    String url = BASE_URL + parentRegister2;
    final parentToken = 'Bearer ${SharePreferenceInstance().getParentToken()}';
    print('parentRegister2ApiCall' + url);
    print('token' + parentToken);
    Map<String, dynamic> body = {
      "dob": dob,
      "alt_mobile": alt_mobile,
      "education": education,
      "address_line1": address_line1,
      "address_line2": address_line2,
      "zip": zip,
      "country": country,
      "state": state,
      "city": city,
    };
    // make POST request
    print(json.encode(body));
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap()).post(url,
              body: body, headers: HeaderModelJSON(parentToken).toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('register2 $jsonResponse');
        showToast(jsonResponse["message"], green);
        // sharePrefereceInstance.saveParentsData(jsonResponse);
        if (jsonResponse['status'] == SUCCESS) {
          return true;
        } else {
          showToast(jsonResponse["message"], red);
          return false;
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  ///student Subscription plan---------------------------------------------
  Future<StudentSubsPlan> studentSubscriptionPlan() async {
    final parentToken = 'Bearer ${SharePreferenceInstance().getParentToken()}';
    print(parentToken);

    ///List<StudentSubsPlan> subscriptionList = List();
    String url = '$BASE_URL$studentSubscriptionPlanApi';

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON(parentToken).toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('studentSubscriptionPlan + $jsonResponse');
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          // for (var subjItem in jsonResponse['data']) {
          //   var allSubscription = StudentSubsPlan.fromJson(subjItem);
          //   subscriptionList.add(allSubscription);
          // }
          return StudentSubsPlan.fromJson(jsonResponse);
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //fetchCountry List
  Future<CountryModel> fetchCountryList() async {
    String url = '$BASE_URL$countryList';
    print(url);

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON('').toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('studentSubscriptionPlan + $jsonResponse');
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          // for (var subjItem in jsonResponse['data']) {
          //   var allSubscription = StudentSubsPlan.fromJson(subjItem);
          //   subscriptionList.add(allSubscription);
          // }
          //return StudentSubsPlan.fromJson(jsonResponse);

          return CountryModel.fromJson(jsonResponse);
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //fetch state List
  Future<StateModel> fetchStateList(int countryId) async {
    String url = '$BASE_URL$stateList$countryId';
    print(url);

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON('').toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('fetchStateList + $jsonResponse');
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          // for (var subjItem in jsonResponse['data']) {
          //   var allSubscription = StudentSubsPlan.fromJson(subjItem);
          //   subscriptionList.add(allSubscription);
          // }
          //return StudentSubsPlan.fromJson(jsonResponse);
          return StateModel.fromJson(jsonResponse);
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //fetchCity List
  Future<CityModel> fetchCityList(int stateId) async {
    String url = '$BASE_URL$cityList$stateId';
    print(url);

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON('').toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('fetchCityList + $jsonResponse');
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          // for (var subjItem in jsonResponse['data']) {
          //   var allSubscription = StudentSubsPlan.fromJson(subjItem);
          //   subscriptionList.add(allSubscription);
          // }
          //return StudentSubsPlan.fromJson(jsonResponse);
          return CityModel.fromJson(jsonResponse);
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  ///parent Profile
  Future<bool> fetchParentProfile() async {
    final parentToken = 'Bearer ${SharePreferenceInstance().getParentToken()}';
    print(parentToken);
    String url = '$BASE_URL$parentProfile';
    print(url);

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON(parentToken).toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('studentSubscriptionPlan + $jsonResponse');
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          // for (var subjItem in jsonResponse['data']) {
          //   var allSubscription = StudentSubsPlan.fromJson(subjItem);
          //   subscriptionList.add(allSubscription);
          // }
          //return StudentSubsPlan.fromJson(jsonResponse);
          return true;
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  ///user role
  Future<bool> fetchUserRole() async {
    final parentToken = 'Bearer ${SharePreferenceInstance().getParentToken()}';
    print(parentToken);
    String url = '$BASE_URL$userRole';
    print(url);

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON(parentToken).toMap())
              .get(url, headers: HeaderModelJSON('').toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('studentSubscriptionPlan + $jsonResponse');
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          // for (var subjItem in jsonResponse['data']) {
          //   var allSubscription = StudentSubsPlan.fromJson(subjItem);
          //   subscriptionList.add(allSubscription);
          // }
          //return StudentSubsPlan.fromJson(jsonResponse);
          showToast('this is enjoy', red);
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      print(e);
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  /////student- register ----------------------------------------------------
  Future<bool> studentRegister({
    String plan_id,
    String payment_note,
    String name,
   String email,
    String password,
    String mobile,
   String dob,
    String education,
    String address_line1,
    String country,
    String state,
    String city,
   String zip,
    String profile_photo,//
    String alt_mobile,//
    String address_line2,//
    String joining_reason,//
    String interest_cat_ids,//
  }) async {
    String url = BASE_URL + studentsRegister;
    print('studentRegister' + url);
    Map<String, dynamic> body = {
      "plan_id": plan_id,
      "payment_note": payment_note,
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile,
      "dob": dob,
      "education": education,
      "profile_photo": profile_photo,
      "alt_mobile": alt_mobile,
      "joining_reason": joining_reason,
      "interest_cat_ids": interest_cat_ids,
      "address_line1": address_line1,
      "address_line2": address_line2,
      "zip": zip,
      "country": country,
      "state": state,
      "city": city,
    };
    // make POST request
    print(json.encode(body));
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .post(url, body: body, headers: HeaderModelJSON('').toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('register2 $jsonResponse');
        showToast(jsonResponse["message"], green);
        // sharePrefereceInstance.saveParentsData(jsonResponse);
        if (jsonResponse['status'] == SUCCESS) {
          return true;
        } else {
          showToast(jsonResponse["message"], red);
          return false;
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // //>>>>>>>>>>>>>>>>>>>>>>>>>>>sign-up<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  // Future<bool> signUpApiCall({
  //   String name,
  //   String phoneNumber,
  //   String user_email,
  //   String password,
  //   String confirmPassword,
  // }) async {
  //   String url = BASE_URL + user_register;
  //   Map<String, dynamic> body = {
  //     "name": name,
  //     "email": user_email,
  //     "password": password,
  //     "confirm_password": confirmPassword,
  //     "mobile": phoneNumber,
  //   };
  //   // make POST request
  //   // print(json.encode(body));
  //   try {
  //     Response response =
  //         await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
  //             .post(url, body: body, headers: HeaderModelJSON("").toMap());
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       print('dg $jsonResponse');
  //       sharePrefereceInstance.saveUserDetail(jsonResponse);
  //       // sharePrefereceInstance.setEmail(jsonResponse["email"]);
  //       // print(sharePrefereceInstance.getEmail());
  //       // sharePrefereceInstance.setIsLogin(true);
  //       //otp
  //       // sharePrefereceInstance.setPassword(json.decode(response.body)["otp"]);
  //       //print(sharePrefereceInstance.getOtp());
  //       if (jsonResponse['status'] == SUCCESS) {
  //         return true;
  //       } else {
  //         showToast(jsonResponse["message"], red);
  //         return false;
  //       }
  //     } else {
  //       throw CustomError(json.decode(response.body)["message"]);
  //     }
  //   } catch (e) {
  //     e is CustomError
  //         ? throw CustomError(e.errorMessage())
  //         : throw CustomError(INTERNET_ERROR);
  //   }
  // }

  //>>>>>>>>>>>>>>>>>>>>>>>>>>>Sign in<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<bool> signInApiCall({String email, String password}) async {
    String url = BASE_URL + user_login;

    Map<String, dynamic> body = {"email": email, "password": password};
    // make POST request
    print(json.encode(body));
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .post(url, body: body, headers: HeaderModelJSON("").toMap());

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('dg $jsonResponse');

        sharePrefereceInstance.saveParentsData(jsonResponse);
        // showToast(jsonResponse["msg"], colorGreenAccent);
        if (jsonResponse['status'] == SUCCESS) {
          return true;
        } else {
          showToast(jsonResponse["message"], red);
          return false;
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } on SocketException {
      throw CustomError('No Internet connection 😑');
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //>>>>>>>>>>>>>>>>>Fetch_all_catagory<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<List<AllSubjectCatagoryModel>> fetchAllSubjectCatagory() async {
    List<AllSubjectCatagoryModel> subjList = List();
    String url = '$BASE_URL$allCatagory';

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap()).get(url,
              headers: HeaderModelJSON(SharePreferenceInstance().getToken())
                  .toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          for (var subjItem in jsonResponse['data']) {
            var allSubj = AllSubjectCatagoryModel.fromJson(subjItem);
            subjList.add(allSubj);
          }
          return subjList;
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //>>>>>>>>>>>>>>>>>Fetch_all_SubCatagory<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<List<SubCategoryModel>> fetchAllSubCategories(id) async {
    List<SubCategoryModel> subjList = List();
    String url = '$BASE_URL$allSubCategory$id';
    print(url);
    print('dg5');

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON('').toMap());
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          for (var subjItem in jsonResponse['data']) {
            var allSubj = SubCategoryModel.fromJson(subjItem);
            subjList.add(allSubj);
          }
          print(subjList);
          return subjList;
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //>>>>>>>>>>>>>>>>> Fetch_all_Language <<<<<<<<<<<<<<<<<<<<<<<<<
  Future<List<LanguageModel>> fetchAllLanguage() async {
    List<LanguageModel> subjList = List();
    String url = '$BASE_URL$allLanguages';

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON('').toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        // print(jsonResponse);
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          for (var langItem in jsonResponse['data']) {
            // print(langItem);
            var allLanguage = LanguageModel.fromJson(langItem);
            subjList.add(allLanguage);
          }
          return subjList;
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //>>>>>>>>>>>>>>>>>Fetch_CategoryWiseTeacherList<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<List<categorywiseTeacherListModel>> fetchCategoryWiseTeacherList(
      url) async {
    List<categorywiseTeacherListModel> categoryWiseTeacherList = List();
    // String url = '$BASE_URL$categoryWiseTeachers?cat=1&lan=&rating=&priceRange=1,200&priceSort=desc&ratingSort=asc';
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap()).get(url,
              headers: HeaderModelJSON(SharePreferenceInstance().getToken())
                  .toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          for (var subjItem in jsonResponse['data']) {
            var allSubj = categorywiseTeacherListModel.fromJson(subjItem);
            categoryWiseTeacherList.add(allSubj);
          }
          return categoryWiseTeacherList;
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //>>>>>>>>>>>>>>>>>Fetch_CategoryWiseTeacherList<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<RecomendedTeacherModel> fetchRecomandedTeacher(cat_id) async {
    // List<RecomendedTeacherModel> categoryWiseTeacherList = List<RecomendedTeacherModel>();
    String url = '$BASE_URL$recomandedTeacher$cat_id';
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON("").toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          // for (var subjItem in jsonResponse['data']) {
          //   var allSubj = RecomendedTeacherModel.fromJson(subjItem);
          //   categoryWiseTeacherList.add(allSubj);
          // }
          return RecomendedTeacherModel.fromJson(jsonResponse);
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //>>>>>>>>>>>>>>>>>fetchTechersProfile<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  Future<TeachersProfileModel> fetchTechersProfile(teacherUser_id) async {
    // List<TeachersProfileModel> categoryWiseTeacherList = List();
    String url = '$BASE_URL$teacherProfile$teacherUser_id';
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON("").toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          var teachersProfile = TeachersProfileModel.fromJson(jsonResponse);
          // categoryWiseTeacherList.add(allSubj);
          return teachersProfile;
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // >>>>>>>>>>>>>>>>>  fetchTeacherRating  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  Future<TeacherRatingModel> fetchTeacherRating(teacherUser_id) async {
    // List<TeachersProfileModel> categoryWiseTeacherList = List();
    String url = '$BASE_URL$teacherReviewCount$teacherUser_id';
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON("").toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          var teacherRating = TeacherRatingModel.fromJson(jsonResponse);
          // categoryWiseTeacherList.add(allSubj);
          return teacherRating;
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // >>>>>>>>>>>>>>>>>  fetchTeacherReviews  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  Future<TeacherReviewsModel> fetchTeacherReviews(teacherUser_id) async {
    // List<TeachersProfileModel> categoryWiseTeacherList = List();
    String url = '$BASE_URL$teacherReviews$teacherUser_id';
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON("").toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // return json.decode(response.body)["msg"];
        if (jsonResponse['status'] == 'success') {
          var teacherReviews = TeacherReviewsModel.fromJson(jsonResponse);
          // categoryWiseTeacherList.add(allSubj);
          return teacherReviews;
        } else {
          showToast('this is error', red);
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //>>>>>>>>>>>>>>>>>>>>>>>>>>>saveReview<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  Future<bool> saveReview({
    String teacherUserId,
    String rating,
    String heading,
    String description,
  }) async {
    String url = BASE_URL + save_review;
    Map<String, dynamic> body = {
      "teacher_user_id": teacherUserId,
      "rating": rating,
      "heading": heading,
      "description": description,
    };
    // make POST request
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON(auth_token).toMap())
              .post(url, body: body, headers: HeaderModelJSON("").toMap());

      print('dg $response');
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('dg $jsonResponse');
        // sharePrefereceInstance.saveUserDetail(jsonResponse);
        // sharePrefereceInstance.setEmail(jsonResponse["email"]);
        // print(sharePrefereceInstance.getEmail());
        // sharePrefereceInstance.setIsLogin(true);
        //otp
        // sharePrefereceInstance.setPassword(json.decode(response.body)["otp"]);
        //print(sharePrefereceInstance.getOtp());
        if (jsonResponse['status'] == SUCCESS) {
          return true;
        } else {
          showToast(jsonResponse["message"], red);
          return false;
        }
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  //saveUserDetails
  //upload image ................................................................
  Future<Map<String, dynamic>> saveUserDetails(var request) async {
    Map<String, dynamic> responseData;

    try {
      // send request to upload image
      await request.send().then((response) async {
        // listen for response

        Map respStr = json.decode(await response.stream.bytesToString());
        responseData = respStr;
        print(responseData);
      }).catchError((e) {
        print(e);
        return null;
      });

      return responseData;
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR); // Network error
    }
  }
  /*Future<String> saveUserDetails(
      {String user_email,
      String user_name,
      String user_phone,
      String image_url}) async {
    String url = BASE_URL + updateProfile;

    Map<String, dynamic> body = {
      "email": user_email,
      "name": user_name,
      "mobile": user_phone,
      "photo": image_url
    };
    // make POST request
    print(json.encode(body));
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON(auth_token).toMap()).post(url,
              body: body, headers: HeaderModelJSON('').toMap());
        print(auth_token);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        sharePrefereceInstance.saveUserDetail(jsonResponse);
        //user_email
        // sharePrefereceInstance
        //     .setEmail(jsonResponse["email"]);
        // //  print(sharePrefereceInstance.getEmail());
        // //userName
        // sharePrefereceInstance
        //     .setUserName(json.decode(response.body)["name"]);
        // print(sharePrefereceInstance.getUserName());

        // sharePrefereceInstance
        //     .setPhoneNo(json.decode(response.body)["mobile"]);
        // print(sharePrefereceInstance.getPhoneNo());
        //user_id
        // sharePrefereceInstance.setUserId(json.decode(response.body)["user_id"]);
        // print(sharePrefereceInstance.getUserId());

        return json.decode(response.body)["message"];
      } else {
        throw CustomError(json.decode(response.body)["message"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }*/

  // //forgot_password(get)
  // Future<bool> forgotPassword({String user_email}) async {
  //   //String url = BASE_URL + forgot_password;
  //   String url = '$BASE_URL$forgot_password?user_email=$user_email';
  //   // Map<String, dynamic> body = {"user_email": user_email,};
  //   // make POST request
  //   print(url);
  //   try {
  //     Response response =
  //         await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
  //             .get(url, headers: HeaderModelJSON().toMap());
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       print(jsonResponse);

  //       // //user_email
  //       // sharePrefereceInstance
  //       //     .setEmail(json.decode(response.body)["user_email"]);
  //       // print(sharePrefereceInstance.getEmail());
  //       // return json.decode(response.body)["msg"];
  //       if (jsonResponse['status'] == SUCCESS) {
  //         return true;
  //       } else {
  //         showToast(jsonResponse["msg"], red);
  //         return false;
  //       }
  //     } else {
  //       throw CustomError(json.decode(response.body)["msg"]);
  //     }
  //   } catch (e) {
  //     e is CustomError
  //         ? throw CustomError(e.errorMessage())
  //         : throw CustomError(INTERNET_ERROR);
  //   }
  // }

  ///reset_password_new(post)
  Future<bool> ResetPasswordNew({String user_id, String password}) async {
    String url = BASE_URL + reset_password_new;
    Map<String, dynamic> body = {"user_id": user_id, "password": password};
    // make POST request
    print(json.encode(body));
    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap()).post(url,
              body: body,
              headers: HeaderModelJSON(SharePreferenceInstance().getToken())
                  .toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        if (jsonResponse['status'] == SUCCESS) {
          showToast("Successfully password changed", colorGreenAccent);
          return true;
        } else {
          showToast(jsonResponse["msg"], red);
          return false;
        }
      } else {
        throw CustomError(json.decode(response.body)["msg"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  ///reset_password(get)
  Future<Map<String, dynamic>> ResetPassword({String user_email}) async {
    String url = '$BASE_URL$reset_password_new?user_email=$user_email';
    print(url);

    Map<String, dynamic> responseData = {
      "status": false,
      "data": "",
      "msg": "",
    };

    try {
      Response response =
          await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
              .get(url, headers: HeaderModelJSON("").toMap());
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        if (jsonResponse['status'] == SUCCESS) {
          showToast(jsonResponse["message"], colorGreenAccent);
          responseData['status'] = true;
          responseData['data'] = jsonResponse["data"][0];
          return responseData;
        } else {
          showToast(jsonResponse["msg"], red);
          responseData['status'] = false;
          return responseData;
        }
      } else {
        throw CustomError(json.decode(response.body)["msg"]);
      }
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  // //check_otp(get)
  // Future<bool> checkOtp({String user_email, String otp}) async {
  //   String url = '$BASE_URL$check_otp?user_email=$user_email&otp=$otp';
  //   //  Map<String, dynamic> body = {"user_email": user_email, "otp": otp};
  //   // make POST request
  //   print(url);
  //   try {
  //     Response response =
  //         await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
  //             .get(url, headers: HeaderModelJSON("").toMap());
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       print(jsonResponse);
  //       if (jsonResponse['status'] == SUCCESS) {
  //         sharePrefereceInstance.saveUserDetail(jsonResponse['data'][0]);
  //         showToast(jsonResponse["msg"], colorGreenAccent);
  //         return true;
  //       } else {
  //         showToast(jsonResponse["msg"], red);
  //         return false;
  //       }
  //     } else {
  //       throw CustomError(json.decode(response.body)["msg"]);
  //     }
  //   } catch (e) {
  //     e is CustomError
  //         ? throw CustomError(e.errorMessage())
  //         : throw CustomError(INTERNET_ERROR);
  //   }
  // }

  // //check_otp(get)
  // Future<bool> checkOtpForForgotPassword(
  //     {String user_email, String otp}) async {
  //   String url = '$BASE_URL$check_otp?user_email=$user_email&otp=$otp';
  //   //  Map<String, dynamic> body = {"user_email": user_email, "otp": otp};
  //   // make POST request
  //   print(url);
  //   try {
  //     Response response =
  //         await MyClient(defaultHeaders: HeaderModelJSON("").toMap())
  //             .get(url, headers: HeaderModelJSON("").toMap());
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       print(jsonResponse);
  //       if (jsonResponse['status'] == SUCCESS) {
  //         showToast(jsonResponse["msg"], colorGreenAccent);
  //         return true;
  //       } else {
  //         showToast(jsonResponse["msg"], red);
  //         return false;
  //       }
  //     } else {
  //       throw CustomError(json.decode(response.body)["msg"]);
  //     }
  //   } catch (e) {
  //     e is CustomError
  //         ? throw CustomError(e.errorMessage())
  //         : throw CustomError(INTERNET_ERROR);
  //   }
  // }

// OrderList parseOrderResponseResponse(String responseBody) {
//   var jsonDecode = json.decode(responseBody);
//   return OrderList.fromJson(jsonDecode);
// }
}

Networkcall networkcallService = new Networkcall();
