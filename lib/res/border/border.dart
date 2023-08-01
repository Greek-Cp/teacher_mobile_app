import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';

class BorderApp {
  static dynamic border = RoundedRectangleBorder(
      side: BorderSide(width: size.sizeBorderBlackGlobal, color: Colors.black),
      borderRadius: BorderRadius.circular(30.r));
}
