import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/button/button_small.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_select_login.dart';


class PageSelectLanguage extends StatefulWidget {
  static String? routeName = "/PageSelectLanguage";

  @override
  State<PageSelectLanguage> createState() => _PageSelectLanguageState();
}

class LanguageModel {
  String? nameLanguage;
  String? id, lang;
  LanguageModel(this.nameLanguage, this.id, this.lang);
}

class _PageSelectLanguageState extends State<PageSelectLanguage>
    with SingleTickerProviderStateMixin {
  TextEditingController textEditingControllerChooseLanguage =
      TextEditingController();
  String? labelText;
  List<LanguageModel> listLanguage = [
    LanguageModel("English", "en", "US"),
    LanguageModel("Arab", "ar", "AR"),
    LanguageModel("English", "en", "US"),
    LanguageModel("Arab", "ar", "AR"),
    LanguageModel("English", "en", "US"),
    LanguageModel("Arab", "ar", "AR"),
    LanguageModel("English", "en", "US"),
    LanguageModel("Arab", "ar", "AR"),
    LanguageModel("English", "en", "US"),
    LanguageModel("Arab", "ar", "AR"),
    LanguageModel("English", "en", "US"),
    LanguageModel("Arab", "ar", "AR"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    labelText = tr("changeLanguage");
    textEditingControllerChooseLanguage.text = labelText.toString();
    animationRotateIndicatorController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      upperBound: 0.5,
    );
    _animationRotateDouble = Tween<double>(begin: 0, end: 1.0)
        .animate(animationRotateIndicatorController);
    setState(() {
      _selectedLanguage = "English";
    });

    generateWidgetLanguage();
  }

  late AnimationController animationRotateIndicatorController;
  late Animation<double> _animationRotateDouble;

  double _containerHeight = 50;

  String? _selectedLanguage = "English";

  List<Widget> listWidgetLanguage = [];
  void generateWidgetLanguage() {
    for (int i = 0; i < listLanguage.length; i++) {}
  }

  int selectedIndex = 0;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 75.h, bottom: 15.h),
                    child: ImageRounded(
                      "assets/img/img_intersection_1.png",
                      30,
                      width: double.infinity,
                      heigth: 200,
                      borderradius: BorderRadius.circular(20),
                    ),
                  ),
                  ComponentTextDescription(tr("intro_tittle"),
                      fontSize: size.sizeTextHeaderGlobal),
                  SizedBox(
                    height: 0.h,
                  ),
                  Stack(
                    children: [
                      Stack(children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              margin: EdgeInsets.only(top: 140.h, bottom: 10),
                              child: ButtonSmall(
                                nameButton: "next",
                                routeName: PageSelectLogin.routeName.toString(),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (animationRotateIndicatorController.status ==
                                AnimationStatus.completed) {
                              animationRotateIndicatorController.reverse(
                                  from: 0.5);
                            } else {
                              animationRotateIndicatorController.forward(
                                  from: 0.0);
                            }
                            double screenHeight =
                                MediaQuery.of(context).size.height;
                            double containerHeight = screenHeight * 0.278;

                            if (_containerHeight <= 90) {
                              setState(() {
                                _containerHeight += containerHeight;
                              });
                            } else {
                              setState(() {
                                _containerHeight -= containerHeight;
                              });
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            margin: EdgeInsets.only(top: 8.h),
                            height: _containerHeight.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              color: ListColor.colorDropDown,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  left: 10.w,
                                  right: 10.w,
                                ),
                                child: Stack(
                                  children: [
                                    ComponentTextDescription(
                                      _selectedLanguage,
                                      fontSize: size.sizeTextHeaderGlobal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    UtilLocalization.checkLocalization(context)
                                                .toString() ==
                                            "US"
                                        ? Positioned(
                                            right: 1,
                                            child: RotationTransition(
                                              turns:
                                                  animationRotateIndicatorController,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
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
                                                  animationRotateIndicatorController,
                                              child: Image.asset(
                                                "assets/icon/ic_drop_down_chose.png",
                                                width: 20.w,
                                                height: 20.h,
                                              ),
                                            ),
                                          ),
                                    Container(
                                      color: ListColor.backgroundBack,
                                      margin: EdgeInsets.only(top: 40),
                                      padding:
                                          EdgeInsets.only(right: 5, left: 5),
                                      child: Scrollbar(
                                          thickness: 6,
                                          thumbVisibility: true,
                                          trackVisibility: true,
                                          radius: Radius.circular(30),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            itemCount: listLanguage.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                splashColor: Colors
                                                    .blue, // Change the splash color here
                                                highlightColor: Colors
                                                    .green, // Change the highlight color here

                                                onTap: () {
                                                  //select language
                                                  print("set lang");
                                                  setState(() {
                                                    _selectedLanguage =
                                                        listLanguage[index]
                                                            .nameLanguage;
                                                    EasyLocalization.of(
                                                            context)!
                                                        .setLocale(Locale(
                                                      listLanguage[index]
                                                          .id
                                                          .toString(),
                                                      listLanguage[index]
                                                          .lang
                                                          .toString(),
                                                    ));
                                                    Get.updateLocale(Locale(
                                                      listLanguage[index]
                                                          .id
                                                          .toString(),
                                                      listLanguage[index]
                                                          .lang
                                                          .toString(),
                                                    ));
                                                  });
                                                  //EasyLocalization.of(context)
                                                  selectedIndex = index;
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
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ComponentTextDescription(
                                                            listLanguage[index]
                                                                .nameLanguage,
                                                            fontSize:
                                                                size.sizeTextDescriptionGlobal +
                                                                    5,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          SizedBox()
                                                          // Padding(
                                                          //   padding: EdgeInsets
                                                          //       .symmetric(
                                                          //           vertical: 2.h,
                                                          //           horizontal:
                                                          //               10),
                                                          //   child: Container(
                                                          //     decoration: BoxDecoration(
                                                          //         color: selectedIndex ==
                                                          //                 index
                                                          //             ? Colors
                                                          //                 .purple
                                                          //             : Colors
                                                          //                 .white,
                                                          //         borderRadius:
                                                          //             BorderRadius
                                                          //                 .circular(
                                                          //                     5.0),
                                                          //         border: Border.all(
                                                          //             color: Colors
                                                          //                 .black,
                                                          //             width: size
                                                          //                 .sizeBorderBlackGlobal)),
                                                          //     width: 25.w,
                                                          //     height: 25.h,
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
                                margin: EdgeInsets.only(left: 30),
                                color: ListColor.colorDropDown,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  child: ComponentTextDescription(
                                    tr("changeLanguage"),
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.sizeTextDescriptionGlobal,
                                  ),
                                ))),
                      ]),
                      SizedBox(
                        height: 35.h,
                      ),
                    ],
                  ),
                  BottomPageIndicator(),
                  SizedBox(
                    height: 0.h,
                  )
                ],
              ),
            )),
          ),
        );
      },
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
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 40.w,
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
          width: 15.w,
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

class ImageRounded extends StatelessWidget {
  String imageAssets;
  int circularRadius;
  double width;
  double heigth;
  BorderRadius borderradius;

  ImageRounded(this.imageAssets, this.circularRadius,
      {required this.width, required this.heigth, required this.borderradius});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderradius,
        border: Border.all(
          color: Colors.black,
          width: size.sizeBorderBlackGlobal,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderradius,
        child: Image.asset(
          imageAssets,
          width: this.width.w,
          height: this.heigth.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
