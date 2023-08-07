import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/border/divider_global.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/appbar/app_bar.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/button_small.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/button/widget_different_login.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_select_language.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_select_login.dart';

class PageProfileMenuAddVideos extends StatefulWidget {
  static String? routeName = "/PageProfileMenuAddVideos";

  @override
  State<PageProfileMenuAddVideos> createState() =>
      _PageProfileMenuAddVideosState();
}

class _PageProfileMenuAddVideosState extends State<PageProfileMenuAddVideos>
    with TickerProviderStateMixin {
  TextEditingController textEditingControllerShortDescription =
      TextEditingController();
  TextEditingController textEditingControllerFullDescription =
      TextEditingController();

  String lang = UtilLocalization.checkLocalization.toString();

  TextEditingController textEditingControllerSelectCountry =
      TextEditingController();
  late AnimationController animationControllerSelectLanguage;
  late AnimationController animationControllerTutoringLanguage;
  late AnimationController animationControllerYear;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // labelText = tr("select_a_country");
    // textEditingControllerChooseLanguage.text = labelText.toString();
    // animationRotateIndicatorController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 500),
    //   upperBound: 0.5,
    // );
    // _animationRotateDouble = Tween<double>(begin: 0, end: 1.0)
    //     .animate(animationRotateIndicatorController);
    // setState(() {
    //   _selectedLanguage = "English";
    // });

    animationControllerSelectLanguage = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);

    animationControllerTutoringLanguage = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);
    animationControllerYear = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);
  }

  final List<String> countryOfResidenceList = [
    "Indonesia",
    "United States",
    "Canada",
    "United Kingdom",
    "Australia",
    "Germany",
    "France",
    "Japan",
    "South Korea",
    "Brazil",
    "India",
    "Russia",
    "South Africa",
    "Spain",
    "Italy",
    // Tambahkan negara-negara lain sesuai kebutuhan Anda
  ];
  String requirements = """
Requirements
- 30 to 1min.
- Vertical orientation (9:16), HD
- Good lighting
- Clear sound
- No shaking
- Clear communication
- Warm welcome
""";
  int marginConfirm = 60;
  List<Widget> listWidget = [];
  int indexLanguage = 1;
  int indexTutoringLanguage = 2;

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
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          appBar: AppBarGlobal(),
           extendBodyBehindAppBar:
              true, // 
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
            child: Padding(
              padding: EdgeInsets.symmetric(
            horizontal: size.sizePaddingLeftAndRightPage.h,
              ),
              child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  Container(
                    height: 550.h,
                    decoration: BoxDecoration(
                      color: Colors
                          .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                      border: Border.all(
                        color: Colors
                            .black, // Warna garis tepi (outline) hitam
                        width: 2.0, // Ketebalan garis tepi
                      ),
                      borderRadius: BorderRadius.circular(size
                          .sizeRoundedGlobal
                          .r), // Sudut melengkung sebesar 30 unit
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.sizeFieldText.h),
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: 30.h,
                              ),
                              Center(
                                  child: ComponentTextTittle(
                                      tr("videos_english"))),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Center(
                                  child: ComponentTextDescription(
                                tr("1_intro_video"),
                                fontSize: size.sizeTextHeaderGlobal,
                                fontWeight: FontWeight.bold,
                              )),
                              Center(
                                  child: ComponentTextDescription(
                                tr("introduce_yourself_to_the_students"),
                                fontSize: size.sizeTextDescriptionGlobal,
                                fontWeight: FontWeight.bold,
                              )),
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 30.h),
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                                      border: Border.all(
                                        color: Colors
                                            .black, // Warna garis tepi (outline) hitam
                                        width: 2.0, // Ketebalan garis tepi
                                      ),
                                      borderRadius: BorderRadius.circular(size
                                          .sizeRoundedGlobal
                                          .r), // Sudut melengkung sebesar 30 unit
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.h),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 60.h,
                                            ),
                                            ComponentTextDescription(
                                              tr("$requirements"),
                                              fontSize: size
                                                  .sizeTextDescriptionGlobal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize:
                                                  MainAxisSize.max,
                                              children: [
                                                Column(
                                                  children: [
                                                    Card(
                                                      child: Container(
                                                        width: 110.w,
                                                        height: 150.h,
                                                      ),
                                                    ),
                                                    ComponentTextDescription(
                                                        "Video",
                                                        fontSize: size
                                                            .sizeTextDescriptionGlobal)
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Card(
                                                      child: Container(
                                                        width: 110.w,
                                                        height: 150.h,
                                                      ),
                                                    ),
                                                    ComponentTextDescription(
                                                        "Thumbnail",
                                                        fontSize: size
                                                            .sizeTextDescriptionGlobal)
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40.h,
                                            )
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.h),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Center(
                                          child: Card(
                                            color: ListColor
                                                .backgroundColorVerified,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.r),
                                                side: BorderSide(
                                                    width: size
                                                        .sizeBorderBlackGlobal,
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                children: [
                                                  ComponentTextDescription(
                                                    "Status: ",
                                                    fontSize: size
                                                        .sizeTextDescriptionGlobal,
                                                    teksColor: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                  ComponentTextDescription(
                                                    "Verified",
                                                    fontSize: size
                                                        .sizeTextDescriptionGlobal,
                                                    teksColor: ListColor
                                                        .colorVerified,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Center(
                                  child: ComponentTextDescription(
                                tr("2_intro_video"),
                                fontSize: size.sizeTextHeaderGlobal,
                                fontWeight: FontWeight.bold,
                              )),
                              Center(
                                  child: ComponentTextDescription(
                                tr("Display an example of your teaching skills to potential students through real example."),
                                fontSize: size.sizeTextDescriptionGlobal,
                                fontWeight: FontWeight.bold,
                              )),
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 30.h),
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                                      border: Border.all(
                                        color: Colors
                                            .black, // Warna garis tepi (outline) hitam
                                        width: 2.0, // Ketebalan garis tepi
                                      ),
                                      borderRadius: BorderRadius.circular(size
                                          .sizeRoundedGlobal
                                          .r), // Sudut melengkung sebesar 30 unit
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.h),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 60.h,
                                            ),
                                            ComponentTextDescription(
                                              tr("$requirements"),
                                              fontSize: size
                                                  .sizeTextDescriptionGlobal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize:
                                                  MainAxisSize.max,
                                              children: [
                                                Column(
                                                  children: [
                                                    Card(
                                                      child: Container(
                                                        width: 110.w,
                                                        height: 150.h,
                                                      ),
                                                    ),
                                                    ComponentTextDescription(
                                                        "Video",
                                                        fontSize: size
                                                            .sizeTextDescriptionGlobal)
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Card(
                                                      child: Container(
                                                        width: 110.w,
                                                        height: 150.h,
                                                      ),
                                                    ),
                                                    ComponentTextDescription(
                                                        "Thumbnail",
                                                        fontSize: size
                                                            .sizeTextDescriptionGlobal)
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40.h,
                                            )
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.h),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Center(
                                          child: Card(
                                            color: ListColor
                                                .colorBackgroundConfirmToSaveChanges,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.r),
                                                side: BorderSide(
                                                    width: size
                                                        .sizeBorderBlackGlobal,
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                children: [
                                                  ComponentTextDescription(
                                                    "Status: ",
                                                    fontSize: size
                                                        .sizeTextDescriptionGlobal,
                                                    teksColor: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                  ComponentTextDescription(
                                                    "modifications needed",
                                                    fontSize: size
                                                        .sizeTextDescriptionGlobal,
                                                    teksColor: ListColor
                                                        .colorVerified,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              DividerGlobal(),
                              Center(
                                  child: ComponentTextDescription(
                                tr("Videos-French"),
                                fontSize: size.sizeTextHeaderGlobal,
                                fontWeight: FontWeight.bold,
                              )),
                              Center(
                                  child: ComponentTextDescription(
                                tr("Introduce yourself to the students."),
                                fontSize: size.sizeTextDescriptionGlobal,
                                fontWeight: FontWeight.bold,
                              )),
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 30.h),
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                                      border: Border.all(
                                        color: Colors
                                            .black, // Warna garis tepi (outline) hitam
                                        width: 2.0, // Ketebalan garis tepi
                                      ),
                                      borderRadius: BorderRadius.circular(size
                                          .sizeRoundedGlobal
                                          .r), // Sudut melengkung sebesar 30 unit
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.h),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 60.h,
                                            ),
                                            ComponentTextDescription(
                                              tr("$requirements"),
                                              fontSize: size
                                                  .sizeTextDescriptionGlobal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize:
                                                  MainAxisSize.max,
                                              children: [
                                                Column(
                                                  children: [
                                                    Card(
                                                      child: Container(
                                                        width: 110.w,
                                                        height: 150.h,
                                                      ),
                                                    ),
                                                    ComponentTextDescription(
                                                        "Video",
                                                        fontSize: size
                                                            .sizeTextDescriptionGlobal)
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Card(
                                                      child: Container(
                                                        width: 110.w,
                                                        height: 150.h,
                                                      ),
                                                    ),
                                                    ComponentTextDescription(
                                                        "Thumbnail",
                                                        fontSize: size
                                                            .sizeTextDescriptionGlobal)
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40.h,
                                            )
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.h),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Center(
                                          child: Card(
                                            color: Color.fromARGB(
                                                255, 12, 131, 175),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.r),
                                                side: BorderSide(
                                                    width: size
                                                        .sizeBorderBlackGlobal,
                                                    color: Colors.black)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                children: [
                                                  ComponentTextDescription(
                                                    "Status: ",
                                                    fontSize: size
                                                        .sizeTextDescriptionGlobal,
                                                    teksColor: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                  ComponentTextDescription(
                                                    "In Review",
                                                    fontSize: size
                                                        .sizeTextDescriptionGlobal,
                                                    teksColor: ListColor
                                                        .colorVerified,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 520.h, left: 20.h, right: 20.h),
                    child: Center(
                        child: ButtonLong(
                      nameButton: "Confirm",
                      routeName:
                          PageProfileMenuAddVideos.routeName.toString(),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              )
            ],
              ),
            ),
          ),
        );
      },
    );
  }
}
