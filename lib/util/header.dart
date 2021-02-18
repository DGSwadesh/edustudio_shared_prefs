class HeaderModel {
  String authorization;
  String Accept="application/json";
  String contentType;

HeaderModel([this.authorization,this.contentType]);



  Map<String, String> toMap() {
    return {
      'Authorization': authorization,
      'Content-Type': contentType,
      'Accept':Accept
    };
  }
}



class HeaderModelJSON {
  String device_type;
  String authorization;
  String contentType;

  HeaderModelJSON([this.authorization, this.contentType]);



  Map<String, String> toMap() {
    return {
      'Authorization': authorization,
    
      'Accept': "application/json",
    };
  }
}