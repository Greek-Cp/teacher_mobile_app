import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/border/border.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';

class ButtonBackArrow extends StatelessWidget {
  final VoidCallback onPressed;
  Color? colorBackgroundButton;
  ButtonBackArrow({required this.onPressed, this.colorBackgroundButton});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Card(
          color: colorBackgroundButton == null
              ? ListColor.backgroundBack
              : colorBackgroundButton,
          shape: CircleBorder(
            side: BorderSide(
                width: size.sizeBorderBlackGlobal, color: Colors.black),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0.h),
            child: SvgPicture.asset(
              "assets/icon/ic_back.svg",
              width: 13.w,
              height: 13.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmToSaveChanges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 2.h, bottom: 5.h),
      child: Card(
        color: ListColor.colorBackgroundConfirmToSaveChanges,
        child: Container(
          height: 50.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 10.h,
              ),
              ComponentTextDescription(
                "confirm_to_save_changes",
                fontSize: size.sizeTextDescriptionGlobal.sp,
              ),
              Card(
                shape: CircleBorder(),
                color: Color.fromARGB(255, 201, 148, 4),
                child: LottieBuilder.asset(
                  "assets/icon/animation_confirm_to_save_changes.json",
                  width: 30.w,
                  height: 25.h,
                ),
              )
            ],
          ),
        ),
        shape: BorderApp.border,
      ),
    );
  }
}
