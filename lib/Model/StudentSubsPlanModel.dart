class StudentSubsPlan {
  String status;
  List<SubsDetails> dataList;
  String message;

  StudentSubsPlan({this.status, this.dataList, this.message});

  StudentSubsPlan.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dataList = new List<SubsDetails>();
      json['data'].forEach((v) {
        dataList.add(new SubsDetails.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class SubsDetails {
  int id;
  String name;
  String price;
  int duration;
  int limitTuition;
  int limitFreeClass;
  String description;
  Null createdAt;
  Null updatedAt;
  Null deletedAt;

  SubsDetails(
      {this.id,
      this.name,
      this.price,
      this.duration,
      this.limitTuition,
      this.limitFreeClass,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  SubsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    duration = json['duration'];
    limitTuition = json['limit_tuition'];
    limitFreeClass = json['limit_free_class'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
}