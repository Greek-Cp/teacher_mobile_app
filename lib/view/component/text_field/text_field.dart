import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';

import '../../../res/colors/list_color.dart';

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
                margin: EdgeInsets.only(left: 20.w),
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

  bool isEmpty = true;

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
            child: TextField(
              controller: widget.textEditingControllerEmail,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    isEmpty = false;
                  });
                } else {
                  setState(() {
                    isEmpty = true;
                  });
                }
              },
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
                    Container(
                      margin: EdgeInsets.only(left: 10.h),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (passwordHidden == true) {
                              passwordHidden = false;
                            } else {
                              passwordHidden = true;
                            }
                          });
                        },
                        child: Icon(
                          passwordHidden
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    this.isEmpty
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(right: 10.h),
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
                margin: EdgeInsets.only(left: 20.w),
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
