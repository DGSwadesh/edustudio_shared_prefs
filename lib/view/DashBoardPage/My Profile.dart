import 'dart:collection';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edustudio/Controller/filter_controller.dart';
import 'package:edustudio/Widget/DashBoardWidget.dart';
import 'package:edustudio/Widget/DrawerCustomPaint.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/util/constant.dart';
import 'package:edustudio/util/sharePreference_instance.dart';
import 'package:edustudio/view/DashBoardPage/editProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyProfile extends StatelessWidget {
  // FilterController _filterController = Get.lazyPut(()=>FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                DrawerCustomPaint(),
                Positioned(
                  top: 0.1.sh,
                  left: 0.1.sw,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 0.12.sw,
                        child: CircleAvatar(
                          radius: 0.11.sw,
                          backgroundImage: SharePreferenceInstance()
                                      .getProfilePath() !=
                                  null
                              ? NetworkImage(
                                  (SharePreferenceInstance().getProfilePath()))
                              : AssetImage(user),
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
                          Text(
                            SharePreferenceInstance().getEmail() ?? 'email',
                            style: customizeTextStyle(
                                FontWeight.w500, 0.04.sw, primaryColor2),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SigninSignUpWidget().getHeightSizedBox(0.05.sh),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: grayColor,
                  radius: 0.08.sw,
                  child: CircleAvatar(
                    backgroundColor: white,
                    radius: 0.07.sw,
                    child: Icon(Icons.engineering_outlined),
                  )),
              title: Text(
                'email',
                style: customizeTextStyle(FontWeight.w600, 0.04.sw, black),
              ),
              subtitle: Text(
                SharePreferenceInstance().getEmail() ?? 'Email',
                style: customizeTextStyle(FontWeight.w500, 0.03.sw, black),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: grayColor,
                  radius: 0.08.sw,
                  child: CircleAvatar(
                    backgroundColor: white,
                    radius: 0.07.sw,
                    child: Icon(Icons.engineering_outlined),
                  )),
              title: Text(
                'Mobile No',
                style: customizeTextStyle(FontWeight.w600, 0.04.sw, black),
              ),
              subtitle: Text(
                SharePreferenceInstance().getPhoneNo() ?? 'Mobile No',
                style: customizeTextStyle(FontWeight.w500, 0.03.sw, black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
