import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/Widget/circularLodar.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/view/DashBoardPage/Dashboard.dart';
import 'package:edustudio/view/DashBoardPage/paypal/paypal_implement.dart';
import 'package:edustudio/view/SigninSignUp/forgotPasswordScreen.dart';
import 'package:edustudio/view/SigninSignUp/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/svg.dart';
import 'package:edustudio/util/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isLoading = false;

  bool isLoggedIn = false;
  var profileData;

  var facebookLogin = FacebookLogin();

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    // print(_width);
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            child: RotatedBox(
              quarterTurns: 18,
              child: Image.asset(
                logInShapePng,
                width: _width,
                // height: 20,
              ),
            ),
          ),
          Container(
            // width: 1.sw,
            height: 1.sh,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(_height * 0.01),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0.04.sh),
                      child: SvgPicture.asset(
                        logInPageEdutationLogo,
                        height: _width * 0.2,
                        width: _width * 0.2,
                      ),
                    ),
                    Text(
                      'Login To',
                      style: customizeTextStyle(
                          FontWeight.w700, 0.07.sw, primaryColor2),
                    ),
                    SigninSignUpWidget().getHeightSizedBox(_height * 0.02),
                    Text(
                      'Educational App',
                      style: customizeTextStyle(
                          FontWeight.w700, 0.09.sw, primaryColor2),
                    ),
                    _getLogInForm(_height),
                    SigninSignUpWidget().getHeightSizedBox(_height * 0.01),
                    InkWell(
                      onTap: () {
                        print('Forget Password');
                        Get.to(forgotPasswordScreen());
                      },
                      child: Text(
                        'Forget Password?',
                        style: customizeTextStyle(
                            FontWeight.w700, 0.04.sw, primaryColor2),
                      ),
                    ),
                    SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//>>>>>>>>>>>>>>>>>>>>> Sign In Button <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                    !isLoading
                        ? GestureDetector(
                            onTap: () {
                              print('dg2');
                              _userSignin(
                                user_email: _emailController.text,
                                password: _passwordController.text,
                              );
                            },
                            child: SigninSignUpWidget().getLoginSignupButton(
                                width: _width, text: 'LOG IN'),
                          )
                        : CircularLoader(),
                    SigninSignUpWidget().getHeightSizedBox(_height * 0.02),
                    GestureDetector(
                      onTap: () {
                        // print('dg2');
                        Get.to(DashBoradPage());
                      },
                      child: Text('Skip >>',
                          style: customizeTextStyle(
                              FontWeight.w500, 0.05.sw, white)),
                      //SigninSignUpWidget()
                      //    .getLoginSignupButton(width: _width, text: 'SKIP >>'),
                    ),
                    SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                    SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: _width * 0.4,
                          height: 5,
                          child: ColoredBox(
                            color: Colors.white,
                          ),
                        ),
                        SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                        Text(
                          'OR',
                          style: customizeTextStyle(
                              FontWeight.w500, 0.05.sw, primaryColor2),
                        ),
                        SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                        SizedBox(
                          width: _width * 0.4,
                          height: 5,
                          child: ColoredBox(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            initiateFacebookLogin();
                          },
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            size: 30,
                            color: primaryColor2,
                          ),
                        ),
                        SizedBox(
                          width: _width * 0.1,
                        ),
                        FaIcon(
                          FontAwesomeIcons.google,
                          size: 30,
                          color: primaryColor2,
                        ),
                      ],
                    ),
                    SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ? ',
                          style: customizeTextStyle(
                              FontWeight.w400, 0.05.sw, primaryColor2),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: customizeTextStyle(
                                FontWeight.w700, 0.06.sw, primaryColor2),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //facebook------------------------------------------------------------------
  void initiateFacebookLogin() async {
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);
    print('facebookLoginResult ' + facebookLoginResult.toString());

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print('token : ${facebookLoginResult.accessToken.token}');
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult.accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print('profile' + profile.toString());

        onLoginStatusChanged(true, profileData: profile);
        Get.to(DashBoradPage());
        break;
    }
  }

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }
  //facebook-------------------------------------------------------------------

  //google-------------------------------------------------------------------
  void googleLogin() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',

          // you can add extras if you require
        ],
      );
      _googleSignIn.signIn().then((GoogleSignInAccount acc) async {
        // GoogleSignInAuthentication auth = await acc.authentication;

        await _googleSignIn.signIn();

        print(acc.id);
        print(acc.email);
        print(acc.displayName);
        print(acc.photoUrl);
        acc.authentication.then((GoogleSignInAuthentication auth) async {
          print(auth.idToken);
          print(auth.accessToken);
        });
      });
    } catch (e) {
      print(e);
    }
  }
  //google-------------------------------------------------------------------

  Widget _getLogInForm(_height) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(0.03.sw),
              child: SigninSignUpWidget().customTextField(
                  height: _height,
                  icon: Icons.account_circle_outlined,
                  hintText: 'email',
                  controller: _emailController,
                  color: white,
                  borderColor: white,
                  validationFunction: (value) {
                    if (value.isEmpty) {
                      return "Enter Valid Full Name ";
                    } else if (value.trim().isEmpty) {
                      return "Enter Valid Full Name ";
                    }
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(0.03.sw),
              child: SigninSignUpWidget().customTextField(
                  height: _height,
                  icon: Icons.vpn_key_outlined,
                  hintText: 'Password',
                  controller: _passwordController,
                  color: white,
                  borderColor: white,
                  validationFunction: (value) {
                    if (value.isEmpty) {
                      return "Enter Valid Full Name ";
                    } else if (value.trim().isEmpty) {
                      return "Enter Valid Full Name ";
                    }
                  }),
            ),
          ],
        ));
  }

  Future<void> _userSignin({user_email, password}) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        isLoading = true;
      });
      try {
        bool result = await networkcallService.signInApiCall(
            password: password, email: user_email);
        setState(() {
          isLoading = false;
        });

        if (result) {
          //   Navigator.popUntil(context, (route) => false);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DashBoradPage()),
              (Route<dynamic> route) => false);
        }
        //print(result);
        //showToast("successfully Login", Colors.green);
      } catch (e) {
        isLoading = false;
        setState(() {});
        if (e.isNetworkError != null && e.isNetworkError) {
          print(e.customMessage);
          showToast(e.customMessage, red);
        } else {
          showToast(e.customMessage, red);
        }
      }
    }
  }
}
