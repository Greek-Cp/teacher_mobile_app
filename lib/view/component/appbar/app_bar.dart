import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/border/border.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/font/font_type.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_add_video_category.dart';

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

        toolbarHeight: 100.h,
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
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonBackArrow(
                      onPressed: () {},
                    ),
                  ),
                  Container()
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
              height: 100.h,
              margin: EdgeInsets.only(
                  bottom: 15.h,
                  left: 0.h,
                  top: 10.h,
                  right: size.sizePaddingLeftAndRightPage.h),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: size.sizeBorderBlackGlobal.h),
                  color: ListColor.colorBackgroundConfirmToSaveChanges,
                  borderRadius: BorderRadius.circular(30.r)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ComponentTextDescription(
                      tr("confirm_to_save_changes"),
                      fontSize: size.sizeTextDescriptionGlobal.sp,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
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
              )),
        ],
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
  double opacityContainer;
  AppBarMainVideo(this._showWidget, this.opacity, this.opacityContainer);
  @override
  Widget build(BuildContext context) {
    return Container(
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
          _showWidget
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Opacity(
                    opacity: opacityContainer,
                    child: Container(
                      width: 60.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 117, 251, 103),
                              width: size.sizeBorderBlackGlobal + 3.w),
                          color: Color.fromARGB(255, 48, 93, 131),
                          shape: BoxShape.circle),
                    ),
                  ),
                )
              : Expanded(
                  child: Opacity(
                    opacity: opacity,
                    child: Container(
                        margin: EdgeInsets.only(
                            left: size.sizePaddingLeftAndRightPage.w),
                        child: Text(
                          "Hello Yanuar 👋",
                          style: FontType.font_utama(
                              fontSize: size.sizeTextDescriptionGlobal + 10.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                  ),
                ),
          _showWidget
              ? Expanded(
                  child: Opacity(
                    opacity: opacityContainer,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: size.sizeBorderBlackGlobal.h),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 119, 51, 248), // #08F4F9
                              Color.fromARGB(255, 129, 23, 149), // #B988FF
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
                            fontSize: 10.sp,
                            textAlign: TextAlign.left,
                          ),
                          ComponentTextDescription(
                            "Firstname Lastname",
                            teksColor: Colors.white,
                            fontSize: size.sizeTextDescriptionGlobal - 5.sp,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _showWidget ? 1.0 : 1.0,
            child: Container(
              width: 60.h,
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
        ],
        leading: Container(),
        // Other properties of the AppBar if needed
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}

class AppBarPageVideoSecond extends StatelessWidget
    implements PreferredSizeWidget {
  Color? colorsButtonNext;
  final controller = Get.put<DropdownController>(DropdownController());

  AppBarPageVideoSecond(this.colorsButtonNext);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.h, left: 0.h),
      child: AppBar(
        forceMaterialTransparency: true,
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove shadow under the AppBar

        toolbarHeight: 100.h,
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container()
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  bottom: 25.h, left: 10.w, right: 10.w, top: 5.h),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, width: size.sizeBorderBlackGlobal),
                    color: ListColor.colorBackgroundCardNewVideo,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
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
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              child: Column(
                children: [
                  Transform.rotate(
                    angle: 180 * (3.141592653589793238 / 180),
                    child: ButtonBackArrow(
                      onPressed: () {},
                      colorBackgroundButton: colorsButtonNext,
                    ),
                  ),
                  ComponentTextDescription(
                    "Next",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    teksColor: Colors.white,
                    fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
        // Other properties of the AppBar if needed
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}

class AppBarPageVideo extends StatelessWidget implements PreferredSizeWidget {
  Rx<Color?> colorsButtonNext;
  final controller = Get.put<DropdownController>(DropdownController());
  VoidCallback? onTapVideoRight;
  bool? showButtonLeftOnly;
  AppBarPageVideo(this.colorsButtonNext,
      {this.onTapVideoRight, this.showButtonLeftOnly});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.h, left: 0.h),
      child: AppBar(
        forceMaterialTransparency: true,
        backgroundColor:
            Colors.transparent, // Make thex AppBar background transparent
        elevation: 0, // Remove shadow under the AppBar

        toolbarHeight: 100.h,
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
              //Navigator.of(context).pop();
            },
            child: Column(
              children: [
                ButtonBackArrow(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container()
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  bottom: 25.h, left: 10.w, right: 10.w, top: 5.h),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, width: size.sizeBorderBlackGlobal),
                    color: ListColor.colorBackgroundCardNewVideo,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
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
          ),
          showButtonLeftOnly == true
              ? Container()
              : GestureDetector(
                  onTap: () {
                    onTapVideoRight!();
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Obx(
                          () => Transform.rotate(
                            angle: 180 * (3.141592653589793238 / 180),
                            child: ButtonBackArrow(
                              onPressed: () {
                                onTapVideoRight!();
                              },
                              colorBackgroundButton: colorsButtonNext!.value,
                            ),
                          ),
                        ),
                        ComponentTextDescription(
                          "Next",
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          teksColor: Colors.white,
                          fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
        // Other properties of the AppBar if needed
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
