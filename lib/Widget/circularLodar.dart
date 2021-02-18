import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(34)
        ),
        padding: EdgeInsets.all(10),
        child: CircularProgressIndicator(
            valueColor:
            AlwaysStoppedAnimation<Color>(Colors.white)));
  }

}