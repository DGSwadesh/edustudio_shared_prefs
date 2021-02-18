import 'package:edustudio/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  List<String> litems = ["1", "2", "Third", "4"];
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("My Subscriptions"),
        actions: [
          Icon(
            Icons.add,
            size: 26.0,
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          SizedBox(
                            height: 0.12.sh,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(1),
                              //
                              //     ),
                              color: Colors.blue,
                              // height: 0.1.sh,
                              // width: 0.9.sw,
                              child: Padding(
                                padding: EdgeInsets.all(0.01.sw),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.school,
                                          size: 26.0,
                                          color: white,
                                        ),
                                        SizedBox(
                                          width: 0.045.sw,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 0.02.sh,
                                            ),
                                            Text(
                                              "Education App",
                                              style: customizeTextStyle(
                                                  FontWeight.w700,
                                                  0.05.sw,
                                                  white),
                                            ),
                                            Text(
                                              "PREMIUM",
                                              style: customizeTextStyle(
                                                  FontWeight.w500,
                                                  0.04.sw,
                                                  white),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   width: 0.4.sw,
                                    // ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // SizedBox(
                                        //   height: 0.02.sh,
                                        // ),
                                        Text(
                                          "\$ 3.3",
                                          style: customizeTextStyle(
                                              FontWeight.w500, 0.04.sw, white),
                                        ),
                                        Text(
                                          "1 week",
                                          style: customizeTextStyle(
                                              FontWeight.w500, 0.03.sw, white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Material(
              elevation: 14.0,
              /* */
              child: Padding(
                padding: EdgeInsets.only(
                    left: _width * 0.03,
                    right: _width * 0.03,
                    bottom: _height * 0.04,
                    top: _height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'price',
                          style: customizeTextStyle(
                              FontWeight.w500, 0.05.sw, Colors.black),
                        ),
                        Text(
                          '\$ 56',
                          style: customizeTextStyle(
                              FontWeight.w500, 0.05.sw, Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: _height * 0.07,
                      width: _width * 0.6,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // color: AddToCartButton,
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => CartPage()),
                          // );
                        },
                        child: Text(
                          'Add To Cart',
                          // style: customizeTextStyle(
                          //     mediumTextWeight, 18.0, Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
