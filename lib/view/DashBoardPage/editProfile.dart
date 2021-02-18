import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edustudio/Widget/DashBoardWidget.dart';
import 'package:edustudio/Widget/DrawerCustomPaint.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/util/constant.dart';
import 'package:edustudio/util/error_handler.dart';
import 'package:edustudio/util/sharePreference_instance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController, _emailController, _phoneController;

  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: SharePreferenceInstance().getUserName());
    _emailController =
        TextEditingController(text: SharePreferenceInstance().getEmail());
    _phoneController =
        TextEditingController(text: SharePreferenceInstance().getPhoneNo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: customizeTextStyle(FontWeight.w600, 0.06.sw, white),
          )),
      body: Stack(
        children: [
          DrawerCustomPaint(),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SigninSignUpWidget().getHeightSizedBox(0.15.sh),
                  GestureDetector(
                    onTap: () async {
                      await imagePicker();
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 0.12.sw,
                          child: CircleAvatar(
                            radius: 0.11.sw,
                            backgroundImage:
                                SharePreferenceInstance().getProfilePath() !=
                                        null
                                    ? NetworkImage((SharePreferenceInstance()
                                        .getProfilePath()))
                                    : AssetImage(user),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: white,
                            child: Icon(
                              Icons.camera_alt,
                              size: 0.04.sw,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  _getSignUpForm(1.sh),
                  SigninSignUpWidget().getHeightSizedBox(0.03.sh),
                  GestureDetector(
                    onTap: () async {
                      updateProfile();
                      /* var message = await Networkcall().saveUserDetails(
                          user_email: _emailController.text,
                          user_name: _nameController.text,
                          user_phone: _phoneController.text,
                          image_url: _image.path);
                      print(message);
                      showToast(message, red);
                      setState(() {});*/
                    },
                    child: SigninSignUpWidget().getLoginSignupButton(
                        width: 1.sw, text: 'UPDATE PROFILE'),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(0.1.sh),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  updateProfile() async {
    var uri = Uri.parse(BASE_URL + updateProfileUrl);
    // print(uri.toString());

    var request = http.MultipartRequest('POST', uri);
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] =
        'Bearer ${SharePreferenceInstance().getToken()}';

    request.files.add(
      http.MultipartFile(
        'photo',
        http.ByteStream(DelegatingStream.typed(_image.openRead())),
        await _image.length(),
        filename: basename(_image.path),
      ),
    );

    request.fields['email'] = _emailController.text;
    request.fields['name'] = _nameController.text;
    request.fields['mobile'] = _phoneController.text;

    try {
      var response = await networkcallService.saveUserDetails(request);
      if (response['status'] == 'success') {
        Get.back();
      }
      // print(response);
    } catch (e) {
      e is CustomError
          ? throw CustomError(e.errorMessage())
          : throw CustomError(INTERNET_ERROR);
    }
  }

  Widget _getSignUpForm(_height) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SigninSignUpWidget().customTextField(
                  height: _height,
                  icon: Icons.account_circle_outlined,
                  hintText: 'Name',
                  controller: _nameController,
                  color: grayColor,
                  borderColor: backgroundColor,
                  validationFunction: (value) {
                    if (value.isEmpty) {
                      return "Enter Valid Full Name ";
                    } else if (value.trim().isEmpty) {
                      return "Enter Valid Full Name ";
                    }
                  }),
            ),
            SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SigninSignUpWidget().customTextField(
                  height: _height,
                  icon: Icons.vpn_key_outlined,
                  hintText: 'Email Id',
                  controller: _emailController,
                  color: grayColor,
                  borderColor: backgroundColor,
                  validationFunction: (value) {
                    if (value.isEmpty) {
                      return "Enter Valid Full Name ";
                    } else if (value.trim().isEmpty) {
                      return "Enter Valid Full Name ";
                    }
                  }),
            ),
            SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SigninSignUpWidget().customTextField(
                  height: _height,
                  icon: Icons.vpn_key_outlined,
                  hintText: 'Phone Number',
                  controller: _phoneController,
                  color: black,
                  borderColor: backgroundColor,
                  validationFunction: (value) {
                    // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    // RegExp regExp = new RegExp(patttern);
                    if (value.isEmpty || value.trim().isEmpty) {
                      return "Enter Valid Full Name ";
                    }
                  }),
            ),
          ],
        ));
  }

  Future imagePicker() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {});
      } else {
        print('No image selected.');
      }
    });
  }

  // Future<void> _updateProfile(
  //   user_email,
  //   password,
  //   phone_number,
  //   image_url
  // ) async {

  // }
}
