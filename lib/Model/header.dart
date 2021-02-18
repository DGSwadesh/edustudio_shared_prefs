class HeaderModel {
  String authorization;
  String contentType;
  
  String accept = "application/json";

  HeaderModel([this.authorization, this.contentType]);

  Map<String, String> toMap() {
    return {
      'Authorization': authorization,
      'Content-Type': contentType,
      'Accept': accept
    };
  }
}

class HeaderModelJSON {
 // String device_type;
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
