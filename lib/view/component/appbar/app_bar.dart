import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';

class AppBarGlobal extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: AppBar(
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Remove shadow under the AppBar
        flexibleSpace: ClipRect(
          // Clip the background to avoid blur overflow
          child: BackdropFilter(
            // Add blur effect to the background

            filter: ImageFilter.blur(
                sigmaX: 12,
                sigmaY:
                    12), // Adjust the sigma values for the desired blur intensity
            child: Container(
              color: Colors.white
                  .withOpacity(0.2), // Adjust the opacity of the blur effect
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: size.sizePaddingLeftAndRightPage.w,
          ),
          ButtonBackArrow(
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Navigate back when the arrow is pressed
            },
          ),
          Expanded(
            child: Container(),
          ),
          ConfirmToSaveChanges(),
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
  Size get preferredSize => Size.fromHeight(90.h);
}
