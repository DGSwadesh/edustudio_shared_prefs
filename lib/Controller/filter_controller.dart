import 'package:edustudio/Model/allSubjectCatagoryModel.dart';
import 'package:edustudio/Model/categorywiseTeacherList_model.dart';
import 'package:edustudio/Model/subCatagoryModel.dart';
import 'package:edustudio/util/constant.dart';
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

class FilterController extends GetxController {
  var isLoading = true.obs;
  var categorywiseTeacherList = List<categorywiseTeacherListModel>().obs;

  var listOfLang = List<LanguageModel>().obs;
  var listOfRating = List<RatingModel>().obs;
  var listOfPrice = List<PriceModel>().obs;
  var listOfSubCatagory = List<SubCategoryModel>().obs;

  String priceSort;
  String ratingSort;

  // var filter_listOfLang = List();
  // var filter_listOfRating = List();
  // var filter_listOfPrice = List();
  // var filter_listOfSubCategory = List();


  // dg demo code

  @override
  void onInit() {
    print('Dg FilterController started');
    super.onInit();
  }

  //dg demo code

  void langToggleSelection(index) {
    listOfLang[index].isSelected = !listOfLang[index].isSelected;
    listOfLang.refresh();
  }

  void ratingToggleSelection(index) {
    listOfRating[index].isSelected = !listOfRating[index].isSelected;
    listOfRating.refresh();
  }

  void priceToggleSelection(index) {
    listOfPrice[index].isSelected = !listOfPrice[index].isSelected;
    listOfPrice.refresh();
  }

  void subCategoryToggleSelection(index) {
    listOfSubCatagory.map((element) => element.isSelected = false);
    listOfSubCatagory[index].isSelected = !listOfSubCatagory[index].isSelected;
    listOfSubCatagory.refresh();
  }

  fetchAllLanguages() async {
    try {
      var listOflan = await Networkcall().fetchAllLanguage();
      listOfLang.assignAll(listOflan);
      // print(listOflang.length);
    } catch (e) {
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }

  addRatingList() {
    listOfRating.assignAll([
      RatingModel(id: 1, name: '1 ★ & above'),
      RatingModel(id: 2, name: '2 ★ & above'),
      RatingModel(id: 3, name: '3 ★ & above'),
      RatingModel(id: 4, name: '4 ★ & above'),
      RatingModel(id: 5, name: '5 ★ & above')
    ]);
  }

  addPriceListList() {
    listOfPrice.assignAll([
      PriceModel(id: 1, name: '£19 and Below'),
      PriceModel(id: 2, name: '£20 - £50'),
      PriceModel(id: 3, name: '£20 - £50'),
      PriceModel(id: 4, name: '£20 - £50'),
      PriceModel(id: 5, name: '£50 & above')
    ]);
  }

  fetchAllSubCategories(id) async {
    try {
      isLoading.value = true;
      var listOfSub = await Networkcall().fetchAllSubCategories(id);
      listOfSubCatagory.assignAll(listOfSub);
      // print('dg4');
      print(listOfSubCatagory.length);
    } catch (e) {
      isLoading.value = false;
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }

  fetchAllcategorywiseTeacherList(
      [cat = '',
      lan = '',
      rating = '',
      priceRange = '',
      priceSort = 'asc',
      ratingSort = 'asc']) async {
    print(cat);
    print(lan);

    var url = Uri.parse(
        '$BASE_URL$categoryWiseTeachers?cat=$cat&lan=$lan&rating=$rating&priceRange=$priceRange&priceSort=$priceSort&ratingSort=$ratingSort');

    print(url);
    try {
      isLoading.value = true;
      var listofteachers =
          await networkcallService.fetchCategoryWiseTeacherList(url);
      print(listofteachers);
      print('dig');
      categorywiseTeacherList.assignAll(listofteachers);
    } catch (e) {
      isLoading.value = false;
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }

  applyFilter(id) {
    var filter_listOfLang = List();
    var filter_listOfRating = List();
    var filter_listOfPrice = List();
    var filter_listOfSubCategory = List();

    listOfLang.map((element) {
      if (element.isSelected) {
        filter_listOfLang.add(element.id);
      }
    }).toList();

    listOfRating.map((element) {
      if (element.isSelected) {
        filter_listOfRating.add(element.id);
      }
    }).toList();

    listOfPrice.map((element) {
      if (element.isSelected) {
        filter_listOfPrice.add(element.id);
      }
    }).toList();

    listOfSubCatagory.map((element) {
      if (element.isSelected) {
        filter_listOfSubCategory.add(element.id);
      }
    }).toList();
    // print(filter_listOfLang);

    fetchAllcategorywiseTeacherList(
      id,
      filter_listOfLang.join(","),
      filter_listOfRating.join(","),
      filter_listOfPrice.join(","),
      filter_listOfSubCategory.join(","),
      priceSort,
      // ratingSort
    );

    // print('dgiii');
    print(filter_listOfLang.join(","));
    print(filter_listOfRating.join(","));
    print(filter_listOfPrice.join(","));
    print(filter_listOfSubCategory);
    // print('dgiii');

    Get.back();
  }

  void clearFilter() {
    for (var i = 0; i < listOfLang.length; i++) {
      listOfLang[i].isSelected = false;
      listOfLang.refresh();
    }
    for (var i = 0; i < listOfRating.length; i++) {
      listOfRating[i].isSelected = false;
      listOfRating.refresh();
    }
    for (var i = 0; i < listOfPrice.length; i++) {
      listOfPrice[i].isSelected = false;
      listOfPrice.refresh();
    }
    for (var i = 0; i < listOfSubCatagory.length; i++) {
      listOfSubCatagory[i].isSelected = false;
      listOfSubCatagory.refresh();
    }
  }
}
