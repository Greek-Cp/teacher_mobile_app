import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/page/page_login.dart';
import 'package:teacher_mobile_app/view/page/page_login_user.dart';

class PageSelectLogin extends StatefulWidget {
  static String? routeName = "/PageSelectLogin";

  @override
  State<PageSelectLogin> createState() => _PageSelectLoginState();
}

class _PageSelectLoginState extends State<PageSelectLogin> {
  TextEditingController textEditingControllerChooseLanguage =
      TextEditingController();
  String? labelText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    labelText = tr("changeLanguage");
    textEditingControllerChooseLanguage.text = labelText.toString();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF08F4F9), // #08F4F9
                  Color(0xFFB988FF), // #B988FF
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.sizePaddingLeftAndRightPage.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  ImageRounded(
                    "assets/img/img_intersection_1.png",
                    30,
                    width: double.infinity,
                    heigth: 200,
                    borderradius: BorderRadius.circular(20),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ComponentTextDescription("Teach & Earn",
                      fontSize: size.sizeTextHeaderGlobal),
                  SizedBox(
                    height: 10.h,
                  ),
                SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                  side: BorderSide(
                                      width: 1, color: Colors.black))),
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 63, 254, 202))),
                      onPressed: () {
                        Get.toNamed(PageLogin.routeName.toString());
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 30.h, right: 30.h, top: 10.h, bottom: 10.h),
                          child: ComponentTextDescription(
                            tr("next"),
                            fontSize: size.textButton,
                          )))
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}

class ImageRounded extends StatelessWidget {
  String imageAssets;
  int circularRadius;
  double width;
  double heigth;
  BorderRadius borderradius;

  ImageRounded(this.imageAssets, this.circularRadius,
      {required this.width, required this.heigth, required this.borderradius});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderradius,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderradius,
        child: Image.asset(
          imageAssets,
          width: this.width.w,
          height: this.heigth.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
