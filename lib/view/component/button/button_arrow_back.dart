import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';

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
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
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
      ),
    );
  }
}
