import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoPremium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.blueAccent,
                    child: Stack(
                      children: [
                        Positioned(
                            child: _subscriptionImage(_width),
                            top: _height * 0.04,
                            right: _width * 0.05),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _topContainer(_width, _height),
                            RotatedBox(
                              quarterTurns: 18,
                              child: Image.asset(logInShapePng),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: _bottomContainer(_width, _height),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _subscriptionImage(_width) {
    return Container(
      height: _width * 0.3,
      width: _width * 0.3,
      child: SvgPicture.asset(
        premium2,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _topContainer(_width, _height) {
    return Padding(
      padding: EdgeInsets.only(
          //   top: _width * 0.06, left: _width * 0.04, right: _height * 0.05
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Go premium',
                  textAlign: TextAlign.justify,
                  style: customizeTextStyle(
                      FontWeight.w700, 0.07.sw, primaryColor2),
                ),
                Text(
                  'Benefits of premium',
                  style: customizeTextStyle(
                      FontWeight.w700, 0.04.sw, primaryColor2),
                ),
              ],
            ),
          ),
          SigninSignUpWidget().getHeightSizedBox(_height * 0.01),
          SigninSignUpWidget().getHeightSizedBox(_height * 0.02),
          ListTile(
            dense: true,
            leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.checkDouble,
                    size: 20,
                  ),
                )),
            title: Text(
              'All Location',
              style:
                  customizeTextStyle(FontWeight.w700, 0.05.sw, primaryColor2),
            ),
            subtitle: Text(
              'connect through any of our location',
              style:
                  customizeTextStyle(FontWeight.w700, 0.04.sw, primaryColor2),
            ),
          ),
          ListTile(
            dense: true,
            leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.checkDouble,
                    size: 20,
                  ),
                )),
            title: Text(
              'All Location',
              style:
                  customizeTextStyle(FontWeight.w700, 0.05.sw, primaryColor2),
            ),
            subtitle: Text(
              'connect through any of our location',
              style:
                  customizeTextStyle(FontWeight.w700, 0.02.sw, primaryColor2),
            ),
          ),
          ListTile(
            dense: true,
            leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.checkDouble,
                    size: 20,
                  ),
                )),
            title: Text(
              'All Location',
              style:
                  customizeTextStyle(FontWeight.w700, 0.05.sw, primaryColor2),
            ),
            subtitle: Text(
              'connect through any of our location',
              style:
                  customizeTextStyle(FontWeight.w700, 0.04.sw, primaryColor2),
            ),
          ),
          ListTile(
            dense: true,
            leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.checkDouble,
                    size: 20,
                  ),
                )),
            title: Text(
              'All Location',
              style:
                  customizeTextStyle(FontWeight.w700, 0.05.sw, primaryColor2),
            ),
            subtitle: Text(
              'connect through any of our location',
              style:
                  customizeTextStyle(FontWeight.w700, 0.04.sw, primaryColor2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomContainer(_width, _height) {
    return Container(
        height: 0.02.sh,
        // height: _height * 0.3 - _height * 0.03,
        width: _width,
        color: white,
        child: Column(
          children: [
            SigninSignUpWidget().getHeightSizedBox(_height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: _width * 0.40,
                  height: _width * 0.40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(-1, 5),
                            blurRadius: 10.0,
                            spreadRadius: 0.01,
                            color: thinGrayColor)
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                        value: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0.02.sw),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Free',
                              style: customizeTextStyle(
                                  FontWeight.w900, 0.05.sw, black),
                            ),
                            SigninSignUpWidget().getHeightSizedBox(0.01.sw),
                            Text(
                              '7 days Trial',
                              style: customizeTextStyle(
                                  FontWeight.w700, 0.05.sw, black),
                            ),
                            SigninSignUpWidget().getHeightSizedBox(0.01.sw),
                            Text(
                              'After trail, pay \$5 per week',
                              style: customizeTextStyle(
                                  FontWeight.w700, 0.03.sw, black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: _width * 0.40,
                  height: _width * 0.40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(-1, 5),
                            blurRadius: 10.0,
                            spreadRadius: 0.01,
                            color: thinGrayColor)
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Radio(
                            value: true,
                          ),
                          Radio(
                            value: true,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Go Premium',
                              style: customizeTextStyle(
                                  FontWeight.w900, 0.05.sw, green),
                            ),
                            SigninSignUpWidget().getHeightSizedBox(0.01.sw),
                            Text(
                              '1 Year',
                              style: customizeTextStyle(
                                  FontWeight.w700, 0.05.sw, black),
                            ),
                            SigninSignUpWidget().getHeightSizedBox(0.01.sw),
                            Text(
                              'pay \$5 per month',
                              style: customizeTextStyle(
                                  FontWeight.w700, 0.04.sw, black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SigninSignUpWidget().getHeightSizedBox(_height * 0.02),
            // Text(
            //   'Try out the free trial of 7 days',
            //   style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
            // ),
            // SigninSignUpWidget().getHeightSizedBox(_height * 0.02),
            // SigninSignUpWidget()
            //     .getLoginSignupButton(width: _width * 0.5, text: 'GET STARTED')
          ],
        ));
  }
}

// class GoPremium extends StatefulWidget {
//   @override
//   _GoPremiumState createState() => _GoPremiumState();
// }
//
// class _GoPremiumState extends State<GoPremium> {
//   List<String> litems = ["1", "2", "Third", "4"];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//         ),
//         title: Text(""),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Go premium"),
//                   Text("Benefits of premium"),
//                 ],
//               ),
//               SvgPicture.asset(
//                 premium2,
//                 // semanticsLabel: 'Acme Logo',
//                 height: 0.1.sh,
//                 // width: _width * 0.2,
//                 // fit: BoxFit.cover,
//               ),
//             ],
//           ),
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: 4,
//             itemBuilder: (context, position) {
//               return Container(
//                 color: Colors.blue,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       height: 0.1.sh,
//                       width: 0.03.sw,
//                     ),
//                     CircleAvatar(
//                       backgroundColor: white,
//                       radius: 25,
//                       child: IconButton(
//                         icon: FaIcon(
//                           FontAwesomeIcons.checkDouble,
//                           size: 20,
//                         ),
//                         onPressed: () {},
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("connect through "),
//                         Text("ALL location any of your location"),
//                       ],
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
