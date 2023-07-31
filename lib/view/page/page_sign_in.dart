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
import 'package:teacher_mobile_app/view/component/button/widget_different_login.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/page_sign_up.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonBackArrow(
                    onPressed: () {
                      Navigator.of(context);
                    },
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
                            TextFieldPasswordForm(
                              textEditingControllerEmail:
                                  textEditingControllerPassword,
                              labelText: "password",
                              hintText: "password_hint",
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            ComponentTextDescription(tr("forgot_password"),
                                fontSize: size.sizeTextDescriptionGlobal),
                            SizedBox(
                              height: 30.h,
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 280.h),
                        child: Center(
                            child: ButtonSmall(
                          nameButton: "login",
                          routeName: PageSignIn.routeName.toString(),
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
                    height: 15,
                  ),
                  ComponentTextDescription(tr("text_or_login"),
                      textAlign: TextAlign.center,
                      fontSize: size.sizeTextHeaderGlobal),
                  SizedBox(
                    height: 15,
                  ),
                  WidgetDifferentLogin(),
                  Expanded(child: BottomPageIndicator())
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}

class TextFieldForm extends StatefulWidget {
  TextFieldForm(
      {required this.textEditingControllerEmail,
      required this.hintText,
      required this.labelText});

  final TextEditingController textEditingControllerEmail;
  final String labelText;
  final String hintText;

  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm>
    with SingleTickerProviderStateMixin {
  Widget? animationSucces;

  bool _isValidEmail = true;
  late final AnimationController _controllerLottie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerLottie = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(right: 5),
            child: TextField(
              controller: widget.textEditingControllerEmail,
              onEditingComplete: () {
                _controllerLottie.reset();
                _controllerLottie.forward();

                if (UtilValidatorData.isEmailValid(
                    widget.textEditingControllerEmail.text.toString())) {
                  setState(() {
                    animationSucces = Lottie.asset(
                        "assets/icon/animation_succes.json",
                        width: 20,
                        height: 20,
                        repeat: false,
                        controller: _controllerLottie);
                  });

                  print("Is Email");
                } else {
                  setState(() {
                    animationSucces = Lottie.asset(
                        "assets/icon/animation_wrong.json",
                        width: 30,
                        height: 30,
                        repeat: false,
                        controller: _controllerLottie);
                  });

                  print("Not Email");
                }
              },
              style: TextStyle(fontSize: size.sizeTextDescriptionGlobal.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: tr("${widget.hintText}"),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: animationSucces,
                ),
                hintStyle:
                    TextStyle(fontSize: size.sizeTextDescriptionGlobal.sp),
                contentPadding: EdgeInsets.all(15.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black, // Change the border color here
                    width: size
                        .sizeBorderBlackGlobal, // Change the border width here
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black, // Change the border color here
                    width: size
                        .sizeBorderBlackGlobal, // Change the border width here
                  ),
                ),
              ),
            )),
        Align(
            alignment: Alignment.topLeft,
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.only(left: 10),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: ComponentTextDescription(
                    tr("${widget.labelText}"),
                    fontWeight: FontWeight.bold,
                    fontSize: size.sizeTextDescriptionGlobal,
                  ),
                ))),
      ],
    );
  }
}

class TextFieldPasswordForm extends StatefulWidget {
  TextFieldPasswordForm(
      {required this.textEditingControllerEmail,
      required this.hintText,
      required this.labelText});

  final TextEditingController textEditingControllerEmail;
  final String labelText;
  final String hintText;

  @override
  State<TextFieldPasswordForm> createState() => _TextFieldPasswordFormState();
}

class _TextFieldPasswordFormState extends State<TextFieldPasswordForm>
    with SingleTickerProviderStateMixin {
  Widget? animationSucces;

  bool passwordHidden = true;

  late final AnimationController _controllerLottie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerLottie = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    animationSucces = Lottie.asset("assets/icon/animation_succes.json",
        width: 20, height: 20, repeat: false, controller: _controllerLottie);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(right: 5),
            child: TextField(
              controller: widget.textEditingControllerEmail,
              onEditingComplete: () {
                _controllerLottie.reset();
                _controllerLottie.forward();

                if (UtilValidatorData.isPasswordValid(
                    widget.textEditingControllerEmail.text.toString())) {
                  setState(() {
                    animationSucces = Lottie.asset(
                        "assets/icon/animation_succes.json",
                        width: 30,
                        height: 30,
                        repeat: false,
                        controller: _controllerLottie);
                  });

                  print("Is Email");
                } else {
                  setState(() {
                    animationSucces = Lottie.asset(
                        "assets/icon/animation_wrong.json",
                        width: 30,
                        height: 30,
                        repeat: false,
                        controller: _controllerLottie);
                  });

                  print("Not Email");
                }
              },
              obscureText: passwordHidden,
              style: TextStyle(fontSize: size.sizeTextDescriptionGlobal.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: tr("${widget.hintText}"),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (passwordHidden == true) {
                              passwordHidden = false;
                            } else {
                              passwordHidden = true;
                            }
                          });
                        },
                        icon: passwordHidden
                            ? Icon(
                                Icons.visibility_outlined,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )),
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: animationSucces!)
                  ],
                ),
                hintStyle:
                    TextStyle(fontSize: size.sizeTextDescriptionGlobal.sp),
                contentPadding: EdgeInsets.all(15.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black, // Change the border color here
                    width: size
                        .sizeBorderBlackGlobal, // Change the border width here
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black, // Change the border color here
                    width: size
                        .sizeBorderBlackGlobal, // Change the border width here
                  ),
                ),
              ),
            )),
        Align(
            alignment: Alignment.topLeft,
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.only(left: 10),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: ComponentTextDescription(
                    tr("${widget.labelText}"),
                    fontWeight: FontWeight.bold,
                    fontSize: size.sizeTextDescriptionGlobal,
                  ),
                ))),
      ],
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
