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

class CardButtonLong extends StatelessWidget {
  final String nameButton;
  final String routeName;
  final Color colorButton;
  final FontWeight fontWeight;
  final Color colorFont;
  final TextAlign textAlign;
  RoundedRectangleBorder? borderShape;

  CardButtonLong({
    required this.nameButton,
    required this.routeName,
    required this.colorButton,
    required this.fontWeight,
    required this.colorFont,
    this.borderShape,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorButton,
      elevation: 4.0, // Elevation card
      shape: borderShape == null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
              side: BorderSide(
                width: size.sizeBorderBlackGlobal,
                color: Colors.black,
              ),
            )
          : borderShape,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Center(
            child: ComponentTextDescription(
              tr("$nameButton"),
              teksColor: colorFont,
              fontSize: size.sizeTextDescriptionGlobal.sp,
              fontWeight: fontWeight,
              textAlign: textAlign,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonLongHeader extends StatelessWidget {
  String nameButton;
  String routeName;
  Color colorButton;
  FontWeight fontWeight;
  Color colorFont;
  TextAlign textAlign;

  ButtonLongHeader(
      {required this.nameButton,
      required this.routeName,
      required this.colorButton,
      required this.fontWeight,
      required this.colorFont,
      this.textAlign = TextAlign.start});

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
              textAlign: textAlign,
            )));
  }
}
