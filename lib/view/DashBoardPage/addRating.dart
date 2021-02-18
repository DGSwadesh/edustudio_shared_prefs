import 'package:cached_network_image/cached_network_image.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Review extends StatefulWidget {
  var teacherUserId;
  Review({this.teacherUserId});

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  bool isLoading = false;
  double rating;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _headingController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Review",
          style: customizeTextStyle(FontWeight.w500, 0.06.sw, white),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      // body: SingleChildScrollView(child: ,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.1.sh,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 0.9.sw,
                  child: Center(
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 0,
                      // direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 0.1.sw,
                      itemPadding: EdgeInsets.all(0.02.sw),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                        setState(() {
                          this.rating = rating;
                        });
                      },
                    ),
                  ),
                ),
                SigninSignUpWidget().getWidthSizedBox(0.01.sw),
              ],
            ),
            _getLogInForm(_height),
            SigninSignUpWidget().getHeightSizedBox(_height * 0.01),
            GestureDetector(
              onTap: () {
                saveRating();
              },
              child: SigninSignUpWidget().getLoginSignupButton(
                  width: double.infinity, text: 'POST COMMENT'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getLogInForm(_height) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(0.03.sw),
              child: SigninSignUpWidget().customTextField(
                  controller: _headingController,
                  height: _height,
                  icon: Icons.edit,
                  hintText: 'Heading',
                  color: black,
                  borderColor: loginButtonColor,
                  validationFunction: (value) {
                    if (value.isEmpty) {
                      return "please enter heading ";
                    }
                    // else if (value.trim().isEmpty) {
                    //   return "Enter Valid Full Name ";
                    // }
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(0.03.sw),
              child: SigninSignUpWidget().customTextField(
                  controller: _descriptionController,
                  height: _height,
                  icon: Icons.description,
                  hintText: 'Description',
                  color: black,
                  borderColor: loginButtonColor,
                  validationFunction: (value) {
                    if (value.isEmpty) {
                      return "Please Enter description ";
                    }
                    // else if (value.trim().isEmpty) {
                    //   return "Enter Valid Full Name ";
                    // }
                  }),
            ),
            // Padding(
            //   padding: EdgeInsets.all(0.03.sw),
            //   child: SigninSignUpWidget().customTextField(
            //     height: _height,
            //     icon: Icons.textsms_outlined,
            //     hintText: 'Comment',
            //     color: loginButtonColor,
            //     borderColor: loginButtonColor,
            //     // validationFunction: (value) {
            //     //   if (value.isEmpty) {
            //     //     return "Enter Valid Full Name ";
            //     //   } else if (value.trim().isEmpty) {
            //     //     return "Enter Valid Full Name ";
            //     //   }
            //     // }
            //   ),
            // ),
          ],
        ));
  }

  void saveRating() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        isLoading = true;
      });
      try {
        bool result = await networkcallService.saveReview(
          teacherUserId: '4',
          // widget.teacherUserId,
          rating: rating.toString(),
          heading: _headingController.text.trim(),
          description: _descriptionController.text.trim(),
        );
        setState(() {
          isLoading = false;
        });

        if (result) {
          Get.back();
        }
        //print(result);
        //showToast("successfully Login", Colors.green);
      } catch (e) {
        setState(() {
          isLoading = false;
        });
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
