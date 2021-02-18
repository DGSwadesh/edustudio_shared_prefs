import 'package:edustudio/Widget/DrawerCustomPaint.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/util/sharePreference_instance.dart';
import 'package:edustudio/view/DashBoardPage/Dashboard.dart';
import 'package:edustudio/view/DashBoardPage/My%20Profile.dart';
import 'package:edustudio/view/DashBoardPage/demoClass.dart';
import 'package:edustudio/view/DashBoardPage/mySubjectAllCategory.dart';
import 'package:edustudio/view/DashBoardPage/paypal/braintree_payment.dart';
import 'package:edustudio/view/DashBoardPage/paypal/paypal_implement.dart';
import 'package:edustudio/view/DashBoardPage/upcoming_live_class.dart';
import 'package:edustudio/view/SigninSignUp/loginScreen.dart';
import 'package:edustudio/view/SigninSignUp/parentProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../util/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edustudio/view/DashBoardPage/my_subscriptions.dart';
import 'package:edustudio/view/DashBoardPage/recommended%20teacher.dart';

class DashBoardWidget {
  Widget dashBoardAppBar(_width, _height) {
    return AppBar(
      backgroundColor: backgroundColor,
      // elevation: 0.0,
      title: Row(
        children: [
          SvgPicture.asset(
            logInPageEdutationLogo,
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Educational App'),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size(70, 0.08.sh),
        child: Container(
          width: double.infinity,
          color: backgroundColor,
          child: Padding(
            padding:
                EdgeInsets.only(bottom: 0.03.sw, left: 0.03.sw, right: 0.03.sw),
            child: Container(
              height: 0.11.sw,
              padding: EdgeInsets.only(left: 0.05.sw, bottom: 0.01.sw),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: white,
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search Your want...',
                    hintStyle: customizeTextStyle(
                        FontWeight.w700, 0.04.sw, thinGrayColor),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      size: 0.07.sw,
                    )),
              ),
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.to(MakePayment());
          },
          child: Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications_active,
                    size: 0.07.sw,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.red,
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 0.3.sw,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.4.sh,
                child: Stack(
                  children: [
                    DrawerCustomPaint(),
                    Positioned(
                      top: 0.1.sh,
                      left: 0.1.sw,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(MyProfile());
                            },
                            child: CircleAvatar(
                              radius: 0.11.sw,
                              child: CircleAvatar(
                                radius: 0.10.sw,
                                backgroundImage: SharePreferenceInstance()
                                            .getProfilePath() !=
                                        null
                                    ? NetworkImage((SharePreferenceInstance()
                                        .getProfilePath()))
                                    : AssetImage(user),
                              ),
                            ),
                          ),
                          SigninSignUpWidget().getWidthSizedBox(0.02.sw),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                SharePreferenceInstance().getUserName() ??
                                    'UserName',
                                textAlign: TextAlign.justify,
                                style: customizeTextStyle(
                                    FontWeight.w500, 0.05.sw, primaryColor2),
                              ),
                              SigninSignUpWidget().getHeightSizedBox(0.01.sw),
                              SizedBox(
                                width: 0.5.sw,
                                child: Text(
                                  SharePreferenceInstance().getEmail() ??
                                      'email',
                                  overflow: TextOverflow.clip,
                                  style: customizeTextStyle(
                                      FontWeight.w500, 0.04.sw, primaryColor2),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // SigninSignUpWidget().getHeightSizedBox(0.09.sh),
              _customListTile(
                  text: 'Home',
                  icon: Icons.home,
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => DashBoradPage()));
                  Get.to(ParentProfile()); 
                   // Get.to(DashBoradPage());
                  }),
              _customListTile(
                  text: 'My Subject',
                  icon: Icons.menu_book,
                  onTap: () {
                    Get.to(MySubjectAllCategory());
                  }),
              _customListTile(
                  text: 'UpComming Live Class',
                  icon: Icons.live_help,
                  onTap: () {
                    Get.to(UpcommingLiveclass());
                  }),
              _customListTile(
                  text: 'Tutors',
                  icon: Icons.people,
                  onTap: () {
                    // Get.to(RecommendedTeacher());
                  }),
              _customListTile(
                  text: 'Demo class',
                  icon: Icons.laptop,
                  onTap: () {
                    Get.to(DemoClass());
                  }),
              _customListTile(
                  text: 'My Profile',
                  icon: Icons.account_circle,
                  onTap: () {
                    Get.to(MyProfile());
                  }),
              _customListTile(
                  text: 'My subsciption plan',
                  icon: Icons.home,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Subscription()),
                    );
                    // Get.to(MyProfile());
                  }),
              _customListTile(
                  text: 'Payment History',
                  icon: Icons.event,
                  onTap: () {
                    Get.to(MyProfile());
                  }),
              _customListTile(
                  text: 'Log Out',
                  icon: Icons.exit_to_app,
                  onTap: () {
                    sharePrefereceInstance.clear();
                    Get.offAll(LoginScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customListTile({text, icon, onTap}) {
    return Column(
      children: [
        SigninSignUpWidget().getHeightSizedBox(0.01.sh),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: 0.016.sw,
                height: 0.12.sw,
                color: Colors.blue,
              ),
              SigninSignUpWidget().getWidthSizedBox(0.05.sw),
              Icon(
                icon,
                size: 0.06.sw,
                color: Colors.blueAccent,
              ),
              SigninSignUpWidget().getWidthSizedBox(0.05.sw),
              Text(
                text,
                style: customizeTextStyle(FontWeight.w700, 0.05.sw, blueColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
