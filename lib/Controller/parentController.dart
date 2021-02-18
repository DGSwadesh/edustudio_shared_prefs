import 'package:edustudio/Model/countryListModel.dart';
import 'package:edustudio/util/constant.dart';
import 'package:get/get.dart';
import 'package:edustudio/services/Networkcall.dart';

class ParentController extends GetxController {
  var isLoading = true.obs;
  //country
  var countryModel = CountryModel().obs;
  var listOfCountry = List<DataOfCountryModel>().obs;
  var selectedCountry;
  // var selectedCountry = DataOfCountryModel().obs;
  //state
  var stateModel = StateModel().obs;
  var listOfState = List<DataOfStateModel>().obs;
  var selectedState;
  //city
  var cityModel = CityModel().obs;
  var listOfCity = List<DataOfCityModel>().obs;
  var selectedCity;

///////////fetchCountryList-------------------------------------------
  fetchCountryList() async {
    try {
      isLoading.value = true;
      var listOfCountryfromApi = await Networkcall().fetchCountryList();
      countryModel.value = listOfCountryfromApi;
      // listOfCountry.clear();
      listOfCountry.assignAll(countryModel.value.data);
      listOfCountry.refresh();
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

/////fetchStateList------------------------------------------------------------
  fetchStateList(countryId) async {
    try {
      isLoading.value = true;
      var listOfStatefromApi = await Networkcall().fetchStateList(countryId);
      stateModel.value = listOfStatefromApi;
      listOfState.clear();
      listOfState.assignAll(stateModel.value.data);
      listOfState.refresh();
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

////fetchCityList-------------------------------------------------------------
  fetchCityList(cityId) async {
    try {
      isLoading.value = true;
      var listOfCityfromApi = await Networkcall().fetchCityList(cityId);
      cityModel.value = listOfCityfromApi;
      listOfCity.assignAll(cityModel.value.data);
      listOfCity.refresh();
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

  setDefaultCountry(newValue) {
    selectedCountry = newValue;
  }

  setDefaultState(newValue) {
    selectedState = newValue;
  }

  setDefaultCity(newValue) {
    selectedCity = newValue;
  }
}
