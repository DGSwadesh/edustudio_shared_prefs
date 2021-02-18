import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/view/SigninSignUp/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: _width,
        height: _height,
        child: SingleChildScrollView(
          child: Container(
            width: _width,
            height: _height,
            child: Stack(
              children: [
                Container(
                  width: _width,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.09.sh, bottom: 0.01.sh),
                        child: SvgPicture.asset(
                          logInPageEdutationLogo,
                          semanticsLabel: 'Acme Logo',
                          height: _width * 0.2,
                          width: _width * 0.2,
                        ),
                      ),
                      Text(
                        'Welcome To',
                        style: customizeTextStyle(
                            FontWeight.w700, 0.07.sw, primaryColor2),
                      ),
                      _getHeightSizedBox(_height * 0.02),
                      Text(
                        'Educational App',
                        style: customizeTextStyle(
                            FontWeight.w700, 0.09.sw, primaryColor2),
                      ),
                      _getHeightSizedBox(_height * 0.03),
                      Text(
                        'Knowledge for everyone',
                        style: customizeTextStyle(
                            FontWeight.w400, 18.0, primaryColor2),
                      ),
                      _getHeightSizedBox(_height * 0.1),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0.0, child: _bottomPart(_width, _height, context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeightSizedBox(height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _getWidthSizedBox(width) {
    return SizedBox(
      width: width,
    );
  }

  Widget _bottomPart(_width, _height, context) {
    return Container(
      width: _width,
      height: _height * 0.5,
      child: Stack(
        children: [
          Positioned(
            top: 1,
            child: Container(
              height: _width * 0.1,
              width: 1.sw,
              child: RotatedBox(
                quarterTurns: 18,
                child: Image.asset(logInShapePng),
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            child: Container(
              height: _height * 0.45,
              width: _width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: SigninSignUpWidget().getLoginSignupButton(
                          width: _width, text: 'GET STARTED'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
