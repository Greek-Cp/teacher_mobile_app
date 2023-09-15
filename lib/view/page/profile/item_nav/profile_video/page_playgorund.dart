import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:teacher_mobile_app/controller/account_user_controller.dart';
import 'package:teacher_mobile_app/res/border/divider_global.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/font/font_type.dart';
import 'package:teacher_mobile_app/view/component/appbar/app_bar.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_select_language.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

class PagePlayground extends StatefulWidget {
  static String? routeName = "/PagePlayground";

  @override
  State<PagePlayground> createState() => _PagePlaygroundState();
}

class _PagePlaygroundState extends State<PagePlayground>
    with TickerProviderStateMixin {
  TextEditingController textEditingControllerFirstName =
      TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  String lang = UtilLocalization.checkLocalization.toString();
  TextEditingController textEditingControllerSelectCountry =
      TextEditingController();
  late AnimationController animationControllerSelectLanguage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationControllerSelectLanguage = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);
  }

  bool isCheckedBox = false;
  AccountUserController controllerAccount = Get.find<AccountUserController>();

  TextEditingController textEditingControllerMainLanguage =
      TextEditingController();
  TextEditingController textEditingControllerGrades = TextEditingController();
  TextEditingController textEditingControllerSubject = TextEditingController();
  TextEditingController textEditingControllerTopics = TextEditingController();

  List<Widget> textFields = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag and Drop TextFields'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: Wrap(
              children: textFields,
            ),
          ),
          DraggableTextField(controller: TextEditingController()),
        ],
      ),
    );
  }
}

class TextFieldFormMultiLineDrag extends StatefulWidget {
  TextFieldFormMultiLineDrag(
      {required this.textEditingControllerEmail,
      required this.hintText,
      required this.labelText,
      required this.lengthMax,
      required this.minLines,
      required this.minCharacterHint,
      required this.hintStyle, // Tambahkan parameter hintStyle
      this.showIndicatorMin = true,
      this.showIndicatorMax,
      this.colorBackgroundTextField,
      this.showLatex});

  final TextEditingController textEditingControllerEmail;
  final String labelText;
  final String hintText;
  int lengthMax;
  int minLines;
  int minCharacterHint;
  bool? showIndicatorMin;
  bool? showIndicatorMax;
  bool? showLatex = false;
  Color? colorBackgroundTextField;
  bool? showLatexContainer = false;

  final TextStyle hintStyle; // Tambahkan parameter hintStyle

  @override
  State<TextFieldFormMultiLineDrag> createState() =>
      _TextFieldFormMultiLineDragState();
}

class DraggableTextField extends StatelessWidget {
  final TextEditingController controller;

  DraggableTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: controller.text,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Drag me!',
        ),
      ),
      feedback: Material(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Dragging...',
          ),
        ),
      ),
      childWhenDragging: SizedBox.shrink(),
    );
  }
}

class _TextFieldFormMultiLineDragState extends State<TextFieldFormMultiLineDrag>
    with TickerProviderStateMixin {
  Widget? animationSucces;
  FocusNode? _focusNode;
  bool _isValidEmail = true;
  bool? checkboxLatexClikcked = false;
  late final AnimationController animationRotateIndicatorController;
  late final Animation<double> animationRotateDouble;
  late final AnimationController _controllerLottie;
  int? latexContainer = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = new FocusNode();
    _controllerLottie = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _animationControllerShake = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animationShake =
        Tween(begin: -5.0, end: 5.0).animate(_animationControllerShake)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationControllerShake.reverse();
            }
          });
    animationRotateIndicatorController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);
    animationRotateDouble = Tween<double>(begin: 0, end: 1.0)
        .animate(animationRotateIndicatorController);
    _updateMinValue();
  }

  bool _shouldIncreaseMinOnEnter = true;
  late int _defaultMin = widget.minCharacterHint;
  late int _currentMin = widget.minCharacterHint;
  late final AnimationController _animationControllerShake;
  late final Animation<double> _animationShake;
  void _updateMinValue() {
    setState(() {
      int textLength = widget.textEditingControllerEmail.text.length;
      _currentMin = _defaultMin - textLength;
      if (_currentMin < 0) {
        _currentMin = 0;
      }
    });
  }

  void _increaseMinValueOnEnter() {
    if (_shouldIncreaseMinOnEnter) {
      setState(() {
        int textLength = widget.textEditingControllerEmail.text.length;
        _defaultMin += textLength;
        _currentMin = _defaultMin;
      });
      _shouldIncreaseMinOnEnter = false;
    }
  }

  bool? isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationControllerShake,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            10 * _animationControllerShake.value,
            0.0,
          ),
          child: child,
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.h, bottom: 0.h),
                    child: TextFormField(
                      focusNode: _focusNode,
                      minLines: widget.minLines,
                      maxLength: widget.lengthMax,
                      controller: widget.textEditingControllerEmail,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < widget.minCharacterHint) {
                          setState(() {
                            isEmpty = true;
                            _animationControllerShake.forward();
                          });
                          return null;
                        } else {
                          setState(() {
                            isEmpty = false;
                          });
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _updateMinValue();
                          _shouldIncreaseMinOnEnter = true;
                        });
                      },

                      onFieldSubmitted: (term) {
                        _focusNode!.unfocus();
                      },

                      onEditingComplete: () {
                        if (UtilValidatorData.isEmailValid(widget
                            .textEditingControllerEmail.text
                            .toString())) {
                          setState(() {
                            animationSucces = Lottie.asset(
                              "assets/icon/animation_succes.json",
                              width: 20,
                              height: 20,
                              repeat: false,
                              controller: _controllerLottie,
                            );
                          });

                          print("Is Email");
                        } else {
                          setState(() {
                            animationSucces = Lottie.asset(
                              "assets/icon/animation_wrong.json",
                              width: 30,
                              height: 30,
                              repeat: false,
                              controller: _controllerLottie,
                            );
                          });

                          print("Not Email");
                        }
                      },
                      style: GoogleFonts.nunito(
                          fontSize: size.sizeTextDescriptionGlobal.sp),
                      maxLines: null, // Set this to null for multiline support
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isEmpty == true
                            ? ListColor.colorValidationTextFieldBackgroundEmpty
                            : widget.colorBackgroundTextField == null
                                ? ListColor.colorBackgroundTextFieldAll
                                : widget.colorBackgroundTextField,
                        hintText: tr("${widget.hintText}"),
                        hintStyle: GoogleFonts.nunito(
                            fontSize: size.sizeTextDescriptionGlobal - 1.sp,
                            fontWeight: FontWeight.normal),
                        counterStyle: widget.hintStyle,
                        contentPadding: EdgeInsets.all(15.h),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(size.roundedCircularGlobal),
                          borderSide: BorderSide(
                            color: isEmpty == true
                                ? ListColor.colorOutlineTextFieldWhenEmpty
                                : Colors.black, // Change the border color here
                            width: size
                                .sizeBorderBlackGlobal, // Change the border width here
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(size.roundedCircularGlobal),
                          borderSide: BorderSide(
                            color: isEmpty == true
                                ? ListColor.colorOutlineTextFieldWhenEmpty
                                : Colors.black, // Change the border color here
                            width: size
                                .sizeBorderBlackGlobal, // Change the border width here
                          ),
                        ),
                      ),
                    ),
                  ),
                  checkboxLatexClikcked == true
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            margin: EdgeInsets.only(top: 8.h),
                            height: latexContainer!.h,
                            transform: Matrix4.translationValues(
                              0,
                              -30.h,
                              -2,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: widget.showLatexContainer == true
                                    ? Colors.black
                                    : Colors.transparent,
                                width:
                                    widget.showLatexContainer == true ? 2 : 0,
                              ),
                              color: isEmpty == true
                                  ? ListColor
                                      .colorValidationTextFieldBackgroundEmpty
                                  : ListColor.colorBackgroundTextFieldAll,
                              borderRadius: BorderRadius.circular(
                                  size.roundedCircularGlobal),
                            ),
                            child: TeXView(
                              renderingEngine: TeXViewRenderingEngine.katex(),
                              child: TeXViewColumn(children: [
                                TeXViewInkWell(
                                  id: "id_0",
                                  child: TeXViewColumn(children: [
                                    TeXViewDocument(
                                        widget.textEditingControllerEmail.text,
                                        style: TeXViewStyle(
                                            padding: TeXViewPadding.all(10))),
                                  ]),
                                )
                              ]),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin:
                          EdgeInsets.only(left: size.sizeMarginLeftTittle.w),
                      color: isEmpty == true
                          ? ListColor.colorValidationTextFieldBackgroundEmpty
                          : widget.colorBackgroundTextField == null
                              ? ListColor.colorBackgroundTextFieldAll
                              : widget.colorBackgroundTextField,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: ComponentTextDescription(
                          tr("${widget.labelText}"),
                          fontWeight: FontWeight.normal,
                          fontSize: size.sizeTextDescriptionGlobal - 3,
                        ),
                      ))),
              checkboxLatexClikcked == true
                  ? Positioned(
                      bottom: 1,
                      child: Container(
                          padding: EdgeInsets.all(5.w),
                          transform: Matrix4.translationValues(40.w, -18.h, 0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0),
                            borderRadius: BorderRadius.circular(20.r),
                            color: Color.fromARGB(255, 94, 204, 205),
                          ),
                          margin: EdgeInsets.only(
                              left: size.sizeMarginLeftTittle.w),
                          child: GestureDetector(
                            onTap: () {
                              if (animationRotateIndicatorController.status ==
                                  AnimationStatus.completed) {
                                animationRotateIndicatorController.reverse(
                                    from: 0.5);
                                widget.showLatexContainer = false;
                                setState(() {
                                  latexContainer = 0;
                                });
                              } else {
                                animationRotateIndicatorController.forward(
                                    from: 0.0);
                                widget.showLatexContainer = true;
                                setState(() {
                                  latexContainer = 160;
                                });
                              }
                              double screenHeight =
                                  MediaQuery.of(context).size.height;

                              // double containerHeight =
                              //     widget.containerListHeight != null
                              //         ? widget.containerListHeight!
                              //         : screenHeight * 0.278;
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ComponentTextDescription(
                                  "Show LatTex Output",
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.sizeTextDescriptionGlobal - 3,
                                  teksColor: Colors.white,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                RotationTransition(
                                  turns: animationRotateIndicatorController,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Image.asset(
                                      "assets/icon/ic_drop_down_chose.png",
                                      width: 15.w,
                                      height: 15.h,
                                      color: isEmpty == true
                                          ? ListColor
                                              .colorOutlineTextFieldWhenEmpty
                                          : Color.fromARGB(255, 117, 251, 250),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )))
                  : Container(),
              isEmpty == true
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 201, 148, 4),
                            shape: BoxShape.circle),
                        child: LottieBuilder.asset(
                          "assets/icon/animation_confirm_to_save_changes.json",
                          width: 10.w,
                          height: 15.h,
                        ),
                      ),
                    )
                  : Container(),
              widget.showLatex == true
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          height: 23.h,
                          transform: Matrix4.translationValues(-15.w, -5.h, 0),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2.0),
                              borderRadius: BorderRadius.circular(20.r),
                              color: Color.fromARGB(255, 108, 58, 183)),
                          child: Padding(
                              padding: EdgeInsets.only(left: 15.h),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ComponentTextDescription("LaTex",
                                      teksColor: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.sizeTextDescriptionGlobal -
                                          3.sp),
                                  Checkbox(
                                    activeColor:
                                        Color.fromARGB(255, 227, 49, 176),
                                    checkColor: Colors.green,
                                    value: checkboxLatexClikcked,
                                    onChanged: (value) {
                                      if (checkboxLatexClikcked == true) {
                                        setState(() {
                                          checkboxLatexClikcked = false;
                                        });
                                      } else {
                                        setState(() {
                                          checkboxLatexClikcked = true;
                                        });
                                      }
                                    },
                                  )
                                ],
                              ))))
                  : Container(),
              widget.showIndicatorMin == true
                  ? _currentMin == 0
                      ? Container()
                      : Positioned(
                          bottom: 1,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.h,
                            ),
                            child: ComponentTextDescription(
                                "Min (${tr((_currentMin).toString())})",
                                fontSize: size.sizeTextDescriptionGlobal.sp,
                                fontWeight: FontWeight.normal,
                                teksColor: Colors.red),
                          ),
                        )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
