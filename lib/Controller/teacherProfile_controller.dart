import 'package:edustudio/Model/TeacherProfileModel.dart';
import 'package:edustudio/Model/allSubjectCatagoryModel.dart';
import 'package:edustudio/Model/teacher_reviews_model.dart';
import 'package:edustudio/util/constant.dart';
import 'package:get/get.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/Model/teacherRatingModel.dart';

class TeacherProfileController extends GetxController {
  var isLoading = true.obs;
  var teachersProfile = TeachersProfileModel().obs;
  var courseList = List<Courses>().obs;
  var upcomingClassList = List<UpcomingClasses>().obs;
  var selectedTabIndex = 0.obs;

// >>>>>>>>>>>> Teacher Rating variavles  <<<<<<<<<<<<<<<<<
  var teacherRating = TeacherRatingModel().obs;
  var totalRating = 0.0.obs;
  var averageRating = 0.0.obs;

  //>>>>>>>> teacherReviews variables <<<<<<<<<<<<<<<<<<<<
  var teacherReviews = TeacherReviewsModel().obs;

  //>>>>>>>> functions <<<<<<<<<<<<<<<<<<<<
  void fetchTeacherProfile(teacherUser_id) async {
    try {
      isLoading.value = true;
      teachersProfile.value =
          await networkcallService.fetchTechersProfile(teacherUser_id);
      courseList.assignAll(teachersProfile.value.data.courses);
      upcomingClassList
          .assignAll(teachersProfile.value.data.courses[0].upcomingClasses);
      // courseList.refresh();
      upcomingClassList.refresh();
    } catch (e) {
      isLoading.value = false;
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }

  void selectTab(index, teacherUser_id) {
    courseList.map((element) => element.isSelected = false).toList();
    courseList[index].isSelected = true;
    courseList.refresh();
    selectedTabIndex.value = index;
    // fetchTeacherProfile(teacherUser_id);
  }

  //>>>>>>>> fetchTeacherRating <<<<<<<<<<<<<<<<<<<<
  void fetchTeacherRating(teacherUser_id) async {
    try {
      // isLoading.value = true;
      teacherRating.value =
          await networkcallService.fetchTeacherRating(teacherUser_id);
      // print(teacherRating);
      // print(teacherRating);
      totalRating.value = teacherRating.value.data.totalCountRating;
      averageRating.value = (teacherRating.value.data.excellent +
              teacherRating.value.data.good +
              teacherRating.value.data.average +
              teacherRating.value.data.poor +
              teacherRating.value.data.terrible) /
          teacherRating.value.data.totalCountRating;
    } catch (e) {
      // isLoading.value = false;
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }

  //>>>>>>>> fetchTeacherReviews <<<<<<<<<<<<<<<<<<<<
  void fetchTeacherReviews(teacherUser_id) async {
    try {
      // isLoading.value = true;
      teacherReviews.value =
          await networkcallService.fetchTeacherReviews(teacherUser_id);
      // print(teacherRating);
    } catch (e) {
      // isLoading.value = false;
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }
}
