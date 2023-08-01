import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_mobile_app/res/border/border.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';

class DropDownWidget extends StatefulWidget {
  TextEditingController textEditingControllerDropDown = TextEditingController();

  late AnimationController animationRotateIndicatorController;

  late Animation<double> animationRotateDouble;

  int selectedIndex = 0;

  String? initialValueDropDown;

  double containerHeight = 50;
  String? labelText;
  List<String>? listData;
  DropDownWidget({
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
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // labelText = tr("select_a_country");
    // textEditingControllerDropDown.text = labelText.toString();
    widget.animationRotateIndicatorController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      upperBound: 0.5,
    );

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
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
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
                        fontWeight: FontWeight.bold,
                      ),
                      UtilLocalization.checkLocalization(context).toString() ==
                              "US"
                          ? Positioned(
                              right: 1,
                              child: RotationTransition(
                                turns:
                                    widget.animationRotateIndicatorController,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5),
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
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(right: 5, left: 5),
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ComponentTextDescription(
                                              widget.listData![index],
                                              fontSize: size
                                                  .sizeTextDescriptionGlobal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h,
                                                  horizontal: 10.h),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color:
                                                        widget.selectedIndex ==
                                                                index
                                                            ? Colors.purple
                                                            : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0.r),
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: size
                                                            .sizeBorderBlackGlobal)),
                                                width: 15.w,
                                                height: 15.h,
                                              ),
                                            )
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
                  margin: EdgeInsets.only(left: 15.h),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: ComponentTextDescription(
                      tr("country_of_residence"),
                      fontWeight: FontWeight.bold,
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
