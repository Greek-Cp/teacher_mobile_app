import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.h, right: 15.h),
                  child: Image.asset(
                    "assets/img/img_intersection_1.png",
                    width: double.infinity,
                    height: 300.sp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PopupMenuButton(
                    child: TextField(
                      controller: textEditingControllerChooseLanguage,
                      enabled: false,
                      decoration: InputDecoration(
                          filled: true,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor:
                                  Color.fromRGBO(63, 239, 254, 1.0)),
                          fillColor: Color.fromRGBO(63, 239, 254, 1.0),
                          labelText: labelText,
                          contentPadding: EdgeInsets.all(15.h),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Image.asset(
                                "assets/icon/ic_drop_down_chose.png",
                                width: 3.w,
                                height: 3.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                    ),
                    onSelected: (value) {
                      print("value $value");
                      if (value == "/en") {
                        setState(() {
                          textEditingControllerChooseLanguage.text = "English";
                          EasyLocalization.of(context)!
                              .setLocale(Locale("en", "US"));
                          Get.updateLocale(Locale("en", "US"));
                        });
                      } else if (value == "/ar") {
                        setState(() {
                          textEditingControllerChooseLanguage.text = "Arabic";

                          EasyLocalization.of(context)!
                              .setLocale(Locale("ar", "AR"));
                          Get.updateLocale(Locale("ar", "AR"));
                        });
                      }
                    },
                    itemBuilder: (BuildContext bc) {
                      return [
                        PopupMenuItem(
                          child: Text("English"),
                          value: '/en',
                          onTap: () {
                            setState(() {
                              textEditingControllerChooseLanguage.text =
                                  "English";
                              EasyLocalization.of(context)!
                                  .setLocale(Locale("en", "US"));
                            });
                          },
                        ),
                        PopupMenuItem(
                          child: Text("Arab"),
                          value: '/ar',
                          onTap: () {
                            setState(() {
                              textEditingControllerChooseLanguage.text =
                                  "English";
                              EasyLocalization.of(context)!
                                  .setLocale(Locale("ar", "AR"));
                            });
                          },
                        ),
                      ];
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            side: BorderSide(width: 1, color: Colors.black))),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 63, 254, 202))),
                    onPressed: () {
                      Get.toNamed(PageLogin.routeName.toString());
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 30.h, right: 30.h, top: 10.h, bottom: 10.h),
                        child: ComponentTextDescription(tr("next"))))
              ],
            )),
          ),
        );
      },
    );
  }
}
