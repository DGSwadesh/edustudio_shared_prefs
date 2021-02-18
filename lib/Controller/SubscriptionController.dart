import 'package:edustudio/Model/StudentSubsPlanModel.dart';
import 'package:edustudio/util/constant.dart';
import 'package:get/get.dart';
import 'package:edustudio/services/Networkcall.dart';

class SubscriptionController extends GetxController {
  var isLoading = true.obs;
  var studentSubsPlan = StudentSubsPlan().obs;
  var listOfSubscription = List<SubsDetails>().obs;

  fetchSubscriptionData() async {
    try {
      isLoading.value = true;
      var listOfSubscriptionData =
          await Networkcall().studentSubscriptionPlan();
      studentSubsPlan.value = listOfSubscriptionData;
      listOfSubscription.assignAll(studentSubsPlan.value.dataList);
      listOfSubscription.refresh();
    } catch (e) {
      print(e);
      isLoading.value = false;
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }
}
