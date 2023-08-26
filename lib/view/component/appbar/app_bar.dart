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
                  left: size.sizePaddingLeftAndRightPage.h,
                  top: 10.h,
                  right: size.sizePaddingLeftAndRightPage.h),
              child: Image.asset(
                "assets/icon/ic_back.png",
                width: 55.w,
                height: 55.h,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, right: 30.h),
            height: 100.h,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: size.sizeBorderBlackGlobal.h),
                color: ListColor.colorBackgroundConfirmToSaveChanges,
                borderRadius: BorderRadius.circular(30.r)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ComponentTextDescription(
                  tr("confirm_to_save_changes"),
                  fontSize: size.sizeTextDescriptionGlobal.sp,
                  textAlign: TextAlign.right,
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
              ],
            ),
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

class AppBarMainVideo extends StatelessWidget implements PreferredSizeWidget {
  bool _showWidget;
  double opacity;
  AppBarMainVideo(this._showWidget, this.opacity);
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
          SizedBox(
            width: size.sizePaddingLeftAndRightPage.w,
          ),
          _showWidget
              ? AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: _showWidget ? 1.0 : 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 60.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.greenAccent,
                              width: size.sizeBorderBlackGlobal.w),
                          color: Colors.white,
                          shape: BoxShape.circle),
                    ),
                  ),
                )
              : AnimatedOpacity(
                  opacity: _showWidget ? 0.0 : 1.0,
                  duration: Duration(milliseconds: 300),
                  child: ComponentTextDescription(
                    "Hello Yanuar 👋",
                    fontSize: size.sizeTextHeaderGlobal.sp,
                    fontWeight: FontWeight.bold,
                    teksColor: Colors.white,
                  ),
                ),
          SizedBox(
            width: size.sizePaddingLeftAndRightPage.w,
          ),
          Expanded(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _showWidget ? 1.0 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: size.sizeBorderBlackGlobal.h),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 203, 71, 242), // #08F4F9
                        Color.fromARGB(255, 103, 1, 159), // #B988FF
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(30.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ComponentTextDescription(
                      "@Username",
                      teksColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.sizeTextDescriptionGlobal - 1,
                      textAlign: TextAlign.left,
                    ),
                    ComponentTextDescription(
                      "Firstname Lastname",
                      teksColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.sizeTextDescriptionGlobal - 2,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.sizePaddingLeftAndRightPage.w,
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _showWidget ? 1.0 : 1.0,
            child: Container(
              padding: EdgeInsets.only(right: 10.h, left: 10.h),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 139, 139, 139).withOpacity(0.3)),
              child: Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            width: size.sizePaddingLeftAndRightPage.h,
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

class AppBarPageVideo extends StatelessWidget implements PreferredSizeWidget {
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
            child: Column(
              children: [
                ButtonBackArrow(
                  onPressed: () {},
                ),
                ComponentTextDescription(
                  "Next",
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  teksColor: Colors.black,
                  fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: size.sizeBorderBlackGlobal),
                  color: ListColor.colorBackgroundCardNewVideo,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(8.0.h),
                child: ComponentTextDescription(
                  "new_video",
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  teksColor: ListColor.colorFontPageNav,
                  fontSize: size.sizeTextDescriptionGlobal.sp,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Column(
              children: [
                Transform.rotate(
                  angle: 180 * (3.141592653589793238 / 180),
                  child: ButtonBackArrow(
                    onPressed: () {},
                  ),
                ),
                ComponentTextDescription(
                  "Next",
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  teksColor: Colors.black,
                  fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                ),
              ],
            ),
          ),
        ],
        leading: Container(),
        // Other properties of the AppBar if needed
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.h);
}
