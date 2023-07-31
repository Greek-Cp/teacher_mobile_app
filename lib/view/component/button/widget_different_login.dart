import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';

class WidgetDifferentLogin extends StatelessWidget {
  const WidgetDifferentLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black, width: size.sizeBorderBlackGlobal),
              borderRadius: BorderRadius.circular(30.r)),
          child: Padding(
            padding: EdgeInsets.all(18.0.h),
            child: Image.asset(
              "assets/icon/facebook.png",
              width: 20.w,
              height: 20.h,
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black, width: size.sizeBorderBlackGlobal),
              borderRadius: BorderRadius.circular(30.r)),
          child: Padding(
            padding: EdgeInsets.all(18.0.h),
            child: Image.asset(
              "assets/icon/search.png",
              width: 20.w,
              height: 20.h,
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black, width: size.sizeBorderBlackGlobal),
              borderRadius: BorderRadius.circular(30.r)),
          child: Padding(
            padding: EdgeInsets.all(18.0.h),
            child: Image.asset(
              "assets/icon/apple.png",
              width: 20.w,
              height: 20.h,
            ),
          ),
        ),
      ],
    );
  }
}
