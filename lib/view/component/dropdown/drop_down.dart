import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacher_mobile_app/models/CountryCode.dart';
import 'package:teacher_mobile_app/res/border/border.dart';
import 'package:teacher_mobile_app/res/border/divider_global.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/font/font_type.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_select_language.dart';

class DropDownWidgetLanguage extends StatefulWidget {
  TextEditingController textEditingControllerDropDown = TextEditingController();

  int selectedIndex = 0;

  String? initialValueDropDown;
  double containerHeight = 50;
  String? labelText;
  List<LanguageModel>? listData;
  VoidCallback? voidCallbackDropDownArrowOnTap;

  DropDownWidgetLanguage({
    this.voidCallbackDropDownArrowOnTap,
    required this.textEditingControllerDropDown,
    required this.initialValueDropDown,
    required this.containerHeight,
    required this.labelText,
    required this.listData,
  });
  @override
  State<DropDownWidgetLanguage> createState() => _DropDownWidgetLanguageState();
}

class _DropDownWidgetLanguageState extends State<DropDownWidgetLanguage>
    with TickerProviderStateMixin {
  late final AnimationController animationRotateIndicatorController;
  late final Animation<double> animationRotateDouble;
  late final AnimationController _animationControllerShake;
  late final Animation<double> _animationShake;

  @override
  void initState() {
    super.initState();
    // labelText = tr("select_a_country");
    // textEditingControllerDropDown.text = labelText.toString();
    animationRotateIndicatorController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);
    animationRotateDouble = Tween<double>(begin: 0, end: 1.0)
        .animate(animationRotateIndicatorController);
    widget.textEditingControllerDropDown.text =
        widget.initialValueDropDown.toString();
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
    // TODO: implement build
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
          Stack(children: [
            GestureDetector(
              onTap: () {
                if (animationRotateIndicatorController.status ==
                    AnimationStatus.completed) {
                  animationRotateIndicatorController.reverse(from: 0.5);
                } else {
                  animationRotateIndicatorController.forward(from: 0.0);
                }
                double screenHeight = MediaQuery.of(context).size.height;
                double containerHeight = screenHeight * 0.278;
                if (widget.containerHeight <= 90) {
                  setState(() {
                    widget.containerHeight += containerHeight;
                    // if (widget.voidCallbackDropDownArrowOnTap != null) {
                    //   widget.voidCallbackDropDownArrowOnTap!();
                    // }
                  });
                } else {
                  setState(() {
                    widget.containerHeight -= containerHeight;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.only(top: 8.h),
                height: widget.containerHeight.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isEmpty == true
                        ? ListColor.colorOutlineTextFieldWhenEmpty
                        : Colors.black,
                    width: 2.0,
                  ),
                  color: isEmpty == true
                      ? ListColor.colorValidationTextFieldBackgroundEmpty
                      : ListColor.colorBackgrondDropDownLanguage,
                  borderRadius:
                      BorderRadius.circular(size.roundedCircularGlobal),
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 12.h,
                      left: 15.w,
                      right: 10.w,
                      bottom: 7.h,
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: widget.textEditingControllerDropDown,
                          validator: (value) {
                            print("valuee $value");
                            if (value == widget.initialValueDropDown) {
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
                          readOnly: true, // Make the field read-only
                          style: FontType.font_utama(
                              fontSize: size.sizeTextDescriptionGlobal + 2.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none, // Remove the outline
                            contentPadding: EdgeInsets.zero, // Remove padding
                            isCollapsed: true, // Collapse the vertical space
                          ),
                        ),
                        UtilLocalization.checkLocalization(context)
                                    .toString() ==
                                "US"
                            ? Positioned(
                                right: 1,
                                child: RotationTransition(
                                  turns: animationRotateIndicatorController,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0.h),
                                    child: Image.asset(
                                      "assets/icon/ic_drop_down_chose.png",
                                      width: 20.w,
                                      height: 20.h,
                                      color: isEmpty == true
                                          ? ListColor
                                              .colorOutlineTextFieldWhenEmpty
                                          : Color.fromARGB(255, 114, 87, 216),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 1,
                                child: RotationTransition(
                                  turns: animationRotateIndicatorController,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Image.asset(
                                      "assets/icon/ic_drop_down_chose.png",
                                      width: 20.w,
                                      height: 20.h,
                                      color: isEmpty == true
                                          ? ListColor
                                              .colorOutlineTextFieldWhenEmpty
                                          : Color.fromARGB(255, 114, 87, 216),
                                    ),
                                  ),
                                ),
                              ),
                        Container(
                          color: isEmpty == true
                              ? ListColor
                                  .colorValidationTextFieldBackgroundEmpty
                              : Color.fromARGB(255, 54, 240, 255),
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.only(right: 5, left: 0),
                          child: Scrollbar(
                              thickness: 6,
                              thumbVisibility: true,
                              trackVisibility: true,
                              radius: Radius.circular(30),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: widget.listData!.length,
                                itemBuilder: (context, index) {
                                  return InkResponse(
                                    borderRadius: BorderRadius.circular(30),
                                    highlightColor:
                                        Colors.blue.withOpacity(0.4),
                                    splashColor: Colors.green.withOpacity(0.5),
                                    onTap: () {
                                      //select language
                                      setState(() {
                                        widget.textEditingControllerDropDown
                                                .text =
                                            widget.listData![index].nameLanguage
                                                .toString();
                                        EasyLocalization.of(context)!
                                            .setLocale(Locale(
                                          widget.listData![index].id.toString(),
                                          widget.listData![index].lang
                                              .toString(),
                                        ));
                                        Get.updateLocale(Locale(
                                          widget.listData![index].id.toString(),
                                          widget.listData![index].lang
                                              .toString(),
                                        ));
                                        // widget.initialValueDropDown =
                                        //     widget.listData![index];
                                        print(
                                            "value${widget.initialValueDropDown}");
                                      });
                                      //EasyLocalization.of(context)
                                      widget.selectedIndex = index;
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 20.h),
                                          child: Divider(
                                            height: 3,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ComponentTextDescription(
                                                widget.listData![index]
                                                    .nameLanguage
                                                    .toString(),
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              SizedBox(),
                                              // Padding(
                                              //   padding: EdgeInsets.symmetric(
                                              //       vertical: 2.h,
                                              //       horizontal: 10.h),
                                              //   child: Container(
                                              //     decoration: BoxDecoration(
                                              //         color:
                                              //             widget.selectedIndex ==
                                              //                     index
                                              //                 ? Colors.purple
                                              //                 : ListColor.colorBackgroundTextFieldAll,
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 5.0.r),
                                              //         border: Border.all(
                                              //             color: Colors.black,
                                              //             width: size
                                              //                 .sizeBorderBlackGlobal)),
                                              //     width: 15.w,
                                              //     height: 15.h,
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                        ),
                      ],
                    )),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.only(left: size.sizeMarginLeftTittle.h),
                    color: isEmpty == true
                        ? ListColor.colorValidationTextFieldBackgroundEmpty
                        : ListColor.colorBackgrondDropDownLanguage,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: ComponentTextDescription(
                        tr(widget.labelText.toString()),
                        fontWeight: FontWeight.normal,
                        fontSize: size.sizeTextDescriptionGlobal,
                      ),
                    ))),
          ]),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  TextEditingController textEditingControllerDropDown = TextEditingController();

  int selectedIndex = 0;

  String? initialValueDropDown;
  double containerHeight = 50;
  String? labelText;
  List<String>? listData;
  VoidCallback? voidCallbackDropDownArrowOnTap;
  Color? colorBackgroundDropDown;
  Color? colorBackgroundItemDropDown;

  DropDownWidget({
    this.voidCallbackDropDownArrowOnTap,
    required this.textEditingControllerDropDown,
    required this.initialValueDropDown,
    required this.containerHeight,
    required this.labelText,
    required this.listData,
  });
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget>
    with TickerProviderStateMixin {
  late final AnimationController animationRotateIndicatorController;
  late final Animation<double> animationRotateDouble;
  late final AnimationController _animationControllerShake;
  late final Animation<double> _animationShake;

  @override
  void initState() {
    super.initState();
    // labelText = tr("select_a_country");
    // textEditingControllerDropDown.text = labelText.toString();
    animationRotateIndicatorController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);
    animationRotateDouble = Tween<double>(begin: 0, end: 1.0)
        .animate(animationRotateIndicatorController);
    widget.textEditingControllerDropDown.text =
        widget.initialValueDropDown.toString();
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
    // TODO: implement build
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
          Stack(children: [
            GestureDetector(
              onTap: () {
                if (animationRotateIndicatorController.status ==
                    AnimationStatus.completed) {
                  animationRotateIndicatorController.reverse(from: 0.5);
                } else {
                  animationRotateIndicatorController.forward(from: 0.0);
                }
                double screenHeight = MediaQuery.of(context).size.height;
                double containerHeight = screenHeight * 0.278;

                if (widget.containerHeight <= 90) {
                  setState(() {
                    widget.containerHeight += containerHeight;
                    // if (widget.voidCallbackDropDownArrowOnTap != null) {
                    //   widget.voidCallbackDropDownArrowOnTap!();
                    // }
                  });
                } else {
                  setState(() {
                    widget.containerHeight -= containerHeight;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.only(top: 8.h),
                height: widget.containerHeight.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isEmpty == true
                        ? ListColor.colorOutlineTextFieldWhenEmpty
                        : Colors.black,
                    width: 2.0,
                  ),
                  color: isEmpty == true
                      ? ListColor.colorValidationTextFieldBackgroundEmpty
                      : ListColor.colorBackgroundTextFieldAll,
                  borderRadius:
                      BorderRadius.circular(size.roundedCircularGlobal),
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 15.h,
                      left: 15.w,
                      right: 10.w,
                      bottom: 7.h,
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: widget.textEditingControllerDropDown,
                          validator: (value) {
                            print("valuee $value");
                            if (value == widget.initialValueDropDown) {
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
                          readOnly: true, // Make the field read-only
                          style: FontType.font_utama(
                              fontSize: size.sizeTextDescriptionGlobal.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none, // Remove the outline
                            contentPadding: EdgeInsets.zero, // Remove padding
                            isCollapsed: true, // Collapse the vertical space
                          ),
                        ),
                        UtilLocalization.checkLocalization(context)
                                    .toString() ==
                                "US"
                            ? Positioned(
                                right: 1,
                                child: RotationTransition(
                                  turns: animationRotateIndicatorController,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Image.asset(
                                      "assets/icon/ic_drop_down_chose.png",
                                      width: 20.w,
                                      height: 20.h,
                                      color: isEmpty == true
                                          ? ListColor
                                              .colorOutlineTextFieldWhenEmpty
                                          : Color.fromARGB(255, 114, 87, 216),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 1,
                                child: RotationTransition(
                                  turns: animationRotateIndicatorController,
                                  child: Image.asset(
                                    "assets/icon/ic_drop_down_chose.png",
                                    width: 20.w,
                                    height: 20.h,
                                    color: isEmpty == true
                                        ? ListColor
                                            .colorOutlineTextFieldWhenEmpty
                                        : Color.fromARGB(255, 114, 87, 216),
                                  ),
                                ),
                              ),
                        Container(
                          color: isEmpty == true
                              ? ListColor
                                  .colorValidationTextFieldBackgroundEmpty
                              : ListColor.colorBackgroundTextFieldAll,
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.only(right: 5, left: 0),
                          child: Scrollbar(
                              thickness: 6,
                              thumbVisibility: true,
                              trackVisibility: true,
                              radius: Radius.circular(30),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: widget.listData!.length,
                                itemBuilder: (context, index) {
                                  return InkResponse(
                                    borderRadius: BorderRadius.circular(30),
                                    highlightColor:
                                        Colors.blue.withOpacity(0.4),
                                    splashColor: Colors.green.withOpacity(0.5),
                                    onTap: () {
                                      //select language
                                      setState(() {
                                        widget.textEditingControllerDropDown
                                            .text = widget.listData![index];
                                        // widget.initialValueDropDown =
                                        //     widget.listData![index];
                                        setState(() {
                                          double screenHeight =
                                              MediaQuery.of(context)
                                                  .size
                                                  .height;
                                          double containerHeight =
                                              screenHeight * 0.278;

                                          animationRotateIndicatorController
                                              .forward(from: 0.0);
                                          widget.containerHeight -=
                                              containerHeight;
                                        });
                                        print(
                                            "value${widget.initialValueDropDown}");
                                      });
                                      //EasyLocalization.of(context)
                                      widget.selectedIndex = index;
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 20.h),
                                          child: Divider(
                                            height: 3,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ComponentTextDescription(
                                                widget.listData![index],
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              SizedBox(),
                                              // Padding(
                                              //   padding: EdgeInsets.symmetric(
                                              //       vertical: 2.h,
                                              //       horizontal: 10.h),
                                              //   child: Container(
                                              //     decoration: BoxDecoration(
                                              //         color:
                                              //             widget.selectedIndex ==
                                              //                     index
                                              //                 ? Colors.purple
                                              //                 : ListColor.colorBackgroundTextFieldAll,
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 5.0.r),
                                              //         border: Border.all(
                                              //             color: Colors.black,
                                              //             width: size
                                              //                 .sizeBorderBlackGlobal)),
                                              //     width: 15.w,
                                              //     height: 15.h,
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                        ),
                      ],
                    )),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.only(left: size.sizeMarginLeftTittle.h),
                    color: isEmpty == true
                        ? ListColor.colorValidationTextFieldBackgroundEmpty
                        : ListColor.colorBackgroundTextFieldAll,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: ComponentTextDescription(
                        tr(widget.labelText.toString()),
                        fontWeight: FontWeight.normal,
                        fontSize: size.sizeTextDescriptionGlobal,
                      ),
                    ))),
          ]),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),
    );
  }
}

class DropDownWidgetChooseCountry extends StatefulWidget {
  TextEditingController textEditingControllerDropDown = TextEditingController();
  int selectedIndex = 0;
  String? initialValueDropDown;
  String? codeCountryValueDropDown;
  double containerHeight = 50;
  String? labelText;
  List<CountryCode>? listData;
  DropDownWidgetChooseCountry({
    required this.textEditingControllerDropDown,
    required this.initialValueDropDown,
    required this.containerHeight,
    required this.labelText,
    required this.listData,
  });
  @override
  State<DropDownWidgetChooseCountry> createState() =>
      _DropDownWidgetChooseCountryState();
}

class _DropDownWidgetChooseCountryState
    extends State<DropDownWidgetChooseCountry> with TickerProviderStateMixin {
  late final Animation<double> animationRotateDouble;
  late final AnimationController animationRotateIndicatorController;
  late final AnimationController _animationControllerShake;
  late final Animation<double> _animationShake;
  bool? isEmpty = false;

  @override
  void initState() {
    super.initState();
    // labelText = tr("select_a_country");
    // textEditingControllerDropDown.text = labelText.toString();

    widget.initialValueDropDown = widget.listData![0].unicode_country;
    widget.codeCountryValueDropDown = widget.listData![0].numberCode;
    animationRotateIndicatorController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);

    animationRotateDouble = Tween<double>(begin: 0, end: 1.0)
        .animate(animationRotateIndicatorController);
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
    // TODO: implement build
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
          Stack(children: [
            GestureDetector(
              onTap: () {
                if (animationRotateIndicatorController.status ==
                    AnimationStatus.completed) {
                  animationRotateIndicatorController.reverse(from: 0.5);
                } else {
                  animationRotateIndicatorController.forward(from: 0.0);
                }
                double screenHeight = MediaQuery.of(context).size.height;
                double containerHeight = screenHeight * 0.278;

                if (widget.containerHeight <= 90) {
                  setState(() {
                    widget.containerHeight += containerHeight;
                  });
                } else {
                  setState(() {
                    widget.containerHeight -= containerHeight;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.only(top: 8.h),
                height: widget.containerHeight.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isEmpty == true
                        ? ListColor.colorOutlineTextFieldWhenEmpty
                        : Colors.black,
                    width: 2.0,
                  ),
                  color: isEmpty == true
                      ? ListColor.colorValidationTextFieldBackgroundEmpty
                      : ListColor.colorBackgroundTextFieldAll,
                  borderRadius:
                      BorderRadius.circular(size.roundedCircularGlobal),
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 0.h,
                      left: 15.w,
                      right: 10.w,
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ComponentTextDescription(
                              widget.initialValueDropDown,
                              fontSize: size.sizeTextDescriptionGlobal,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            ComponentTextDescription(
                              widget.codeCountryValueDropDown,
                              fontSize: size.sizeTextDescriptionGlobal,
                              fontWeight: FontWeight.normal,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.h),
                              color: Colors.black,
                              height: 30,
                              width: 2,
                            ),
                            Expanded(
                                child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 13,
                              validator: (value) {
                                print("valuee $value");
                                if (value!.isEmpty ||
                                    value == null ||
                                    value!.length < 12) {
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
                              style: GoogleFonts.nunito(
                                  fontSize: size.sizeTextDescriptionGlobal.sp),
                              decoration: InputDecoration(
                                counterText: "",
                                filled: true,
                                fillColor: isEmpty == true
                                    ? ListColor
                                        .colorValidationTextFieldBackgroundEmpty
                                    : ListColor.colorBackgroundTextFieldAll,
                                hintText: tr("phone_number"),
                                hintStyle: GoogleFonts.nunito(
                                    fontSize:
                                        size.sizeTextDescriptionGlobal.sp),
                                contentPadding: EdgeInsets.all(10.h),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      size.roundedCircularGlobal),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .transparent, // Change the border color here
                                    width: size
                                        .sizeBorderBlackGlobal, // Change the border width here
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      size.roundedCircularGlobal),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .transparent, // Change the border color here
                                    width: size
                                        .sizeBorderBlackGlobal, // Change the border width here
                                  ),
                                ),
                              ),
                            )),
                            UtilLocalization.checkLocalization(context)
                                        .toString() ==
                                    "US"
                                ? RotationTransition(
                                    turns: animationRotateIndicatorController,
                                    child: Image.asset(
                                      "assets/icon/ic_drop_down_chose.png",
                                      width: 20.w,
                                      height: 20.h,
                                      color: isEmpty == true
                                          ? ListColor
                                              .colorOutlineTextFieldWhenEmpty
                                          : Color.fromARGB(255, 114, 87, 216),
                                    ),
                                  )
                                : RotationTransition(
                                    turns: animationRotateIndicatorController,
                                    child: Image.asset(
                                      "assets/icon/ic_drop_down_chose.png",
                                      width: 20.w,
                                      height: 20.h,
                                      color: isEmpty == true
                                          ? ListColor
                                              .colorOutlineTextFieldWhenEmpty
                                          : Color.fromARGB(255, 114, 87, 216),
                                    ),
                                  ),
                          ],
                        ),
                        Container(
                          color: isEmpty == true
                              ? ListColor
                                  .colorValidationTextFieldBackgroundEmpty
                              : ListColor.colorBackgroundTextFieldAll,
                          margin: EdgeInsets.only(top: 50, bottom: 10),
                          padding: EdgeInsets.only(right: 5, left: 0),
                          child: Scrollbar(
                              thickness: 6,
                              thumbVisibility: true,
                              trackVisibility: true,
                              radius: Radius.circular(30),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: widget.listData!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    splashColor: Colors
                                        .blue, // Change the splash color here
                                    highlightColor: Colors
                                        .green, // Change the highlight color here

                                    onTap: () {
                                      //select language
                                      setState(() {
                                        widget.initialValueDropDown = widget
                                            .listData![index].unicode_country;
                                        widget.codeCountryValueDropDown =
                                            widget.listData![index].numberCode;
                                      });
                                      double screenHeight =
                                          MediaQuery.of(context).size.height;
                                      double containerHeight =
                                          screenHeight * 0.278;

                                      animationRotateIndicatorController
                                          .forward(from: 0.0);
                                      widget.containerHeight -= containerHeight;
                                      //EasyLocalization.of(context)
                                      widget.selectedIndex = index;
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          height: 3,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ComponentTextDescription(
                                                widget.listData![index]
                                                    .unicode_country,
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                child: ComponentTextDescription(
                                                  widget.listData![index]
                                                      .countryName,
                                                  fontSize: size
                                                      .sizeTextDescriptionGlobal,
                                                  fontWeight:
                                                      widget.selectedIndex ==
                                                              index
                                                          ? FontWeight.normal
                                                          : FontWeight.normal,
                                                ),
                                              ),
                                              ComponentTextDescription(
                                                  widget.listData![index]
                                                      .numberCode,
                                                  fontWeight:
                                                      widget.selectedIndex ==
                                                              index
                                                          ? FontWeight.normal
                                                          : FontWeight.normal,
                                                  fontSize: size
                                                      .sizeTextDescriptionGlobal),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                        ),
                      ],
                    )),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.only(left: size.sizeMarginLeftTittle.h),
                    color: isEmpty == true
                        ? ListColor.colorValidationTextFieldBackgroundEmpty
                        : ListColor.colorBackgroundTextFieldAll,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: ComponentTextDescription(
                        tr(widget.labelText.toString()),
                        fontWeight: FontWeight.normal,
                        fontSize: size.sizeTextDescriptionGlobal,
                      ),
                    ))),
          ]),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),
    );
  }
}
