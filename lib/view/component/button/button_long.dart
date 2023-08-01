import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';

class ButtonLong extends StatelessWidget {
  String nameButton;
  String routeName;
  ButtonLong({required this.nameButton, required this.routeName});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size.fromHeight(55.h)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
                side: BorderSide(
                    width: size.sizeBorderBlackGlobal, color: Colors.black))),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 63, 254, 202))),
        onPressed: () => {Get.toNamed(this.routeName.toString())},
        child: Padding(
            padding: EdgeInsets.only(
                left: 30.h, right: 30.h, top: 10.h, bottom: 10.h),
            child: ComponentTextDescription(
              tr("$nameButton"),
              fontSize: size.textButton + 5,
            )));
  }
}

class ButtonLongHeader extends StatelessWidget {
  String nameButton;
  String routeName;
  Color colorButton;
  FontWeight fontWeight;
  Color colorFont;

  ButtonLongHeader(
      {required this.nameButton,
      required this.routeName,
      required this.colorButton,
      required this.fontWeight,
      required this.colorFont});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size.fromHeight(55.h)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
                side: BorderSide(
                    width: size.sizeBorderBlackGlobal, color: Colors.black))),
            backgroundColor: MaterialStatePropertyAll(colorButton)),
        onPressed: () => {Get.toNamed(this.routeName.toString())},
        child: Padding(
            padding: EdgeInsets.only(
                left: 30.h, right: 30.h, top: 10.h, bottom: 10.h),
            child: ComponentTextDescription(
              tr("$nameButton"),
              teksColor: colorFont,
              fontSize: size.textButton + 5,
              fontWeight: fontWeight,
              
            )));
  }
}
