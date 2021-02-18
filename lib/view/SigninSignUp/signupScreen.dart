import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/Widget/circularLodar.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/view/DashBoardPage/Dashboard.dart';
import 'package:edustudio/view/DashBoardPage/SubscriptionScreen.dart';
import 'package:edustudio/view/SigninSignUp/loginScreen.dart';
import 'package:edustudio/view/SigninSignUp/parentProfile.dart';
import 'package:flutter/material.dart';
import 'package:edustudio/util/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edustudio/Widget/StudentRegisterForm.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  var isLoading = false;
  var isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  // final _anotherKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
//student 
  TextEditingController _stuNameController = TextEditingController();
  TextEditingController _stuPhoneController = TextEditingController();
  TextEditingController _stuEmailController = TextEditingController();
  TextEditingController _stuPasswordController = TextEditingController();
  TextEditingController _paymentIdController = TextEditingController();
  TextEditingController _paymentNoteController = TextEditingController();
  String radioGroupValue = '';

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundColor,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              gradient: LinearGradient(colors: [backgroundColor, Colors.white]),
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor),
          tabs: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                "Parent Register",
                style: TextStyle(
                    fontWeight: boldTextWeight,
                    fontSize: 0.04.sw,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                "Student Register",
                style: TextStyle(
                    fontWeight: boldTextWeight,
                    fontSize: 0.04.sw,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      resizeToAvoidBottomPadding: false,
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            width: _width,
            child: SingleChildScrollView(
              // key: UniqueKey(),
              child: Padding(
                padding: EdgeInsets.all(_height * 0.01),
                child: Column(
                  // key: UniqueKey(),
                  children: [
                    _getSignUpForm(_height),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue;
                            });
                          },
                        ),
                        Text(
                          'Agree with the terms of use and privacy policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 0.04.sw,
                            fontWeight: FontWeight.w500,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//>>>>>>>>>>>>>>>>>>>>> Sign Up Button <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                        !isLoading
                            ? GestureDetector(
                                onTap: () {
                                  print('dg2');
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    parentRegister(
                                      name: _nameController.text.trim(),
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      confirm_password:
                                          _confirmPasswordController.text,
                                      mobile: _phoneController.text.trim(),
                                    );
                                  }
                                },
                                child: SigninSignUpWidget()
                                    .getLoginSignupButton(
                                        width: _width, text: 'SIGN UP'),
                              )
                            : CircularLoader(),
                        SigninSignUpWidget().getHeightSizedBox(_height * 0.1)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ? ',
                          style: customizeTextStyle(
                              FontWeight.w400, 0.05.sw, primaryColor2),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            'Login',
                            style: customizeTextStyle(
                                FontWeight.w700, 0.06.sw, primaryColor2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          ///Student Register
          // StudentRegisterForm().studentRegisterForm(_height),
          SingleChildScrollView(
            child: Form(
              key: _formKey2,
                          child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SigninSignUpWidget().customTextField(
                        height: _height,
                        icon: Icons.account_circle_outlined,
                        hintText: 'Name',
                        controller: _stuNameController,
                        color: white,
                        borderColor: white,
                        validationFunction: (value) {
                          if (value.isEmpty) {
                            return "Enter Name ";
                          } else if (value.trim().isEmpty) {
                            return "Enter Name ";
                          }
                        }),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SigninSignUpWidget().customTextField(
                        height: _height,
                        icon: Icons.call,
                        hintText: 'Phone Number',
                        controller: _stuPhoneController,
                        color: white,
                        borderColor: white,
                        validationFunction: (value) {
                          // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          // RegExp regExp = new RegExp(patttern);
                          if (value.isEmpty || value.trim().isEmpty) {
                            return "Enter Valid Phone Number ";
                          }
                        }),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SigninSignUpWidget().customTextField(
                        height: _height,
                        icon: Icons.contact_mail,
                        hintText: 'Email Id',
                        controller: _stuEmailController,
                        color: white,
                        borderColor: white,
                        validationFunction: (value) {
                          if (value.isEmpty) {
                            return "Enter Valid Email id ";
                          } else if (value.trim().isEmpty) {
                            return "Enter Valid Email id ";
                          }
                        }),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SigninSignUpWidget().customTextField(
                        height: _height,
                        icon: Icons.vpn_key_outlined,
                        hintText: 'Password',
                        controller: _stuPasswordController,
                        color: white,
                        borderColor: white,
                        validationFunction: (value) {
                          print('dg1');
                          if (value.isEmpty) {
                            return "Enter Valid Password ";
                          } else if (value.trim().isEmpty) {
                            return "Enter Valid Password ";
                          }
                        }),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SigninSignUpWidget().customTextField(
                        height: _height,
                        icon: Icons.vpn_key_outlined,
                        hintText: 'Payment Id',
                        controller: _paymentIdController,
                        color: white,
                        borderColor: white,
                        validationFunction: (value) {
                          if (value.isEmpty) {
                            return "Entera Payment Id ";
                          } else if (value.trim().isEmpty) {
                            return "Entera Payment Id ";
                          }
                        }),
                  ),
                  SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SigninSignUpWidget().customTextField(
                        height: _height,
                        icon: Icons.vpn_key_outlined,
                        hintText: 'Payment Note',
                        controller: _paymentNoteController,
                        color: white,
                        borderColor: white,
                        validationFunction: (value) {
                          if (value.isEmpty) {
                            return "Entera note ";
                          } else if (value.trim().isEmpty) {
                            return "Entera note ";
                          }
                        }),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (newValue) {
                          setState(() {
                            isChecked = newValue;
                          });
                        },
                      ),
                      Text(
                        'Agree with the terms of use and privacy policy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 0.04.sw,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
//>>>>>>>>>>>>>>>>>>>>> Sign Up Button <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                      !isLoading
                          ? GestureDetector(
                              onTap: () {
                                print('ab');
                                if (_formKey2.currentState.validate()) {
                                  _formKey2.currentState.save();
                                  studentRegister(
                                    name: _stuNameController.text.trim(),
                                    email: _stuEmailController.text,
                                    password: _stuPasswordController.text,
                                    mobile: _stuPhoneController.text.trim(),
                                    plan_id:
                                        _paymentIdController.text,
                                        payment_note: _paymentNoteController.text,
                                  );
                                }
                              },
                              child: SigninSignUpWidget().getLoginSignupButton(
                                  width: _width, text: 'SIGN UP'),
                            )
                          : CircularLoader(),
                      SigninSignUpWidget().getHeightSizedBox(_height * 0.1)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: customizeTextStyle(
                            FontWeight.w400, 0.05.sw, primaryColor2),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: customizeTextStyle(
                              FontWeight.w700, 0.06.sw, primaryColor2),
                        ),
                      ),
                      SizedBox(
                        height: 0.05.sh,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
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
            SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SigninSignUpWidget().customTextField(
                  height: _height,
                  icon: Icons.call,
                  hintText: 'Phone Number',
                  controller: _phoneController,
                  color: white,
                  borderColor: white,
                  validationFunction: (value) {
                    // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    // RegExp regExp = new RegExp(patttern);
                    if (value.isEmpty || value.trim().isEmpty) {
                      return "Enter Valid Full Name ";
                    }
                  }),
            ),
            SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SigninSignUpWidget().customTextField(
                  height: _height,
                  icon: Icons.contact_mail,
                  hintText: 'Email Id',
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
            SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SigninSignUpWidget().customTextField(
                  height: _height,
                  icon: Icons.vpn_key_outlined,
                  hintText: 'Password',
                  controller: _passwordController,
                  color: white,
                  borderColor: white,
                  validationFunction: (value) {
                    print('dg1');
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
                  hintText: 'Confirm Password',
                  controller: _confirmPasswordController,
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

  Future<void> parentRegister(
      {name, mobile, email, password, confirm_password}) async {
    setState(() {
      isLoading = true;
    });
    try {
      bool result = await networkcallService.parentRegisterApiCall(
          name: name,
          mobile: mobile,
          email: email,
          password: password,
          confirm_password: confirm_password);
      setState(() {
        isLoading = false;
      });

      if (result) {
        Get.to(ParentProfile());
      } else {}
      print(result);
    } catch (e) {
      print(e);
      isLoading = false;
      setState(() {});
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }

  Future<void> studentRegister(
      {name,
      mobile,
      email,
      password,
      payment_note,
      plan_id}) async {
    // print('dg3');
    setState(() {
      isLoading = true;
    });
    try {
      bool result = await networkcallService.studentRegister(
        name: name,
        mobile: mobile,
        email: email,
        password: password,
        payment_note: payment_note,
        plan_id: plan_id,
      );
      setState(() {
        isLoading = false;
      });

      if (result) {
        Get.to(DashBoradPage());
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DashBoradPage()));

      } else {}
      print(result);
      // showToast("successfully Login", Colors.green);
    } catch (e) {
      print(e);
      isLoading = false;
      setState(() {});
      if (e.isNetworkError != null && e.isNetworkError) {
        showToast(e.customMessage, red);
      } else {
        showToast(e.customMessage, red);
      }
    }
  }
  // Widget _customContainerButton({width, height, icon, text, color}) {
  //   return Container(
  //     width: width,
  //     height: height,
  //     padding: EdgeInsets.all(2.0),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       color: color,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         icon,
  //         Text(
  //           text,
  //           style: customizeTextStyle(FontWeight.w600, 0.04.sw, Colors.black),
  //         )
  //       ],
  //     ),
  //   );
  // }
  // Future<void> _userRegistration(
  //     {name, phoneNumber, user_email, password, confirmPassword}) async {
  //   // print('dg3');
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     bool result = await networkcallService.signUpApiCall(
  //         name: name,
  //         phoneNumber: phoneNumber,
  //         user_email: user_email,
  //         password: password,
  //         confirmPassword: confirmPassword);
  //     setState(() {
  //       isLoading = false;
  //     });

  //     if (result) {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => SubscriptionScreen()));
  //     } else {}
  //     print(result);
  //     //showToast("successfully Login", Colors.green);
  //   } catch (e) {
  //     isLoading = false;
  //     setState(() {});
  //     if (e.isNetworkError != null && e.isNetworkError) {
  //       showToast(e.customMessage, red);
  //     } else {
  //       showToast(e.customMessage, red);
  //     }
  //   }
  // }
}
