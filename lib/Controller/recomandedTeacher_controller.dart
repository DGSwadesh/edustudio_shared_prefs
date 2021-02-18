import 'package:edustudio/Model/RecomendedTeacherModel.dart';
import 'package:edustudio/Model/allSubjectCatagoryModel.dart';
import 'package:edustudio/Model/categorywiseTeacherList_model.dart';
import 'package:edustudio/Model/subCatagoryModel.dart';
import 'package:edustudio/util/constant.dart';
import 'package:edustudio/view/DashBoardPage/recomanderTeacherWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/Model/allSubjectCatagoryModel.dart';
import 'package:edustudio/Model/languageModel.dart';
import 'package:edustudio/util/constant.dart';
import 'package:get/get.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/Model/allSubjectCatagoryModel.dart';
import 'package:edustudio/Model/languageModel.dart';
import 'package:edustudio/Model/priceModel.dart';
import 'package:edustudio/Model/ratingModel.dart';
import 'package:edustudio/util/constant.dart';
import 'package:get/get.dart';
import 'package:edustudio/services/Networkcall.dart';

class DashbordController extends GetxController {
  var isLoading = true.obs;
  // var listOfCategoryTabs = List<Tab>().obs;
  var recomendedTeacherModel = RecomendedTeacherModel().obs;
  var recomandedTeacherList = List<Data>().obs;
  // var isLoading = true.obs;
  var listOfSubj = List<AllSubjectCatagoryModel>().obs;

  // dg demo code

  @override
  void onInit() {
    print('DashbordController started');
    super.onInit();
  }

  //dg demo code
  
  fetchRecomandedTeacher({cat_id}) async {
    try {
      isLoading.value = true;
      recomendedTeacherModel.value =
          await networkcallService.fetchRecomandedTeacher(cat_id);
      // print(listofteachers);
      // print('dig');
      recomandedTeacherList.assignAll(recomendedTeacherModel.value.data);
      // recomandedTeacherList.assignAll(listofteachers);
      recomandedTeacherList.refresh();
    } catch (e) {
      isLoading.value = false;
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }

  fetchAllSubjectCatagory() async {
    try {
      isLoading.value = true;
      var listOfSub = await Networkcall().fetchAllSubjectCatagory();
      listOfSubj.assignAll(listOfSub);
      selectTab(0);
    } catch (e) {
      isLoading.value = false;
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }

  void selectTab(index) {
    listOfSubj.map((element) => element.isSelected = false).toList();
    listOfSubj[index].isSelected = true;
    listOfSubj.refresh();
    fetchRecomandedTeacher(cat_id: listOfSubj[index].id);
  }

  //   void subCategoryToggleSelection(index) {
  //   listOfSubCatagory.map((element) => element.isSelected = false);
  //   listOfSubCatagory[index].isSelected = !listOfSubCatagory[index].isSelected;
  //   listOfSubCatagory.refresh();
  // }
}
