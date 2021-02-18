import 'package:edustudio/Controller/parentController.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/services/Networkcall.dart';
import 'package:edustudio/view/DashBoardPage/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParentProfile extends StatefulWidget {
  @override
  _ParentProfileState createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  var dobController = TextEditingController();
  var educationController = TextEditingController();
  var altMobileController = TextEditingController();
  var add1Controller = TextEditingController();
  var add2Controller = TextEditingController();
  var zipController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var isLoading = false;

  ParentController parentController = Get.put(ParentController());

  @override
  void initState() {
    parentController.fetchCountryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Text('Parent Profile'),
          centerTitle: true,
        ),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SigninSignUpWidget().customTextField(
                                // height: _height,
                                icon: Icons.vpn_key_outlined,
                                hintText: 'DOB *',
                                controller: dobController,
                                color: white,
                                borderColor: white,
                                validationFunction: (value) {
                                  if (value.isEmpty) {
                                    return "Enter proper DOB ";
                                  } else if (value.trim().isEmpty) {
                                    return "Enter proper DOB ";
                                  }
                                }),
                            SigninSignUpWidget().customTextField(
                                // height: _height,
                                icon: Icons.vpn_key_outlined,
                                hintText: 'Education *',
                                controller: educationController,
                                color: white,
                                borderColor: white,
                                validationFunction: (value) {
                                  if (value.isEmpty) {
                                    return "Enter Education field ";
                                  } else if (value.trim().isEmpty) {
                                    return "Enter Education field";
                                  }
                                }),
                            //       SigninSignUpWidget().customTextField(
                            //         // height: _height,
                            //         icon: Icons.vpn_key_outlined,
                            //         hintText: 'Alternative Mobile Number',
                            //         controller: altMobileController,
                            //   child: SigninSignUpWidget().customTextField(
                            //     // height: _height,
                            //     icon: Icons.vpn_key_outlined,
                            //     hintText: 'Address2',
                            //     controller: add2Controller,
                            //     color: white,
                            //     borderColor: white,
                            //     // validationFunction: (value) {
                            //     //   if (value.isEmpty) {
                            //     //     return "Enter Valid Full Name ";
                            //     //   } else if (value.trim().isEmpty) {
                            //     //     return "Enter Valid Full Name ";
                            //     //   }
                            //     // }
                            //   ),
                            // ),

                            // Padding(
                            //                                 padding:
                            //                                     const EdgeInsets.all(15.0),
                            //                                 child:
                            //                                     DropdownButtonHideUnderline(
                            //                                   child: DropdownButton<
                            //                                       DataOfCountryModel>(
                            //                                     value: parentController
                            //                                         .selectedDifaultCountry,
                            //                                     icon: Icon(
                            //                                       Icons
                            //                                           .arrow_drop_down_outlined,
                            //                                       size: 0.07.sw,
                            //                                     ),
                            //                                     //iconSize: 0.015.sh,
                            //                                     // elevation: 16,
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                             Colors.deepPurple),
                            //                                     underline: Container(
                            //                                       height: 0.05.sh,
                            //                                       color: Colors
                            //                                           .deepPurpleAccent,
                            //                                     ),
                            //                                     onChanged: (newValue) {
                            //                                       parentController
                            //                                           .setDefaultAddress(
                            //                                               newValue);
                            //                                       setState(() {});
                            //                                     },
                            //                                     items: parentController
                            //                                         .checkoutDetails
                            //                                         .value
                            //                                         .addresslist
                            //                                         .map<
                            //                                                 DropdownMenuItem<
                            //                                                     AddedAddressList>>(
                            //                                             (AddedAddressList
                            //                                                 value) {
                            //                                       return DropdownMenuItem<
                            //                                           AddedAddressList>(
                            //                                         value: value,
                            //                                         child: Text(
                            //                                           'Address - ${value.address1},${value.address2},Street - ${value.street},\nCity - ${value.city},Pin - ${value.pin}',
                            //                                           style: TextStyle(
                            //                                               fontWeight:
                            //                                                   FontWeight
                            //                                                       .bold,
                            //                                               color: Colors
                            //                                                   .black45),
                            //                                         ),
                            //                                       );
                            //                                     }).toList(),
                            //                                   ),
                            //                                 ),
                            //                               ),

                            SizedBox(
                              height: 0.03.sh,
                            ),

                            Container(
                                height: 0.08.sh,
                                width: 0.8.sw,
                                //    color: Colors.blue,
                                decoration: BoxDecoration(
                                  //   color: const Color(0xff7c94b6),
                                  border: Border.all(
                                    color: white,
                                    // borderColor: white,
                                    // validationFunction: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "Enter Valid Alternative Mobile Number ";
                                    //   } else if (value.trim().isEmpty) {
                                    //     return "Enter Valid Alternative Mobile Number ";
                                    //   }
                                    // }
                                  ),
                                )),
                            SigninSignUpWidget().customTextField(
                                // height: _height,
                                icon: Icons.vpn_key_outlined,
                                hintText: 'Address 1 *',
                                controller: add1Controller,
                                color: white,
                                borderColor: white,
                                validationFunction: (value) {
                                  if (value.isEmpty) {
                                    return "Enter your address";
                                  } else if (value.trim().isEmpty) {
                                    return "Enter your address ";
                                  }
                                }),
                            SigninSignUpWidget().customTextField(
                              // height: _height,
                              icon: Icons.vpn_key_outlined,
                              hintText: 'Address2',
                              controller: add2Controller,
                              color: white,
                              borderColor: white,
                              // validationFunction: (value) {
                              //   if (value.isEmpty) {
                              //     return "Enter Valid Full Name ";
                              //   } else if (value.trim().isEmpty) {
                              //     return "Enter Valid Full Name ";
                              //   }
                              // }
                            ),
                            SizedBox(
                              height: 0.03.sh,
                            ),
                            Container(
                                height: 0.08.sh,
                                width: 0.8.sw,
                                //    color: Colors.blue,
                                decoration: BoxDecoration(
                                  //   color: const Color(0xff7c94b6),
                                  border: Border.all(
                                    color: white,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: parentController.listOfCountry.length > 0
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            // isExpanded: true,
                                            hint: Text('select your country *',
                                                style: TextStyle(
                                                  color: white,
                                                )),
                                            value: parentController
                                                .selectedCountry,
                                            icon: Icon(
                                              Icons.arrow_drop_down_outlined,
                                              size: 0.07.sw,
                                              color: white,
                                            ),
                                            style: TextStyle(color: white),
                                            items: parentController
                                                .listOfCountry
                                                .map((value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value.name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: black),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              parentController
                                                  .setDefaultCountry(newValue);
                                              parentController.fetchStateList(
                                                  parentController
                                                      .selectedCountry
                                                      .id);
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      )
                                    : Container()),
                            SizedBox(
                              height: 0.03.sh,
                            ),
                            Container(
                                height: 0.08.sh,
                                width: 0.8.sw,
                                decoration: BoxDecoration(
                                  //   color: const Color(0xff7c94b6),
                                  border: Border.all(
                                    color: white,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: parentController.listOfCountry.length > 0
                                    ? Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            // isExpanded: true,
                                            dropdownColor: backgroundColor,
                                            hint: Text('select your State *',
                                                style: TextStyle(
                                                  color: white,
                                                )),
                                            value: parentController.selectedState,
                                            icon: Icon(
                                              Icons.arrow_drop_down_outlined,
                                              size: 0.07.sw,
                                              color: white,
                                            ),
                                            style: TextStyle(color: white),
                                            items: parentController.listOfState
                                                .map((value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value.name,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: white),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              parentController
                                                  .setDefaultState(newValue);
                                              parentController.fetchCityList(
                                                  parentController.selectedState.id);
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      )
                                    : Container()),
                            SizedBox(
                              height: 0.05.sh,
                            ),
                            // Container(
                            //     height: 0.08.sh,
                            //     width: 0.8.sw,
                            //     decoration: BoxDecoration(
                            //       //   color: const Color(0xff7c94b6),
                            //       border: Border.all(
                            //         color: white,
                            //         width: 1,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12),
                            //     ),
                            //     child: parentController.listOfCountry.length > 0
                            //         ? Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: DropdownButtonHideUnderline(
                            //               child: DropdownButton(
                            //                 // isExpanded: true,
                            //                 // dropdownColor: backgroundColor,
                            //                 hint: Text('select your City *',
                            //                     style: TextStyle(
                            //                       color: white,
                            //                     )),
                            //                 value:
                            //                     parentController.selectedCity,
                            //                 icon: Icon(
                            //                   Icons.arrow_drop_down_outlined,
                            //                   size: 0.07.sw,
                            //                   color: white,
                            //                 ),
                            //                 style: TextStyle(color: white),
                            //                 items: parentController.listOfCity
                            //                     .map((value) {
                            //                   return DropdownMenuItem(
                            //                     value: value,
                            //                     child: Text(
                            //                       value.name,
                            //                       style: TextStyle(
                            //                           fontWeight:
                            //                               FontWeight.bold,
                            //                           color: white),
                            //                     ),
                            //                   );
                            //                 }).toList(),
                            //                 onChanged: (newValue) {
                            //                   parentController
                            //                       .setDefaultCity(newValue);
                            //                   setState(() {});
                            //                 },
                            //               ),
                            //             ),
                            //           )
                            //         : Container()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SigninSignUpWidget().customTextField(
                                  // height: _height,
                                  icon: Icons.vpn_key_outlined,
                                  hintText: 'ZIP Code *',
                                  controller: zipController,
                                  color: white,
                                  borderColor: white,
                                  validationFunction: (value) {
                                    if (value.isEmpty) {
                                      return "Enter ZIP ";
                                    } else if (value.trim().isEmpty) {
                                      return "Enter ZIP ";
                                    }
                                  }),
                            ),
                            SizedBox(
                              height: 0.05.sh,
                            ),
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  parentProfile(
                                    dob: dobController.text.trim(),
                                    education: educationController.text,
                                    // alt_mobile: altMobileController.text,
                                    address_line1: add1Controller.text,
                                    // address_line2: add2Controller.text.trim(),
                                    zip: zipController.text.trim(),
                                  );
                                }
                              },
                              child: SigninSignUpWidget().getLoginSignupButton(
                                  width: 0.1.sw, text: 'SUBMIT'),
                            ),
                          ])))),
        ),
      ),
    );
  }

  Future<void> parentProfile(
      {dob,
      education,
      alt_mobile,
      address_line1,
      address_line2,
      zip,
      country,
      city,
      state}) async {
    // print('dg3');
    setState(() {
      isLoading = true;
    });
    try {
      bool result = await networkcallService.parentRegister2ApiCall(
        dob: dob,
        education: education,
        alt_mobile: alt_mobile,
        address_line1: address_line1,
        address_line2: address_line2,
        country: country,
        state: state,
        city: city,
        zip: zip,
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
      //showToast("successfully Login", Colors.green);
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
}

/*
                                      Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<
                                                      AddedAddressList>(
                                                    value: checkoutController
                                                        .selectedAddress,
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
                                                      size: 0.07.sw,
                                                    ),
                                                    //iconSize: 0.015.sh,
                                                    // elevation: 16,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.deepPurple),
                                                    underline: Container(
                                                      height: 0.05.sh,
                                                      color: Colors
                                                          .deepPurpleAccent,
                                                    ),
                                                    onChanged: (newValue) {
                                                      checkoutController
                                                          .setDefaultAddress(
                                                              newValue);
                                                      setState(() {});
                                                    },
                                                    items: checkoutController
                                                        .checkoutDetails
                                                        .value
                                                        .addresslist
                                                        .map<
                                                                DropdownMenuItem<
                                                                    AddedAddressList>>(
                                                            (AddedAddressList
                                                                value) {
                                                      return DropdownMenuItem<
                                                          AddedAddressList>(
                                                        value: value,
                                                        child: Text(
                                                          'Address - ${value.address1},${value.address2},Street - ${value.street},\nCity - ${value.city},Pin - ${value.pin}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              )
                                           
*/
