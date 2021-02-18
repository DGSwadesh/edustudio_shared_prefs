import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceInstance {
  //keys
  final User_Name = 'user_name';
  final USER_email = 'user_email';
  final USER_PHONE = 'user_phone';
  final PROFILE_PHOTO_NAME = 'profile_photo_name';
  final PROFILE_PHOTO_PATH = 'profile_photo_path';
  final USER_TOKEN = 'user_token';

  final ISLOGIN = 'isLogin';

  final countryId = 'id';
  final stateId = 'id';

  ///parentData---------------------
  final parentToken = 'api_token';
  final parentName = 'name';
  final parentEmail = 'email';
  final parentMobile = 'mobile';
  final parentDOB = 'dob';
  final parentEducation = 'education';
  final parentAltMobile = 'alt_mobile';
  final parentAddressLine1 = 'address_line1';
  final parentAddressLine2 = 'address_line2';
  final parentCountry = 'country';
  final parentState = 'state';
  final parentCity = 'city';
  final parentZIP = 'zip';
  final parentProfilePhotoName = 'name';
  final parentProfilePhotoPath = 'path';
  final parentId = 'id';

  // final FIRSTNAME_KEY = "first_name";
  // final LASTNAME_KEY = "last_name";
  // final EMAIL_VERIFICATION_KEY = "user_email_verification";
  // final PASSWORD_KEY = "password";
  // final USER_ID_KEY = 'user_id';
  // final OTP_KEY = 'otp';
  // final USER_TOKEN = 'user_token';

  //
  static SharedPreferences prefs;

  static final SharePreferenceInstance networkcall =
      new SharePreferenceInstance._internal();

  SharePreferenceInstance._internal();

  factory SharePreferenceInstance() {
    return networkcall;
  }

  //shared pref initialize
  init() async {
    SharedPreferences.getInstance()
        .then((value) => prefs = value)
        .catchError((e) {
      print("Got error: ${e.error}"); // Finally, callback fires.
      // Future completes with 42.
    });
  }

  // //firstname
  // void setFirstName(firstname) => prefs.setString(FIRSTNAME_KEY, firstname);

  // String getFirstName() => prefs.getString(FIRSTNAME_KEY);

  // //lastname
  // void setLastName(lastname) => prefs.setString(LASTNAME_KEY, lastname);

  // String getLastName() => prefs.getString(LASTNAME_KEY);

  // //email
  // void setVerificationEmail(user_email) =>
  //     prefs.setString(EMAIL_VERIFICATION_KEY, user_email);

  // String getVerificationEmail() => prefs.getString(EMAIL_VERIFICATION_KEY);

  // //password
  // void setPassword(password) => prefs.setString(PASSWORD_KEY, password);

  // String getPassword() => prefs.getString(PASSWORD_KEY);

  // //user_id
  // void setUserId(user_id) => prefs.setString(USER_ID_KEY, user_id);

  // String getUserId() => prefs.getString(USER_ID_KEY);

  // //otp
  // void setOtp(otp) => prefs.setString(OTP_KEY, otp);

  // String getOtp() => prefs.getString(OTP_KEY);

  //UserName
  void setUserName(value) => prefs.setString(User_Name, value);

  String getUserName() => prefs.getString(User_Name);

  //email
  void setEmail(value) => prefs.setString(USER_email, value);

  String getEmail() => prefs.getString(USER_email);

  //PhoneNo
  void setPhoneNo(value) => prefs.setString(USER_PHONE, value);

  String getPhoneNo() => prefs.getString(USER_PHONE);

  //profileName
  void setprofileName(value) => prefs.setString(PROFILE_PHOTO_NAME, value);

  String getProfileName() => prefs.getString(PROFILE_PHOTO_NAME);

  //profilePhoto
  void setprofilePath(value) => prefs.setString(PROFILE_PHOTO_PATH, value);

  String getProfilePath() => prefs.getString(PROFILE_PHOTO_PATH);

  //isLogin
  void setIsLogin(value) => prefs.setBool(ISLOGIN, value);

  bool isLogin() => prefs.getBool(ISLOGIN);

  //token
  void setToken(token) => prefs.setString(USER_TOKEN, token);

  String getToken() => prefs.getString(USER_TOKEN);

  ////parentData------------------------------------------------------------------

  //Parent Name
  void setParentName(value) => prefs.setString(parentName, value);

  String getParentName() => prefs.getString(parentName);

  //email
  void setParentEmail(value) => prefs.setString(parentEmail, value);

  String getparentEmail() => prefs.getString(parentEmail);

  //mobile
  void setParentMobile(value) => prefs.setString(parentMobile, value);

  String getParentMobile() => prefs.getString(parentMobile);

  //DOb
  void setParentDOB(value) => prefs.setString(parentDOB, value);

  String getParentDOB() => prefs.getString(parentDOB);

  //Education
  void setParentEducation(value) => prefs.setString(parentEducation, value);

  String getParentEducation() => prefs.getString(parentEducation);

  //AltMobile
  void setParentAltMobile(value) => prefs.setString(parentAltMobile, value);

  String getParentAltMobile() => prefs.getString(parentAltMobile);

  //parentAddressLine1
  void setParentAddLine1(value) => prefs.setString(parentAddressLine1, value);

  String getParentAddLine1() => prefs.getString(parentAddressLine1);

  //parentAddressLine2
  void setparrentAddLine2(value) => prefs.setString(parentAddressLine2, value);

  String getParentAddLine2() => prefs.getString(parentAddressLine2);

  //parentCountry
  void setParentCountry(value) => prefs.setString(parentCountry, value);

  String getParentCountry() => prefs.getString(parentCountry);

  //parentState
  void setParentState(value) => prefs.setString(parentState, value);

  String getparentState() => prefs.getString(parentState);

  //zip
  void setparentZip(value) => prefs.setString(parentZIP, value);

  String getParentZip() => prefs.getString(parentZIP);

  //city
  void setParentCity(value) => prefs.setString(parentCity, value);

  String getParentCity() => prefs.getString(parentCity);

  //parentProfilePhotoName
  void setParentProfilePhotoName(value) =>
      prefs.setString(parentProfilePhotoName, value);

  String getParentProfilePhotoName() => prefs.getString(parentProfilePhotoName);

  //parentProfilePhotoPath
  void setParentProfilePhotoPath(value) =>
      prefs.setString(parentProfilePhotoPath, value);

  String getParentProfilePhotoPath() => prefs.getString(parentProfilePhotoPath);

  //parentId
  void setParentId(value) => prefs.setString(parentId, value);

  String getParentId() => prefs.getString(parentId);

  //TOKEN PARENT
  void setParentToken(value) => prefs.setString(parentToken, value);

  String getParentToken() => prefs.getString(parentToken);

  ///country id\
  void setCountryId(value) => prefs.setString(countryId, value);

  String getCountryId() => prefs.getString(countryId);

  ///state id

  void setStateId(value) => prefs.setString(stateId, value);

  String getStateId() => prefs.getString(stateId);

  void clear() {
    prefs.clear();
  }

  // void saveUserDetail(Map<String, dynamic> userData) {
  //   print('userdata: $userData');
  //   setUserName(userData['data']['name']);
  //   setEmail(userData['data']['email']);
  //   setPhoneNo(userData['data']['mobile']);
  //   setprofileName(userData['data']['profile_photo']['name']);
  //   setprofilePath(userData['data']['profile_photo']['path']);

  //   print('imagepath ${sharePrefereceInstance.getProfilePath()}');
  //   setToken(userData['data']['api_token']);

  //   setIsLogin(true);

  //   //setUserId(userData['user_id']);
  //   // setFirstName(userData['first_name']);
  //   // setLastName(userData['last_name']);
  //   // setToken(userData['access_token']);
  // }

  /////parentData=-=================

  void saveParentsData(Map<String, dynamic> parentData) {
    print('parentsData: $parentData');
    setParentName(parentData['data']['name']);
    setParentEmail(parentData['data']['email']);
    setParentMobile(parentData['data']['mobile']);

    setParentToken(parentData['data']['api_token']);
    setIsLogin(true);
  }

  void saveParentProfile(Map<String, dynamic> parentProfile) {
    print('saveParentProfile: $parentProfile');
    setParentProfilePhotoName(parentProfile['data']['profile_photo']['name']);
    setParentProfilePhotoPath(parentProfile['data']['profile_photo']['path']);
  }

  void saveParent2Data(Map<String, dynamic> parent2Data) {
    print('parentsData: $parent2Data');
    setParentDOB(parent2Data['data']['dob']);
    setParentEducation(parent2Data['data']['education']);
    setParentAltMobile(parent2Data['data']['alt_mobile']);
    setParentAddLine1(parent2Data['data']['address_line1']);
    setparrentAddLine2(parent2Data['data']['address_line2']);
    setParentCountry(parent2Data['data']['country']);
    setParentState(parent2Data['data']['state']);
    setparentZip(parent2Data['data']['zip']);
    setParentCity(parent2Data['data']['city']);

    // setParentProfilePhotoName(parent2Data['data']['profile_photo']['name']);
    // setParentProfilePhotoPath(parent2Data['data']['profile_photo']['path']);
  }

  // void saveCountryStateCityList(Map<String, dynamic> saveListData) {
  //   print('saveCountryStateCityList: $saveListData');

  //   setCountryId(saveListData['data']['id']);
  //   setStateId(saveListData['data']['id']);
  // }
}

SharePreferenceInstance sharePrefereceInstance = SharePreferenceInstance();
