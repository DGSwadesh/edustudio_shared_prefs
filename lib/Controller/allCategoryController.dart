// import 'package:edustudio/Model/allSubjectCatagoryModel.dart';
// import 'package:edustudio/util/constant.dart';
// import 'package:get/get.dart';
// import 'package:edustudio/services/Networkcall.dart';

// class DashbordController extends GetxController {
//   var isLoading = true.obs;
//   var listOfSubj = List<AllSubjectCatagoryModel>().obs;

//    fetchAllSubjectCatagory() async {
//     try {
//       isLoading.value = true;
//       var listOfSub = await Networkcall().fetchAllSubjectCatagory();
//       listOfSubj.assignAll(listOfSub);
//     } catch (e) {
//       isLoading.value = false;
//       if (e.isNetworkError != null && e.isNetworkError) {
//         showToast(e.customMessage, red);
//       } else {
//         showToast(e.customMessage, red);
//       }
//     }
//   }
// }

