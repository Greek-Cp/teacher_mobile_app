import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/controller/account_user_controller.dart';
import 'package:teacher_mobile_app/controller/auth_controller.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/button_small.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/button/widget_different_login.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_forgot_password.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_sign_up.dart';
import 'package:teacher_mobile_app/view/page/profile/nav/base_nav_account.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

class PageSignIn extends StatefulWidget {
  static String? routeName = "/PageSignIn";

  @override
  State<PageSignIn> createState() => _PageSignInState();
}

class _PageSignInState extends State<PageSignIn> {
  List<String> _dropdownItems = ['English', 'Arabic'];
  String _selectedItem = 'Option 1'; // Initial selected value
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  String lang = UtilLocalization.checkLocalization.toString();
  final controllerAuth = Get.put(AccountUserController());
  final _formKey = GlobalKey<FormState>();

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
      body: Form(
        key: _formKey,
        child: Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonBackArrow(
                  onPressed: () {
                    Navigator.of(context);
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 310.h,
                      decoration: BoxDecoration(
                        color: Colors
                            .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                        border: Border.all(
                          color:
                              Colors.black, // Warna garis tepi (outline) hitam
                          width: 2.0, // Ketebalan garis tepi
                        ),
                        borderRadius: BorderRadius.circular(
                            30.0.r), // Sudut melengkung sebesar 30 unit
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          ComponentTextTittle(tr("welcome_back")),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextFieldForm(
                            textEditingControllerEmail:
                                textEditingControllerEmail,
                            labelText: "email_adress",
                            hintText: "email_address_hint",
                          ),
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
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  PageForgotPassword.routeName.toString());
                            },
                            child: ComponentTextDescription(
                                tr("forgot_password"),
                                fontWeight: FontWeight.bold,
                                fontSize: size.sizeTextDescriptionGlobal),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 280.h),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: GestureDetector(
                          child: ButtonLongForm(
                            formKey: _formKey,
                            nameButton: "login",
                            onClickButton: () async {
                              final loginResult =
                                  await controllerAuth.loginAccount(
                                      textEditingControllerEmail.text,
                                      textEditingControllerPassword.text);

                              if (loginResult['statusLogin'] == true) {
                                // Login berhasil, lakukan navigasi atau tindakan lain
                                print('Login berhasil');
                                final user = loginResult['user'];
                                print('Informasi pengguna: $user');
                              } else {
                                // Login gagal, berikan umpan balik kepada pengguna
                                print('Login gagal');
                              }
                              Get.toNamed(pageNavBar.routeName.toString());
                            },
                            routeName: pageNavBar.routeName.toString(),
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonLong(
                    nameButton: "create_account",
                    routeName: PageSignUp.routeName.toString()),
                SizedBox(
                  height: 10,
                ),
                ComponentTextDescription(tr("text_or_login"),
                    textAlign: TextAlign.center,
                    fontSize: size.sizeTextHeaderGlobal),
                SizedBox(
                  height: 10,
                ),
                WidgetDifferentLogin(),
                Expanded(child: BottomPageIndicator())
              ],
            ),
          )),
        ),
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
