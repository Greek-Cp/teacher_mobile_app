import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';

import '../../../res/colors/list_color.dart';

class ModelValidationTextField {
  String? descriptionValidation;
  RegExp? regexValidate;
  bool? warningRule = false;
  ModelValidationTextField(
      {this.descriptionValidation, this.regexValidate, this.warningRule});
}

class RepositoryValidation {
  List<ModelValidationTextField> listModelValidationUsername = [
    ModelValidationTextField(
        descriptionValidation: "- Use characters and number only",
        regexValidate: RegExp(r'^[a-zA-Z0-9]+$'),
        warningRule: false),
    ModelValidationTextField(
        descriptionValidation: "- Minimum 8 Characters",
        regexValidate: RegExp(r'^.{8,}$'),
        warningRule: false),
    ModelValidationTextField(
        descriptionValidation: "- This Username is unvailable",
        warningRule: false),
    ModelValidationTextField(
        descriptionValidation: "- You can't change your username",
        warningRule: false),
  ];
}

class TextFieldFormWithValidation extends StatefulWidget {
  TextFieldFormWithValidation(
      {required this.textEditingControllerEmail,
      required this.hintText,
      required this.labelText,
      required this.requestTypeValidation,
      required this.listModelValidation});

  final TextEditingController textEditingControllerEmail;
  final String labelText;
  final String hintText;
  final String requestTypeValidation;
  final List<ModelValidationTextField> listModelValidation;

  @override
  State<TextFieldFormWithValidation> createState() =>
      _TextFieldFormWithValidationState();
}

class _TextFieldFormWithValidationState
    extends State<TextFieldFormWithValidation> with TickerProviderStateMixin {
  Widget? animationSucces;
  late final AnimationController _animationControllerShake;
  late final Animation<double> _animationShake;
  bool _isValidEmail = true;
  late final AnimationController _controllerLottie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  }

  bool isEmpty = false;
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                    ],
                    controller: widget.textEditingControllerEmail,
                    onChanged: (value) {
                      if (widget.requestTypeValidation == "username") {
                        for (int i = 0;
                            i < widget.listModelValidation.length;
                            i++) {
                          if (widget.listModelValidation[i].regexValidate!
                              .hasMatch(value)) {
                            setState(() {
                              widget.listModelValidation[i].warningRule = true;
                            });
                          } else {
                            setState(() {
                              widget.listModelValidation[i].warningRule = false;
                            });
                          }
                        }
                      }
                    },
                    validator: (value) {
                      print("values $value");
                      if (value == null || value.isEmpty) {
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
                    style: GoogleFonts.nunito(
                        fontSize: size.sizeTextDescriptionGlobal.sp),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: isEmpty == true
                          ? ListColor.colorValidationTextFieldBackgroundEmpty
                          : ListColor.colorBackgroundTextFieldAll,
                      hintText: tr("${widget.hintText}"),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: animationSucces,
                      ),
                      hintStyle: GoogleFonts.nunito(
                          fontSize: size.sizeTextDescriptionGlobal.sp),
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
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin:
                          EdgeInsets.only(left: size.sizeMarginLeftTittle.w),
                      color: isEmpty == true
                          ? ListColor.colorValidationTextFieldBackgroundEmpty
                          : ListColor.colorBackgroundTextFieldAll,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: ComponentTextDescription(
                          tr("${widget.labelText}"),
                          fontWeight: FontWeight.normal,
                          fontSize: size.sizeTextDescriptionGlobal,
                        ),
                      ))),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, top: 10.h),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.listModelValidation.length,
              itemBuilder: (context, index) {
                return ComponentTextDescription(
                  tr("${widget.listModelValidation[index].descriptionValidation}"),
                  fontSize: size.sizeTextDescriptionGlobal,
                  teksColor:
                      widget.listModelValidation[index].warningRule == false
                          ? Colors.red
                          : Colors.black,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldFormPhone extends StatefulWidget {
  TextFieldFormPhone(
      {required this.textEditingControllerEmail,
      required this.hintText,
      required this.labelText});

  final TextEditingController textEditingControllerEmail;
  final String labelText;
  final String hintText;

  @override
  State<TextFieldFormPhone> createState() => _TextFieldFormPhoneState();
}

class _TextFieldFormPhoneState extends State<TextFieldFormPhone>
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
            child: IntlPhoneField(
              controller: widget.textEditingControllerEmail,
              style: GoogleFonts.nunito(
                  fontSize: size.sizeTextDescriptionGlobal.sp),
              pickerDialogStyle: PickerDialogStyle(
                  searchFieldCursorColor: Colors.white,
                  countryNameStyle: TextStyle(
                      fontSize: size.sizeTextDescriptionGlobal.sp,
                      color: Colors.white),
                  countryCodeStyle: TextStyle(
                      fontSize: size.sizeTextDescriptionGlobal.sp,
                      color: Colors.white)),
              dropdownTextStyle: TextStyle(
                  fontSize: size.sizeTextDescriptionGlobal.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: ListColor.colorBackgroundTextFieldAll,
                hintText: tr("${widget.hintText}"),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: animationSucces,
                ),
                hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp),
                contentPadding: EdgeInsets.all(15.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(size.roundedCircularGlobal),
                  borderSide: BorderSide(
                    color: Colors.black, // Change the border color here
                    width: size
                        .sizeBorderBlackGlobal, // Change the border width here
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(size.roundedCircularGlobal),
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
                margin: EdgeInsets.only(left: size.sizeMarginLeftTittle.w),
                color: ListColor.colorBackgroundTextFieldAll,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: ComponentTextDescription(
                    tr("${widget.labelText}"),
                    fontWeight: FontWeight.normal,
                    fontSize: size.sizeTextDescriptionGlobal,
                  ),
                ))),
      ],
    );
  }
}

class TextFieldFormMultiLine extends StatefulWidget {
  TextFieldFormMultiLine(
      {required this.textEditingControllerEmail,
      required this.hintText,
      required this.labelText,
      required this.lengthMax,
      required this.minLines,
      required this.minCharacterHint});
  final TextEditingController textEditingControllerEmail;
  final String labelText;
  final String hintText;
  int lengthMax;
  int minLines;
  int minCharacterHint;
  @override
  State<TextFieldFormMultiLine> createState() => _TextFieldFormMultiLineState();
}

class _TextFieldFormMultiLineState extends State<TextFieldFormMultiLine>
    with TickerProviderStateMixin {
  Widget? animationSucces;

  FocusNode? _focusNode;
  bool _isValidEmail = true;
  late final AnimationController _controllerLottie;
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
  }

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

  void _increaseMinValue() {
    setState(() {
      int textLength = widget.textEditingControllerEmail.text.length;
      _defaultMin += textLength;
      _currentMin = _defaultMin;
    });
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
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5.h),
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
                });
              },

              onFieldSubmitted: (term) {
                _focusNode!.unfocus();
              },

              onEditingComplete: () {
                _increaseMinValue();
                if (UtilValidatorData.isEmailValid(
                    widget.textEditingControllerEmail.text.toString())) {
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
                    : ListColor.colorBackgroundTextFieldAll,
                hintText: tr("${widget.hintText}"),
                hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp),
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
          Align(
              alignment: Alignment.topLeft,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  margin: EdgeInsets.only(left: size.sizeMarginLeftTittle.w),
                  color: isEmpty == true
                      ? ListColor.colorValidationTextFieldBackgroundEmpty
                      : ListColor.colorBackgroundTextFieldAll,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: ComponentTextDescription(
                      tr("${widget.labelText}"),
                      fontWeight: FontWeight.normal,
                      fontSize: size.sizeTextDescriptionGlobal - 3,
                    ),
                  ))),
          _currentMin == 0
              ? Container()
              : Positioned(
                  bottom: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: ComponentTextDescription(
                        "Min (${tr((_currentMin).toString())})",
                        fontSize: size.sizeTextDescriptionGlobal.sp,
                        fontWeight: FontWeight.normal,
                        teksColor: Colors.red),
                  ),
                ),
        ],
      ),
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
    with TickerProviderStateMixin {
  Widget? animationSucces;
  late final AnimationController _animationControllerShake;
  late final Animation<double> _animationShake;
  bool _isValidEmail = true;
  late final AnimationController _controllerLottie;
  bool isEmpty = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  }

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
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              height: 50.h,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                ],
                validator: (value) {
                  print("values $value");
                  if (value == null || value.isEmpty) {
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
                controller: widget.textEditingControllerEmail,
                onEditingComplete: () {
                  _controllerLottie.reset();
                  _controllerLottie.forward();
                  if (widget.textEditingControllerEmail.text
                      .toString()
                      .isEmpty) {
                    setState(() {
                      isEmpty = true;
                    });
                  } else {
                    setState(() {
                      isEmpty = false;
                    });
                  }
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
                style: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isEmpty == true
                      ? ListColor.colorValidationTextFieldBackgroundEmpty
                      : ListColor.colorBackgroundTextFieldAll,
                  hintText: tr("${widget.hintText}"),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: animationSucces,
                  ),
                  hintStyle: GoogleFonts.nunito(
                      fontSize: size.sizeTextDescriptionGlobal.sp),
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
              )),
          Align(
              alignment: Alignment.topLeft,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  margin: EdgeInsets.only(left: size.sizeMarginLeftTittle.w),
                  color: isEmpty == true
                      ? ListColor.colorValidationTextFieldBackgroundEmpty
                      : ListColor.colorBackgroundTextFieldAll,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: ComponentTextDescription(
                      tr("${widget.labelText}"),
                      fontWeight: FontWeight.normal,
                      fontSize: size.sizeTextDescriptionGlobal,
                    ),
                  ))),
        ],
      ),
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
    with TickerProviderStateMixin {
  Widget? animationSucces;

  bool passwordHidden = true;
  late final AnimationController _animationControllerShake;
  late final Animation<double> _animationShake;
  bool isEmpty = false;

  late final AnimationController _controllerLottie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerLottie = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    animationSucces = Lottie.asset("assets/icon/animation_succes.json",
        width: 20, height: 20, repeat: false, controller: _controllerLottie);
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
  }

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
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                ],
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
                validator: (value) {
                  print("values $value");
                  if (value == null || value.isEmpty) {
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
                style: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isEmpty == true
                      ? ListColor.colorValidationTextFieldBackgroundEmpty
                      : ListColor.colorBackgroundTextFieldAll,
                  hintText: tr("${widget.hintText}"),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 0.h),
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
                          ? Container(
                              padding: EdgeInsets.only(right: 5.h),
                            )
                          : Padding(
                              padding: EdgeInsets.only(right: 5.h),
                              child: animationSucces!)
                    ],
                  ),
                  hintStyle: GoogleFonts.nunito(
                      fontSize: size.sizeTextDescriptionGlobal.sp),
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
              )),
          Align(
              alignment: Alignment.topLeft,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  margin: EdgeInsets.only(left: size.sizeMarginLeftTittle.w),
                  color: isEmpty == true
                      ? ListColor.colorValidationTextFieldBackgroundEmpty
                      : ListColor.colorBackgroundTextFieldAll,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: ComponentTextDescription(
                      tr("${widget.labelText}"),
                      fontWeight: FontWeight.normal,
                      fontSize: size.sizeTextDescriptionGlobal,
                    ),
                  ))),
        ],
      ),
    );
  }
}

class TextFieldPasswordFormArabic extends StatefulWidget {
  TextFieldPasswordFormArabic(
      {required this.textEditingControllerEmail,
      required this.hintText,
      required this.labelText});

  final TextEditingController textEditingControllerEmail;
  final String labelText;
  final String hintText;

  @override
  State<TextFieldPasswordFormArabic> createState() =>
      _TextFieldPasswordFormArabicState();
}

class _TextFieldPasswordFormArabicState
    extends State<TextFieldPasswordFormArabic>
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
              ],
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
              style: GoogleFonts.nunito(
                  fontSize: size.sizeTextDescriptionGlobal.sp),
              decoration: InputDecoration(
                filled: true,
                fillColor: ListColor.colorBackgroundTextFieldAll,
                hintText: tr("${widget.hintText}"),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: size.sizeMarginLeftTittle.h),
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
                            padding: EdgeInsets.only(left: 10.h),
                            child: animationSucces!)
                  ],
                ),
                hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp),
                contentPadding: EdgeInsets.all(15.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(size.roundedCircularGlobal),
                  borderSide: BorderSide(
                    color: Colors.black, // Change the border color here
                    width: size
                        .sizeBorderBlackGlobal, // Change the border width here
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(size.roundedCircularGlobal),
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
                margin: EdgeInsets.only(left: size.sizeMarginLeftTittle.w),
                color: ListColor.colorBackgroundTextFieldAll,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: ComponentTextDescription(
                    tr("${widget.labelText}"),
                    fontWeight: FontWeight.normal,
                    fontSize: size.sizeTextDescriptionGlobal,
                  ),
                ))),
      ],
    );
  }
}
