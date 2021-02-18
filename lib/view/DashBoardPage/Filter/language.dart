import 'package:edustudio/Controller/filter_controller.dart';
import 'package:edustudio/Widget/LoginWidget.dart';
import 'package:edustudio/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Language extends StatefulWidget {
  var languageController;
  Language(this.languageController);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    // print('dg language');
    // print(widget.languageController.listOfLang.length);
    return Container(
        child: Obx(() => ListView.separated(
              itemCount: widget.languageController.listOfLang.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: 0.006.sw,
              ),
              itemBuilder: (BuildContext context, int index) {
                //
                // print(widget.languageController.listOflang[index].langName);
                // print('dg1 language');
                //
                return CheckboxListTile(
                  activeColor: Colors.indigo,
                  title: Text(
                    widget.languageController.listOfLang[index].langName,
                    style: customizeTextStyle(
                        FontWeight.w500, 0.05.sw, Colors.black),
                  ),
                  value: widget.languageController.listOfLang[index].isSelected,
                  onChanged: (value) {
                    widget.languageController.langToggleSelection(index);
                    // if(value){
                    //   _filterController.listOfLang.add(
                    //     widget.languageController.listOflang[index].id);
                    // }else{
                    //   // _filterController.listOfLang.indexWhere((element) => false)
                    // }
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            )));
  }
}
