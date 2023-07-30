import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/page/page_sign_up.dart';

class PageLoginArea extends StatefulWidget {
  static String? routeName = "/PageLoginArea";

  @override
  State<PageLoginArea> createState() => _PageLoginAreaState();
}

class _PageLoginAreaState extends State<PageLoginArea> {
  List<String> _dropdownItems = ['English', 'Arabic'];
  String _selectedItem = 'Option 1'; // Initial selected value
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

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
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Image.asset(
                            "assets/icon/ic_back.png",
                            width: 50.w,
                            height: 50.h,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors
                                .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                            border: Border.all(
                              color: Colors
                                  .black, // Warna garis tepi (outline) hitam
                              width: 2.0, // Ketebalan garis tepi
                            ),
                            borderRadius: BorderRadius.circular(
                                30.0.r), // Sudut melengkung sebesar 30 unit
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  ComponentTextTittle(tr("welcome_back")),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  TextField(
                                    controller: textEditingControllerEmail,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                        filled: true,
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            backgroundColor: Colors.white),
                                        fillColor: Colors.white,
                                        labelText: tr("email_adress"),
                                        hintText: tr("email_adress_hint"),
                                        contentPadding: EdgeInsets.all(15.h),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: textEditingControllerEmail
                                                    .text.isEmpty
                                                ? Lottie.asset(
                                                    "assets/icon/animation_wrong.json",
                                                    width: 3.w,
                                                    height: 3.h,
                                                    fit: BoxFit.cover,
                                                    repeat: false)
                                                : Lottie.asset(
                                                    "assets/icon/animation_succes.json",
                                                    width: 3.w,
                                                    height: 3.h,
                                                    fit: BoxFit.cover,
                                                    repeat: false),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  TextField(
                                    controller: textEditingControllerPassword,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            backgroundColor: Colors.white),
                                        fillColor: Colors.white,
                                        labelText: tr("password"),
                                        hintText: tr("password_hint"),
                                        contentPadding: EdgeInsets.all(15.h),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: textEditingControllerPassword
                                                    .text.isEmpty
                                                ? Lottie.asset(
                                                    "assets/icon/animation_wrong.json",
                                                    width: 3.w,
                                                    height: 3.h,
                                                    fit: BoxFit.cover,
                                                    animate: true,
                                                    repeat: false)
                                                : Lottie.asset(
                                                    "assets/icon/animation_succes.json",
                                                    width: 3.w,
                                                    animate: true,
                                                    height: 3.h,
                                                    fit: BoxFit.cover,
                                                    repeat: false),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  ComponentTextDescription(
                                      tr("forgot_password")),
                                  SizedBox(
                                    height: 60.h,
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 290.h),
                          child: Center(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.r),
                                            side: BorderSide(
                                                width: 1,
                                                color: Colors.black))),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 63, 254, 202))),
                                onPressed: () {
                                  if (textEditingControllerEmail.text.isEmpty ||
                                      textEditingControllerPassword
                                          .text.isEmpty) {
                                    Get.snackbar(
                                        "Notification", "Please Fill The Form");
                                  } else {
                                    Get.snackbar(
                                        "Notification", "Login Succes");
                                  }
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 70.h,
                                        right: 70.h,
                                        top: 10.h,
                                        bottom: 10.h),
                                    child:
                                        ComponentTextDescription(tr("login")))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStatePropertyAll(Size.fromHeight(55.h)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                    side: BorderSide(
                                        width: 1, color: Colors.black))),
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 63, 254, 202))),
                        onPressed: () {
                          Get.toNamed(PageSignUp.routeName.toString());
                        },
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 30.h,
                                right: 30.h,
                                top: 10.h,
                                bottom: 10.h),
                            child: ComponentTextDescription(
                                tr("create_account")))),
                    SizedBox(
                      height: 20.h,
                    ),
                    ComponentTextDescription(
                      tr("text_or_login"),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
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
                              side: BorderSide(color: Colors.black, width: 1),
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
                              side: BorderSide(color: Colors.black, width: 1),
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
                    ),
                    SizedBox(
                      height: 120.h,
                    )
                  ],
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}
