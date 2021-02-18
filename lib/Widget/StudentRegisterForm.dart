import 'package:edustudio/util/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginWidget.dart';

final _formKey = GlobalKey<FormState>();
// final _anotherKey = GlobalKey<FormState>();

TextEditingController _nameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmPasswordController = TextEditingController();

class StudentRegisterForm {

  Widget studentRegisterForm(_height) {
  return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SigninSignUpWidget().customTextField(
                height: _height,
                icon: Icons.account_circle_outlined,
                hintText: 'Name',
                controller: _nameController,
                color: white,
                borderColor: white,
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return "Enter Name ";
                  } else if (value.trim().isEmpty) {
                    return "Enter Name ";
                  }
                }),
          ),
          SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SigninSignUpWidget().customTextField(
                height: _height,
                icon: Icons.call,
                hintText: 'Phone Number',
                controller: _phoneController,
                color: white,
                borderColor: white,
                validationFunction: (value) {
                  // String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                  // RegExp regExp = new RegExp(patttern);
                  if (value.isEmpty || value.trim().isEmpty) {
                    return "Enter Valid Phone Number ";
                  }
                }),
          ),
          SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SigninSignUpWidget().customTextField(
                height: _height,
                icon: Icons.contact_mail,
                hintText: 'Email Id',
                controller: _emailController,
                color: white,
                borderColor: white,
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return "Enter Valid Email id ";
                  } else if (value.trim().isEmpty) {
                    return "Enter Valid Email id ";
                  }
                }),
          ),
          SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SigninSignUpWidget().customTextField(
                height: _height,
                icon: Icons.vpn_key_outlined,
                hintText: 'Password',
                controller: _passwordController,
                color: white,
                borderColor: white,
                validationFunction: (value) {
                  print('dg1');
                  if (value.isEmpty) {
                    return "Enter Valid Password ";
                  } else if (value.trim().isEmpty) {
                    return "Enter Valid Password ";
                  }
                }),
          ),
          SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SigninSignUpWidget().customTextField(
                height: _height,
                icon: Icons.vpn_key_outlined,
                hintText: 'Payment Id',
                controller: _confirmPasswordController,
                color: white,
                borderColor: white,
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return "Entera Payment Id ";
                  } else if (value.trim().isEmpty) {
                    return "Entera Payment Id ";
                  }
                }),
          ),
          SigninSignUpWidget().getHeightSizedBox(_height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SigninSignUpWidget().customTextField(
                height: _height,
                icon: Icons.vpn_key_outlined,
                hintText: 'Payment Note',
                controller: _confirmPasswordController,
                color: white,
                borderColor: white,
                validationFunction: (value) {
                  if (value.isEmpty) {
                    return "Entera note ";
                  } else if (value.trim().isEmpty) {
                    return "Entera note ";
                  }
                }),
          ),
        ],
      ));

}

}

