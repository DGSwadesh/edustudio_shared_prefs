import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edustudio/util/constant.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpcommingLiveclass extends StatefulWidget {
  @override
  _UpcommingLiveclassState createState() => _UpcommingLiveclassState();
}

class _UpcommingLiveclassState extends State<UpcommingLiveclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.blue,

        title: Text('Up Comming Class',
      ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext ctxt, int index) {
          return Padding(
            padding: EdgeInsets.all(0.03.sw),
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 0.23.sw,
                  width: 0.23.sw,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      user2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SigninSignUpWidget().getWidthSizedBox(0.01.sh),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Teacher Name',
                      overflow: TextOverflow.ellipsis,
                      style:
                          customizeTextStyle(FontWeight.w700, 0.05.sw, black),
                    ),
                    SigninSignUpWidget().getHeightSizedBox(0.01.sh),
                    RichText(
                      text: TextSpan(
                          text: 'Language ',
                          style: TextStyle(color: grayColor, fontSize: 0.03.sw),
                          children: [
                            TextSpan(
                                text: 'Hindi ',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 0.03.sw)),
                            TextSpan(
                                text: 'Upcoming Classes ',
                                style: TextStyle(
                                    color: grayColor, fontSize: 0.03.sw)),
                            TextSpan(
                                text: 'Live',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 0.03.sw)),
                          ]),
                    ),
                    SigninSignUpWidget().getHeightSizedBox(0.01.sh),
                    Row(
                      children: [
                        Text(
                          'Price ',
                          style: TextStyle(color: grayColor, fontSize: 0.03.sw),
                        ),
                        Text('\$10',
                            style: TextStyle(
                                color: Colors.blue, fontSize: 0.03.sw)),
                        FaIcon(
                          FontAwesomeIcons.check,
                          color: red,
                          size: 0.04.sw,
                        ),
                        Text(
                          ' Premium | ',
                          style: TextStyle(color: grayColor, fontSize: 0.03.sw),
                        ),
                        FaIcon(
                          FontAwesomeIcons.check,
                          color: green,
                          size: 0.04.sw,
                        ),
                        Text(
                          ' Free',
                          style: TextStyle(color: grayColor, fontSize: 0.03.sw),
                        ),
                        FaIcon(
                          FontAwesomeIcons.closedCaptioning,
                          color: green,
                          size: 0.04.sw,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
