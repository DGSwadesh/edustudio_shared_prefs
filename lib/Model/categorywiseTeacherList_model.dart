// class categorywiseTeacherListModel {
//   String status;
//   List<Data> data;
//   Null message;

//   categorywiseTeacherListModel({this.status, this.data, this.message});

//   categorywiseTeacherListModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = new List<Data>();
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['status'] = this.status;
//   //   if (this.data != null) {
//   //     data['data'] = this.data.map((v) => v.toJson()).toList();
//   //   }
//   //   data['message'] = this.message;
//   //   return data;
//   // }
// }

class categorywiseTeacherListModel {
  String name;
  Photo photo;
  double rating;
  String demoClass;
  String perClassPrice;
  String upcomingClass;

  categorywiseTeacherListModel(
      {this.name,
      this.photo,
      this.rating,
      this.demoClass,
      this.perClassPrice,
      this.upcomingClass});

  categorywiseTeacherListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    rating = double.parse(json['rating']);
    demoClass = json['demoClass'] as String;
    perClassPrice = json['per_class_price'].toString();
    upcomingClass = json['upcomingClass'] as String;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   if (this.photo != null) {
  //     data['photo'] = this.photo.toJson();
  //   }
  //   data['rating'] = this.rating;
  //   data['demoClass'] = this.demoClass;
  //   data['per_class_price'] = this.perClassPrice;
  //   data['upcomingClass'] = this.upcomingClass;
  //   return data;
  // }
}

class Photo {
  String name;
  String path;

  Photo({this.name, this.path});

  Photo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['path'] = this.path;
  //   return data;
  // }
}
