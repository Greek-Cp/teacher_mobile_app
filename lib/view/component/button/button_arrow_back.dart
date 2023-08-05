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
  ButtonBackArrow({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Card(
          color: ListColor.backgroundBack,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: size.sizeBorderBlackGlobal, color: Colors.black),
              borderRadius: BorderRadius.circular(30.r)),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SvgPicture.asset(
              "assets/icon/ic_back.svg",
              width: 13.w,
              height: 13.h,
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
      padding: EdgeInsets.only(top: 5.h),
      child: Card(
        color: ListColor.colorBackgroundConfirmToSaveChanges,
        child: Padding(
          padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10, right: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ComponentTextDescription(
                "confirm_to_save_changes",
                fontSize: size.sizeTextDescriptionGlobal,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r)),
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
