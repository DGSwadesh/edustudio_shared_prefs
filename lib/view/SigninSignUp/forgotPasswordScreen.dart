import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/view/DashBoardPage/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:edustudio/util/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edustudio/util/constant.dart';

class forgotPasswordScreen extends StatefulWidget {
  @override
  _forgotPasswordScreenState createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: _width,
            padding: EdgeInsets.all(0.01.sw),
            child: Column(
              children: [
                SvgPicture.asset(
                  forgot,
                  // semanticsLabel: 'Acme Logo',
                  height: _width * 0.15,
                  width: _width * 0.15,
                ),
                SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: customizeTextStyle(
                      FontWeight.w700, 0.09.sw, primaryColor2),
                ),
                SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                Padding(
                  padding: EdgeInsets.all(0.04.sw),
                  child: Text(
                    'Enter your mobile and phone number to get otp',
                    textAlign: TextAlign.center,
                    style: customizeTextStyle(
                        FontWeight.w500, 0.06.sw, primaryColor2),
                  ),
                ),
                SigninSignUpWidget().getHeightSizedBox(0.01.sh),
                Padding(
                  padding: EdgeInsets.all(0.01.sw),
                  child: SigninSignUpWidget().customTextField(
                    height: _height,
                    icon: Icons.email_outlined,
                    hintText: 'Enter your email',
                    color: white,
                    borderColor: white,
                    controller: _emailController,
                  ),
                ),
                SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                GestureDetector(
                  onTap: () {
                    _resetPasswordNew(password: _emailController.text.trim());
                  },
                  child: SigninSignUpWidget()
                      .getLoginSignupButton(width: _width, text: 'Get Opt'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 1.0,
            child: RotatedBox(
              quarterTurns: 18,
              child: Image.asset(
                logInShapePng,
                width: 1.sw,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _resetPasswordNew({password}) async {
    setState(() {
      isLoading = true;
    });
    try {
      bool result =
          await networkcallService.ResetPasswordNew(password: password);
      setState(() {
        isLoading = false;
      });

      if (result) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashBoradPage()),
        );
      }
      //print(result);
      //showToast("successfully Login", Colors.green);
    } catch (e) {
      isLoading = false;
      setState(() {});
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }
}
