class TeachersProfileModel {
  String status;
  Data data;
  Null message;

  TeachersProfileModel({this.status, this.data, this.message});

  TeachersProfileModel.fromJson(Map<String, dynamic> json) {
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
  Profile profile;
  List<Courses> courses;

  Data({this.profile, this.courses});

  Data.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['courses'] != null) {
      courses = new List<Courses>();
      json['courses'].forEach((v) {
        courses.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.courses != null) {
      data['courses'] = this.courses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  int profileId;
  String userId;
  String name;
  Photo photo;
  String rating;

  Profile({this.profileId, this.userId, this.name, this.photo, this.rating});

  Profile.fromJson(Map<String, dynamic> json) {
    profileId = json['profile_id'];
    userId = json['user_id'];
    name = json['name'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_id'] = this.profileId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    if (this.photo != null) {
      data['photo'] = this.photo.toJson();
    }
    data['rating'] = this.rating;
    return data;
  }
}

class Photo {
  String name;
  String path;

  Photo({this.name, this.path});

  Photo.fromJson(Map<String, dynamic> json) {
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

class Courses {
  int id;
  String categoryName;
  String subCategoryName;
  String title;
  String description;
  String highlights;
  int perClassPrice;
  String allowDemoClass;
  String categoryNames;
  String categoryIds;
  List<UpcomingClasses> upcomingClasses;

  //>>>>>>>>>>>>>>>> not in model class <<<<<<<<<<<<<<<<<<<<
  bool isSelected = false;

  Courses(
      {this.id,
      this.categoryName,
      this.subCategoryName,
      this.title,
      this.description,
      this.highlights,
      this.perClassPrice,
      this.allowDemoClass,
      this.categoryNames,
      this.categoryIds,
      this.upcomingClasses});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    subCategoryName = json['sub_category_name'];
    title = json['title'];
    description = json['description'];
    highlights = json['highlights'];
    perClassPrice = json['per_class_price'];
    allowDemoClass = json['allow_demo_class'];
    categoryNames = json['category_names'];
    categoryIds = json['category_ids'];
    if (json['upcoming_classes'] != null) {
      upcomingClasses = new List<UpcomingClasses>();
      json['upcoming_classes'].forEach((v) {
        upcomingClasses.add(new UpcomingClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['sub_category_name'] = this.subCategoryName;
    data['title'] = this.title;
    data['description'] = this.description;
    data['highlights'] = this.highlights;
    data['per_class_price'] = this.perClassPrice;
    data['allow_demo_class'] = this.allowDemoClass;
    data['category_names'] = this.categoryNames;
    data['category_ids'] = this.categoryIds;
    if (this.upcomingClasses != null) {
      data['upcoming_classes'] =
          this.upcomingClasses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpcomingClasses {
  int id;
  String courseName;
  String batchName;
  String scheduleDate;
  String fromTime;
  String toTime;
  int studentEnroll;
  String languages;

  UpcomingClasses(
      {this.id,
      this.courseName,
      this.batchName,
      this.scheduleDate,
      this.fromTime,
      this.toTime,
      this.studentEnroll,
      this.languages});

  UpcomingClasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    batchName = json['batch_name'];
    scheduleDate = json['schedule_date'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    studentEnroll = json['student_enroll'];
    languages = json['languages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.courseName;
    data['batch_name'] = this.batchName;
    data['schedule_date'] = this.scheduleDate;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['student_enroll'] = this.studentEnroll;
    data['languages'] = this.languages;
    return data;
  }
}
