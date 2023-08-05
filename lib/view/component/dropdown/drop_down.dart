import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacher_mobile_app/models/CountryCode.dart';
import 'package:teacher_mobile_app/res/border/border.dart';
import 'package:teacher_mobile_app/res/border/divider_global.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';

class DropDownWidget extends StatefulWidget {
  TextEditingController textEditingControllerDropDown = TextEditingController();

  AnimationController animationRotateIndicatorController;

  late Animation<double> animationRotateDouble;

  int selectedIndex = 0;

  String? initialValueDropDown;

  double containerHeight = 50;
  String? labelText;
  List<String>? listData;
  DropDownWidget({
    required this.animationRotateIndicatorController,
    required this.textEditingControllerDropDown,
    required this.initialValueDropDown,
    required this.containerHeight,
    required this.labelText,
    required this.listData,
  });
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  void initState() {
    super.initState();
    // labelText = tr("select_a_country");
    // textEditingControllerDropDown.text = labelText.toString();

    widget.animationRotateDouble = Tween<double>(begin: 0, end: 1.0)
        .animate(widget.animationRotateIndicatorController);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Stack(children: [
          GestureDetector(
            onTap: () {
              if (widget.animationRotateIndicatorController.status ==
                  AnimationStatus.completed) {
                widget.animationRotateIndicatorController.reverse(from: 0.5);
              } else {
                widget.animationRotateIndicatorController.forward(from: 0.0);
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
                  color: Colors.black,
                  width: 2.0,
                ),
                color: ListColor.colorBackgroundTextFieldAll,
                borderRadius: BorderRadius.circular(size.roundedCircularGlobal),
              ),
              child: Padding(
                  padding: EdgeInsets.only(
                    top: 15.h,
                    left: 15.w,
                    right: 10.w,
                  ),
                  child: Stack(
                    children: [
                      ComponentTextDescription(
                        widget.initialValueDropDown,
                        fontSize: size.sizeTextDescriptionGlobal,
                        fontWeight: FontWeight.normal,
                      ),
                      UtilLocalization.checkLocalization(context).toString() ==
                              "US"
                          ? Positioned(
                              right: 1,
                              child: RotationTransition(
                                turns:
                                    widget.animationRotateIndicatorController,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Image.asset(
                                    "assets/icon/ic_drop_down_chose.png",
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ),
                              ),
                            )
                          : Positioned(
                              left: 1,
                              child: RotationTransition(
                                turns:
                                    widget.animationRotateIndicatorController,
                                child: Image.asset(
                                  "assets/icon/ic_drop_down_chose.png",
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ),
                            ),
                      Container(
                        color: ListColor.colorBackgroundTextFieldAll,
                        margin: EdgeInsets.only(top: 30),
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
                                      widget.initialValueDropDown =
                                          widget.listData![index];
                                    });
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
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.h),
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
                  color: ListColor.colorBackgroundTextFieldAll,
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
    );
  }
}

class DropDownWidgetChooseCountry extends StatefulWidget {
  TextEditingController textEditingControllerDropDown = TextEditingController();

  AnimationController animationRotateIndicatorController;

  late Animation<double> animationRotateDouble;

  int selectedIndex = 0;

  String? initialValueDropDown;
  String? codeCountryValueDropDown;
  double containerHeight = 50;
  String? labelText;
  List<CountryCode>? listData;
  DropDownWidgetChooseCountry({
    required this.animationRotateIndicatorController,
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
    extends State<DropDownWidgetChooseCountry> {
  @override
  void initState() {
    super.initState();
    // labelText = tr("select_a_country");
    // textEditingControllerDropDown.text = labelText.toString();

    widget.animationRotateDouble = Tween<double>(begin: 0, end: 1.0)
        .animate(widget.animationRotateIndicatorController);
    widget.initialValueDropDown = widget.listData![0].unicode_country;
    widget.codeCountryValueDropDown = widget.listData![0].numberCode;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Stack(children: [
          GestureDetector(
            onTap: () {
              if (widget.animationRotateIndicatorController.status ==
                  AnimationStatus.completed) {
                widget.animationRotateIndicatorController.reverse(from: 0.5);
              } else {
                widget.animationRotateIndicatorController.forward(from: 0.0);
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
                  color: Colors.black,
                  width: 2.0,
                ),
                color: ListColor.colorBackgroundTextFieldAll,
                borderRadius: BorderRadius.circular(size.roundedCircularGlobal),
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
                        mainAxisSize: MainAxisSize.max,
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
                              child: TextField(
                            style: GoogleFonts.nunito(
                                fontSize: size.sizeTextDescriptionGlobal.sp),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ListColor.colorBackgroundTextFieldAll,
                              hintText: tr("phone_number"),
                              hintStyle: GoogleFonts.nunito(
                                  fontSize: size.sizeTextDescriptionGlobal.sp),
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
                              ? Positioned(
                                  right: 1,
                                  child: RotationTransition(
                                    turns: widget
                                        .animationRotateIndicatorController,
                                    child: Image.asset(
                                      "assets/icon/ic_drop_down_chose.png",
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                                  ),
                                )
                              : Positioned(
                                  left: 1,
                                  child: RotationTransition(
                                    turns: widget
                                        .animationRotateIndicatorController,
                                    child: Image.asset(
                                      "assets/icon/ic_drop_down_chose.png",
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      Container(
                        color: ListColor.colorBackgroundTextFieldAll,
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
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.h),
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
                  color: ListColor.colorBackgroundTextFieldAll,
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
    );
  }
}
