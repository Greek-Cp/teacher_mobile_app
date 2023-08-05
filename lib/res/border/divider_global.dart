import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';

class DividerGlobal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
        child: Divider(
          color: Colors.black,
          height: 3.h,
          thickness: size.sizeThicknessDivider.h,
        ));
  }
}
