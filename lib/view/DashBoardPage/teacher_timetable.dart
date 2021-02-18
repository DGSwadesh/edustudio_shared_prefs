import 'package:cached_network_image/cached_network_image.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TeacherTimetable extends StatefulWidget {
  @override
  _TeacherTimetableState createState() => _TeacherTimetableState();
}

class _TeacherTimetableState extends State<TeacherTimetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          actions: [
            IconButton(icon: Icon(Icons.cancel_outlined), onPressed: null)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    Text(
                      "1. PHYSICAL WORLD PHYSICS",
                      textAlign: TextAlign.justify,
                      style: customizeTextStyle(
                          FontWeight.w700, 0.06.sw, Colors.black),
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    Text(
                      "Lorem ipsum is simply dummy text of the printing "
                      "and typesetting industry,lorem ipsum has been the"
                      "and typesetting industry,lorem ipsum has been the"
                      "and typesetting industry,lorem ipsum has been the"
                      "and typesetting industry,lorem ipsum has been the"
                      "and typesetting industry,lorem ipsum has been the",
                      style: customizeTextStyle(
                          FontWeight.w500, 0.05.sw, Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.checkDouble,
                                size: 20,
                                color: Colors.yellow,
                              ),
                            )),
                        Text(
                          "Free class",
                          style: customizeTextStyle(
                              FontWeight.w500, 0.05.sw, Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: FaIcon(FontAwesomeIcons.checkDouble,
                                  size: 20, color: Colors.green),
                            )),
                        Text(
                          " paid class",
                          style: customizeTextStyle(
                              FontWeight.w500, 0.05.sw, Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Text(
                      "Upcoming Classes",
                      textAlign: TextAlign.justify,
                      style: customizeTextStyle(
                          FontWeight.w700, 0.06.sw, Colors.black),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),



                    Container(
                      child: Table(
                        //  defaultColumnWidth: FixedColumnWidth(0.3.sw),
                        border: TableBorder.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        children: [
                          // DataColumn(label: Text('dg')),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Table(
                                //  defaultColumnWidth: FixedColumnWidth(0.3.sw),
                                border: TableBorder.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                children: [
                                  // DataColumn(label: Text('dg')),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TableCell(
                                          child: Column(
                                        children: [
                                          Text(
                                            'Date and time: ',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.black),
                                          ),
                                          Text(
                                            '10/12/60,12:00',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.yellow),
                                          )
                                        ],
                                      )),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TableCell(
                                          child: Row(
                                        children: [
                                          Text(
                                            'Available slots: ',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.black),
                                          ),
                                          Text(
                                            '5',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.yellow),
                                          )
                                        ],
                                      )),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TableCell(
                                          child: Row(
                                        children: [
                                          Text(
                                            'Language ',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.black),
                                          ),
                                          Text(
                                            'English',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.yellow),
                                          )
                                        ],
                                      )),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0.09.sh),
                              child: TableCell(
                                child: Container(
                                  width: 0.4.sw,
                                  height: 0.12.sw,
                                  decoration: BoxDecoration(
                                      color: loginButtonColor,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(-1, 1),
                                            blurRadius: 2.0,
                                            spreadRadius: 0.01,
                                            color: lightBlackBoldColor)
                                      ]),
                                  child: Center(
                                      child: Text(
                                    "Enroll Now",
                                    style: customizeTextStyle(FontWeight.w600,
                                        0.05.sw, primaryColor2),
                                  )),
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),

                    
                    Container(
                      child: Table(
                        //  defaultColumnWidth: FixedColumnWidth(0.3.sw),
                        border: TableBorder.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        children: [
                          // DataColumn(label: Text('dg')),
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Table(
                                //  defaultColumnWidth: FixedColumnWidth(0.3.sw),
                                border: TableBorder.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                children: [
                                  // DataColumn(label: Text('dg')),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TableCell(
                                          child: Column(
                                        children: [
                                          Text(
                                            'Date and time: ',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.black),
                                          ),
                                          Text(
                                            '10/12/60,12:00',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.yellow),
                                          )
                                        ],
                                      )),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TableCell(
                                          child: Row(
                                        children: [
                                          Text(
                                            'Available: ',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.black),
                                          ),
                                          Text(
                                            '5',
                                            style: customizeTextStyle(
                                                FontWeight.w500,
                                                0.05.sw,
                                                Colors.yellow),
                                          )
                                        ],
                                      )),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TableCell(
                                          child: Center(
                                              child: Text(
                                        'Language',
                                        style: customizeTextStyle(
                                            FontWeight.w500,
                                            0.05.sw,
                                            Colors.black),
                                      ))),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 0.09.sh,
                              ),
                              child: TableCell(
                                child: Container(
                                  width: 0.2.sw,
                                  height: 0.12.sw,
                                  decoration: BoxDecoration(
                                      color: loginButtonColor,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(-1, 1),
                                            blurRadius: 2.0,
                                            spreadRadius: 0.01,
                                            color: lightBlackBoldColor)
                                      ]),
                                  child: Center(
                                      child: Text(
                                    "Enroll Now",
                                    style: customizeTextStyle(FontWeight.w600,
                                        0.05.sw, primaryColor2),
                                  )),
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Next",
                        style: customizeTextStyle(
                            FontWeight.w600, 0.05.sw, Colors.blue),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 0.03.sw,
                        ),
                        CircleAvatar(
                            backgroundColor: grayColor,
                            radius: 0.06.sw,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 0.07.sw,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://crop-circle.imageonline.co/crop-circle.png",
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            )),
                        SizedBox(
                          width: 0.03.sw,
                        ),
                        Column(
                          children: [
                            Text(
                              "Liza rayan",
                              style: customizeTextStyle(
                                  FontWeight.w800, 0.05.sw, black),
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            Text(
                              "20/04/20",
                              style: customizeTextStyle(
                                  FontWeight.w500, 0.04.sw, black),
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 0.05.sw,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Divider(
                              thickness: 0.001.sh,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Ratings",
                        style: customizeTextStyle(
                            FontWeight.w600, 0.05.sw, Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0.05.sw),
                                  width: 0.30.sw,
                                  height: 0.11.sh,
                                  decoration:
                                      BoxDecoration(color: Colors.green),
                                  child: Center(
                                      child: Text(
                                    '4.0 \n out of 5',
                                    style: customizeTextStyle(
                                        FontWeight.w800, 15.0, Colors.white),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                SizedBox(
                                  height: 0.01.sh,
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 0.05.sw,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.red,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            )),
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Excellent',
                                        style: customizeTextStyle(
                                            FontWeight.w800,
                                            0.04.sw,
                                            Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    width: 0.15.sw,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 0.32.sw,
                                    lineHeight: 8.0,
                                    percent: 0.8,
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  Text(
                                    '123',
                                    style: customizeTextStyle(
                                        FontWeight.w800, 0.04.sw, Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              SizedBox(
                                height: 0.015.sh,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Good',
                                        style: customizeTextStyle(
                                            FontWeight.w800,
                                            0.04.sw,
                                            Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    width: 0.15.sw,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 0.32.sw,
                                    lineHeight: 8.0,
                                    percent: 0.5,
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  Text(
                                    '80',
                                    style: customizeTextStyle(
                                        FontWeight.w800, 0.04.sw, Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              SizedBox(
                                height: 0.015.sh,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Average',
                                        style: customizeTextStyle(
                                            FontWeight.w800,
                                            0.04.sw,
                                            Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    width: 0.15.sw,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 0.32.sw,
                                    lineHeight: 8.0,
                                    percent: 0.5,
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  Text(
                                    '50',
                                    style: customizeTextStyle(
                                        FontWeight.w800, 0.04.sw, Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              SizedBox(
                                height: 0.015.sh,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Poor',
                                        style: customizeTextStyle(
                                            FontWeight.w800,
                                            0.04.sw,
                                            Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    width: 0.15.sw,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 0.32.sw,
                                    lineHeight: 8.0,
                                    percent: 0.3,
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  Text(
                                    '3',
                                    style: customizeTextStyle(
                                        FontWeight.w800, 0.04.sw, Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              SizedBox(
                                height: 0.015.sh,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Terrible',
                                        style: customizeTextStyle(
                                            FontWeight.w800,
                                            0.04.sw,
                                            Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    width: 0.15.sw,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 0.32.sw,
                                    lineHeight: 8.0,
                                    percent: 0.0,
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  Text(
                                    '0',
                                    style: customizeTextStyle(
                                        FontWeight.w800, 0.04.sw, Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 0.001.sh,
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 0.03.sw,
                  ),
                  CircleAvatar(
                      backgroundColor: grayColor,
                      radius: 0.06.sw,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 0.07.sw,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://crop-circle.imageonline.co/crop-circle.png",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )),
                  SizedBox(
                    width: 0.03.sw,
                  ),
                  Column(
                    children: [
                      Text(
                        "Liza rayan",
                        style:
                            customizeTextStyle(FontWeight.w800, 0.05.sw, black),
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Text(
                        "20/04/20",
                        style:
                            customizeTextStyle(FontWeight.w500, 0.04.sw, black),
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 0.05.sw,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Divider(
                        thickness: 0.001.sh,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
