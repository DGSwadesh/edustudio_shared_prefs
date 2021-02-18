////country ------------------------------------
class CountryModel {
  String status;
  List<DataOfCountryModel> data;
  String message;

  CountryModel({this.status, this.data, this.message});

  CountryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<DataOfCountryModel>();
      json['data'].forEach((v) {
        data.add(new DataOfCountryModel.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class DataOfCountryModel {
  int id;
  String name;
  int countryCode;

  DataOfCountryModel({this.id, this.name, this.countryCode});

  DataOfCountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
  }

}

///State---------------------------------------------------------------------
class StateModel {
  String status;
  List<DataOfStateModel> data;
  String message;

  StateModel({this.status, this.data, this.message});

  StateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<DataOfStateModel>();
      json['data'].forEach((v) {
        data.add(new DataOfStateModel.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class DataOfStateModel {
  int id;
  String name;

  DataOfStateModel({this.id, this.name});

  DataOfStateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}


////city------------------------------------------------------------------------
class CityModel {
  String status;
  List<DataOfCityModel> data;
  String message;

  CityModel({this.status, this.data, this.message});

  CityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<DataOfCityModel>();
      json['data'].forEach((v) {
        data.add(new DataOfCityModel.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class DataOfCityModel {
  int id;
  String name;

  DataOfCityModel({this.id, this.name});

  DataOfCityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}