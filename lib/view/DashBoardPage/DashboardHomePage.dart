// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:edustudio/Widget/DashBoardWidget.dart';
// import 'package:edustudio/Widget/LoginWidget.dart';
// import 'package:edustudio/util/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DashBoradPage extends StatefulWidget {
//   static const String routeName = '/dashBoradPage';

//   @override
//   _DashBoradPageState createState() => _DashBoradPageState();
// }

// class _DashBoradPageState extends State<DashBoradPage> {
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(0.05.sw),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Select Category',
//                     style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
//                   ),
//                   Text(
//                     'See All',
//                     style:
//                         customizeTextStyle(FontWeight.w700, 0.04.sw, blueColor),
//                   )
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _dashboardItem(),
//                 _dashboardItem(),
//                 _dashboardItem(),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _dashboardItem(),
//                 _dashboardItem(),
//                 _dashboardItem(),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.all(0.05.sw),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Recommanded Teacher',
//                     style: customizeTextStyle(FontWeight.w700, 0.04.sw, black),
//                   ),
//                   Text(
//                     'More',
//                     style:
//                         customizeTextStyle(FontWeight.w700, 0.04.sw, blueColor),
//                   )
//                 ],
//               ),
//             ),
//             Container(width: 0.9.sw, height: 0.45.sh, child: BottomSlider()),
//             Container(
//               height: 200,
//             ),

//             // Container(
//             //   height: _height * 0.1,
//             //   width: _width,
//             //   color: blueColor,
//             //   child: RotatedBox(
//             //       quarterTurns: 10, child: Image.asset(logInShapePng)),
//             // )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _dashboardItem() {
//     return Container(
//       width: 0.20.sw,
//       height: 0.20.sw,
//       margin: EdgeInsets.all(0.03.sw),
//       padding: EdgeInsets.all(0.02.sw),
//       decoration: BoxDecoration(
//           color: loginButtonColor,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//                 offset: Offset(-1, 5),
//                 blurRadius: 10.0,
//                 spreadRadius: 0.01,
//                 color: thinGrayColor)
//           ]),
//       child: SvgPicture.asset(
//         logInPageEdutationLogo,
//         // semanticsLabel: 'Acme Logo',
//         //height: _width * 0.13,
//         // width: _width * 0.2,
//         // fit: BoxFit.cover,
//       ),
//     );
//   }

//   Widget BottomSlider() {
//     return ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Container(
//             width: 0.4.sw,
//             decoration: BoxDecoration(
//                 color: loginButtonColor,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                       offset: Offset(-1, 5),
//                       blurRadius: 10.0,
//                       spreadRadius: 0.01,
//                       color: thinGrayColor)
//                 ]),
//             child: Column(
//               children: [
//                 Container(
//                   height: 0.4.sw,
//                   width: 0.4.sw,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10.0),
//                         topRight: Radius.circular(10.0)),
//                     child: Image.asset(
//                       user2,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(0.03.sw),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Ms. aliayana',
//                         overflow: TextOverflow.ellipsis,
//                         style: customizeTextStyle(
//                             FontWeight.w500, 0.04.sw, blueColor),
//                       ),
//                       Text(
//                         'Biology Teacher',
//                         overflow: TextOverflow.ellipsis,
//                         style:
//                             customizeTextStyle(FontWeight.w700, 0.04.sw, black),
//                       ),
//                       Text(
//                         '4.5',
//                         style:
//                             customizeTextStyle(FontWeight.w700, 0.05.sw, black),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           RatingBar.builder(
//                             initialRating: 3,
//                             minRating: 1,
//                             direction: Axis.horizontal,
//                             allowHalfRating: true,
//                             itemCount: 5,
//                             itemSize: 0.05.sw,
//                             itemBuilder: (context, _) => Icon(
//                               Icons.star,
//                               color: Colors.red,
//                             ),
//                             onRatingUpdate: (rating) {
//                               print(rating);
//                             },
//                           ),
//                           FaIcon(
//                             FontAwesomeIcons.heart,
//                             color: darkRedColor,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return Container(
//             width: 15,
//             height: 10,
//           );
//         },
//         itemCount: 5);
//   }
// }


