import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class pageName extends StatelessWidget {
  static String? routeName = "/pageName";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(child: Column()),
        );
      },
    );
  }
}
