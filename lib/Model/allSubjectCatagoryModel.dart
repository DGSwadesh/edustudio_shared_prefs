class AllSubjectCatagoryModel {
  int id;
  String categoryName;
  String iconImage;
  String iconPath;
  // this is for recomanded_teacher
  bool isSelected = false;

  AllSubjectCatagoryModel(
      {this.id, this.categoryName, this.iconImage, this.iconPath});

  AllSubjectCatagoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    iconImage = json['icon_image'];
    iconPath = json['icon_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['icon_image'] = this.iconImage;
    data['icon_path'] = this.iconPath;
    return data;
  }
}
