import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/button_small.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_sign_in.dart';

class PageSignUp extends StatefulWidget {
  static String? routeName = "/PageSignUp";

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

class _PageSignUpState extends State<PageSignUp> {
  TextEditingController textEditingControllerFirstName =
      TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  String? lang;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    lang = UtilLocalization.checkLocalization(context).toString();
    print("lang $lang");
    if (lang == "AR") {
      print("arab");
    } else {
      print("engl");
    }

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
          padding: EdgeInsets.all(size.sizePaddingLeftAndRightPage),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtonBackArrow(
                onPressed: () {},
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors
                          .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                      border: Border.all(
                        color: Colors.black, // Warna garis tepi (outline) hitam
                        width: 2.0, // Ketebalan garis tepi
                      ),
                      borderRadius: BorderRadius.circular(
                          30.0.r), // Sudut melengkung sebesar 30 unit
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        ComponentTextTittle(tr("create_account")),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextFieldForm(
                            textEditingControllerEmail:
                                textEditingControllerFirstName,
                            hintText: "first_name",
                            labelText: "first_name"),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldForm(
                            textEditingControllerEmail:
                                textEditingControllerFirstName,
                            hintText: "last_name",
                            labelText: "last_name"),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFieldForm(
                            textEditingControllerEmail:
                                textEditingControllerFirstName,
                            labelText: "email_adress",
                            hintText: "email_address_hint"),
                        SizedBox(
                          height: 15.h,
                        ),
                        lang == "AR"
                            ? TextFieldPasswordFormArabic(
                                textEditingControllerEmail:
                                    textEditingControllerPassword,
                                labelText: "password",
                                hintText: "password_hint",
                              )
                            : TextFieldPasswordForm(
                                textEditingControllerEmail:
                                    textEditingControllerPassword,
                                labelText: "password",
                                hintText: "password_hint",
                              ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 410.h, bottom: 75.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Center(
                        child: ButtonLong(
                            nameButton: "sign_up",
                            routeName: PageSignIn.routeName.toString())),
                  ),
                ],
              ),
              Expanded(
                child: BottomPageIndicator(),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class BottomPageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15.w,
          height: 13.h,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: size.sizeBorderBlackGlobal),
              color: ListColor.cyanColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 15.w,
          height: 13.h,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: size.sizeBorderBlackGlobal),
              color: ListColor.colorTextFieldBackground,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 40.w,
          height: 13.h,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: size.sizeBorderBlackGlobal),
              color: ListColor.colorPurple,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        )
      ],
    );
  }
}
