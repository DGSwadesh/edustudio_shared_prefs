class TeacherReviewsModel {
  String status;
  List<Data> data;
  Null message;

  TeacherReviewsModel({this.status, this.data, this.message});

  TeacherReviewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String studentName;
  StudentPhoto studentPhoto;
  String rating;
  String heading;
  String description;

  Data(
      {this.studentName,
      this.studentPhoto,
      this.rating,
      this.heading,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    studentName = json['studentName'];
    studentPhoto = json['studentPhoto'] != null
        ? new StudentPhoto.fromJson(json['studentPhoto'])
        : null;
    rating = json['rating'];
    heading = json['heading'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentName'] = this.studentName;
    if (this.studentPhoto != null) {
      data['studentPhoto'] = this.studentPhoto.toJson();
    }
    data['rating'] = this.rating;
    data['heading'] = this.heading;
    data['description'] = this.description;
    return data;
  }
}

class StudentPhoto {
  String name;
  String path;

  StudentPhoto({this.name, this.path});

  StudentPhoto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['path'] = this.path;
    return data;
  }
}
