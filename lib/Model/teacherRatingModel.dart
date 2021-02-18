class TeacherRatingModel {
  String status;
  Data data;
  String message;

  TeacherRatingModel({this.status, this.data, this.message});

  TeacherRatingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  double excellent;
  double good;
  double average;
  double poor;
  double terrible;
  double totalCountRating;

  Data(
      {this.excellent,
      this.good,
      this.average,
      this.poor,
      this.terrible,
      this.totalCountRating});

  Data.fromJson(Map<String, dynamic> json) {
    excellent = json['Excellent'] is double ? json['Excellent'] : double.parse(json['Excellent'].toString());
    good = json['Good'] is double ? json['Good'] : double.parse(json['Good'].toString());
    average = json['Average'] is double ? json['Average'] : double.parse(json['Average'].toString());
    poor = json['Poor'] is double ? json['Poor'] : double.parse(json['Poor'].toString());
    terrible = json['Terrible'] is double ? json['Terrible'] : double.parse(json['Terrible'].toString());
    totalCountRating = json['totalCountRating'] is double ? json['totalCountRating'] : double.parse(json['totalCountRating'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Excellent'] = this.excellent;
    data['Good'] = this.good;
    data['Average'] = this.average;
    data['Poor'] = this.poor;
    data['Terrible'] = this.terrible;
    data['totalCountRating'] = this.totalCountRating;
    return data;
  }
}
