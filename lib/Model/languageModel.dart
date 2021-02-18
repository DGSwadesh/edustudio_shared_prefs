class LanguageModel {
  int id;
  String langName;
  bool isSelected = false;

  LanguageModel({
    this.id,
    this.langName,
  });

  LanguageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    langName = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.langName;
    return data;
  }
}
