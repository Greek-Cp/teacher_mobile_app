import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/border/border.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';

class AppBarGlobal extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.h, left: 0.h),
      child: AppBar(
        forceMaterialTransparency: true,
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove shadow under the AppBar
        flexibleSpace: ClipRect(
          // Clip the background to avoid blur overflow
          child: BackdropFilter(
            // Add blur effect to the background

            filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY:
                    5), // Adjust the sigma values for the desired blur intensity
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black
                  .withOpacity(0.07), // Adjust the opacity of the blur effect
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: size.sizePaddingLeftAndRightPage.h, top: 10.h),
              child: Image.asset(
                "assets/icon/ic_back.png",
                width: 55.w,
                height: 55.h,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            margin: EdgeInsets.only(
              left: size.sizePaddingLeftAndRightPage.h,
              top: 10.h,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: size.sizeBorderBlackGlobal.h),
                color: ListColor.colorBackgroundConfirmToSaveChanges,
                borderRadius: BorderRadius.circular(30.r)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20.h,
                ),
                ComponentTextDescription(
                  tr("confirm_to_save_changes"),
                  fontSize: size.sizeTextDescriptionGlobal.sp,
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  width: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 201, 148, 4),
                      shape: BoxShape.circle),
                  child: LottieBuilder.asset(
                    "assets/icon/animation_confirm_to_save_changes.json",
                    width: 30.w,
                    height: 25.h,
                  ),
                ),
                SizedBox(
                  width: 20.h,
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.sizePaddingLeftAndRightPage.w,
          ),
        ],
        leading: Container(),
        // Other properties of the AppBar if needed
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
