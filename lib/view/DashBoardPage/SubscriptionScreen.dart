import 'package:edustudio/Controller/SubscriptionController.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/view/DashBoardPage/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  SubscriptionController subscriptionController =
      Get.put(SubscriptionController());
  String grpVal = '';

  @override
  void initState() {
    // print('abc');
    super.initState();
    subscriptionController.fetchSubscriptionData();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Obx(
      () => Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: Container(
              color: backgroundColor,
              child: Stack(
                children: [
                  SingleChildScrollView(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _topContainer(_width, _height),
                          _subscriptionImage(_width),
                        ],
                      ),
                      _bottomContainer(),
                    ],
                  )),
                  // Positioned(
                  //     child: _subscriptionImage(_width),
                  //     top: _height * 0.04,
                  //     right: _width * 0.05),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     _topContainer(_width, _height),
                  //     RotatedBox(
                  //       quarterTurns: 18,
                  //       child: Image.asset(logInShapePng),
                  //     )
                  //   ],
                  // )
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RotatedBox(
                        quarterTurns: 18,
                        child: Image.asset(logInShapePng),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget _subscriptionImage(_width) {
    return Container(
      height: _width * 0.3,
      width: _width * 0.3,
      child: SvgPicture.asset(
        subscription,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _topContainer(_width, _height) {
    return Padding(
      padding: EdgeInsets.only(
          top: _width * 0.06, left: _width * 0.04, right: _height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subscription',
                  textAlign: TextAlign.justify,
                  style: customizeTextStyle(
                      FontWeight.w700, 0.07.sw, primaryColor2),
                ),
                Text(
                  'Benefits included',
                  style: customizeTextStyle(
                      FontWeight.w700, 0.04.sw, primaryColor2),
                ),
              ],
            ),
          ),
          // SigninSignUpWidget().getHeightSizedBox(_height * 0.01),
          // SigninSignUpWidget().getHeightSizedBox(_height * 0.02),
          // ListTile(
          //   dense: true,
          //   leading: CircleAvatar(
          //     child: Icon(Icons.location_on),
          //   ),
          //   title: Text(
          //     'All Location',
          //     style:
          //         customizeTextStyle(FontWeight.w700, 0.05.sw, primaryColor2),
          //   ),
          //   subtitle: Text(
          //     'connect through any of our location',
          //     style:
          //         customizeTextStyle(FontWeight.w700, 0.04.sw, primaryColor2),
          //   ),
          // ),
          // ListTile(
          //   dense: true,
          //   leading: CircleAvatar(
          //     child: Icon(Icons.location_on),
          //   ),
          //   title: Text(
          //     'All Location',
          //     style:
          //         customizeTextStyle(FontWeight.w700, 0.05.sw, primaryColor2),
          //   ),
          //   subtitle: Text(
          //     'connect through any of our location',
          //     style:
          //         customizeTextStyle(FontWeight.w700, 0.04.sw, primaryColor2),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _bottomContainer() {
    // print('len--- ${subscriptionController.listOfSubscription.length}');
    return subscriptionController.listOfSubscription.length > 0
        ? Container(
            // height: _height * 0.6 - _height * 0.05,
            height: 0.9.sh,
            width: 1.sw,
            color: backgroundColor,
            child: Column(
              children: [
                SigninSignUpWidget().getHeightSizedBox(1.sh * 0.05),
                Container(
                  height: 130,
                  width: 1.sw,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                    child: ListView.separated(
                        itemCount:
                            subscriptionController.listOfSubscription.length,
                        // itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (ctx, index) {
                          return Container(
                            width: 0.1.sw,
                          );
                        },
                        itemBuilder: (ctx, index) {
                          return Container(
                            width: 0.4.sw,
                            // height: 0.1.sh,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Radio(
                                        value: 'Colors.red',
                                        groupValue: grpVal,
                                        onChanged: (val) {
                                          grpVal = val;
                                          setState(() {});
                                        }),
                                    IconButton(
                                        icon: Icon(Icons.info),
                                        onPressed: () {
                                          // _showDialogBasic();
                                        })
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0.02.sw),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Free',
                                        // subscriptionController
                                        //             .listOfSubscription.length >
                                        //         0
                                        //     ? subscriptionController
                                        //         .listOfSubscription[index].name
                                        //     : ' ',
                                        style: customizeTextStyle(
                                            FontWeight.w900, 0.05.sw, black),
                                      ),

                                      SigninSignUpWidget()
                                          .getHeightSizedBox(0.01.sw),
                                      Text(
                                        // 'dg',
                                        '${subscriptionController.listOfSubscription[index].limitFreeClass} days Trial',
                                        style: customizeTextStyle(
                                            FontWeight.w700, 0.05.sw, black),
                                      ),
                                      SigninSignUpWidget()
                                          .getHeightSizedBox(0.01.sw),
                                      // Text(
                                      //   'After trail, pay \$5 per week',
                                      //   style: customizeTextStyle(
                                      //       FontWeight.w700, 0.03.sw, black),
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SigninSignUpWidget().getHeightSizedBox(1.sh * 0.04),
                SigninSignUpWidget().getHeightSizedBox(1.sh * 0.02),
                GestureDetector(
                  onTap: () {
                    Get.to(DashBoradPage());
                  },
                  child: SigninSignUpWidget().getLoginSignupButton(
                      width: 1.sw * 0.5, text: 'GET STARTED'),
                )
              ],
            ))
        : Container();
  }

  Future<void> _showDialogStarter() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              '${subscriptionController.listOfSubscription[0].name} Package'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Description- ${subscriptionController.listOfSubscription[0].description}'),
                SizedBox(
                  height: 0.01.sh,
                ),
                Text(
                    'Total ${subscriptionController.listOfSubscription[0].duration} hr. course'),
                Text(
                    'This was created at ${subscriptionController.listOfSubscription[0].createdAt}'),
                Text(
                    'This was updated at ${subscriptionController.listOfSubscription[0].updatedAt}'),
                Text(
                    'You will get ${subscriptionController.listOfSubscription[0].limitFreeClass} limited free classes'),
                // Text('This is a demo alert dialog.'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Done'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogBasic() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              '${subscriptionController.listOfSubscription[0].name} Package'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Description- ${subscriptionController.listOfSubscription[0].description}'),
                SizedBox(
                  height: 0.01.sh,
                ),
                Text(
                    'Total ${subscriptionController.listOfSubscription[0].duration} hr. course'),
                Text(
                    'This was created at ${subscriptionController.listOfSubscription[0].createdAt}'),
                Text(
                    'This was updated at ${subscriptionController.listOfSubscription[0].updatedAt}'),
                Text(
                    'You will get ${subscriptionController.listOfSubscription[0].limitFreeClass} limited free classes'),
                // Text('This is a demo alert dialog.'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Done'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Container(
//       width: _width * 0.40,
//       height: _width * 0.40,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//                 offset: Offset(-1, 5),
//                 blurRadius: 10.0,
//                 spreadRadius: 0.01,
//                 color: thinGrayColor)
//           ],
//           borderRadius: BorderRadius.circular(15)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Radio(
//                   value: 'Colors.red',
//                   groupValue: grpVal,
//                   onChanged: (val) {
//                     grpVal = val;
//                     setState(() {});
//                   }),
//               IconButton(
//                   icon: Icon(Icons.info),
//                   onPressed: () {
//                     _showDialogBasic();
//                   })
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 0.02.sw),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Obx(
//                   () => Text(
//                     // 'Free',
//                     subscriptionController
//                                 .listOfSubscription.length >
//                             0
//                         ? subscriptionController
//                             .listOfSubscription[0].name
//                         : ' ',
//                     style: customizeTextStyle(
//                         FontWeight.w900, 0.05.sw, black),
//                   ),
//                 ),
//                 SigninSignUpWidget().getHeightSizedBox(0.01.sw),
//                 Text(
//                   '${subscriptionController.listOfSubscription[0].limitFreeClass} days Trial',
//                   style: customizeTextStyle(
//                       FontWeight.w700, 0.05.sw, black),
//                 ),
//                 SigninSignUpWidget().getHeightSizedBox(0.01.sw),
//                 // Text(
//                 //   'After trail, pay \$5 per week',
//                 //   style: customizeTextStyle(
//                 //       FontWeight.w700, 0.03.sw, black),
//                 // ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//     Container(
//       width: _width * 0.40,
//       height: _width * 0.40,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//                 offset: Offset(-1, 5),
//                 blurRadius: 10.0,
//                 spreadRadius: 0.01,
//                 color: thinGrayColor)
//           ],
//           borderRadius: BorderRadius.circular(15)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Radio(
//                   value: 'Colors.blue',
//                   groupValue: grpVal,
//                   onChanged: (val) {
//                     grpVal = val;
//                     setState(() {});
//                   }),
//               IconButton(
//                   icon: Icon(Icons.info),
//                   onPressed: () {
//                     _showDialogStarter();
//                   })
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   //'Go Premium',
//                   subscriptionController.listOfSubscription.length >
//                           0
//                       ? subscriptionController
//                           .listOfSubscription[0].name
//                       : ' ',
//                   style: customizeTextStyle(
//                       FontWeight.w900, 0.05.sw, green),
//                 ),
//                 SigninSignUpWidget().getHeightSizedBox(0.01.sw),
//                 Text(
//                   '${subscriptionController.listOfSubscription[0].limitFreeClass} free Classes',
//                   style: customizeTextStyle(
//                       FontWeight.w700, 0.04.sw, black),
//                 ),
//                 SigninSignUpWidget().getHeightSizedBox(0.01.sw),
//                 Text(
//                   'pay \$${subscriptionController.listOfSubscription[0].price} per month',
//                   style: customizeTextStyle(
//                       FontWeight.w700, 0.04.sw, black),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     )
//   ],
// ),
