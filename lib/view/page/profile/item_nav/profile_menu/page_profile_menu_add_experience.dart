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

class PageProfileMenuAddExperience extends StatefulWidget {
  static String? routeName = "/PageProfileMenuAddExperience";

  @override
  State<PageProfileMenuAddExperience> createState() =>
      _PageProfileMenuAddExperienceState();
}

class _PageProfileMenuAddExperienceState
    extends State<PageProfileMenuAddExperience> with TickerProviderStateMixin {
  TextEditingController textEditingControllerFirstName =
      TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  String lang = UtilLocalization.checkLocalization.toString();
  TextEditingController textEditingControllerSelectCountry =
      TextEditingController();
  late AnimationController animationControllerSelectLanguage;
  late AnimationController animationControllerTutoringLanguage;
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
    marginContainer = 430;
    marginConfirm = 405;
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
  int marginConfirm = 0;
  int marginContainer = 0;
  List<Widget> listWidget = [];
  int indexLanguage = 1;
  int indexTutoringLanguage = 1;
  int limitExpreince = 0;
  int globalContainer = 545;
  int maxLanguage = 2;

  int widgetDropDown = 0;
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
      extendBodyBehindAppBar: true,
      appBar: AppBarGlobal(),
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
            children: [
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  Container(
                    height: marginContainer.h,
                    decoration: BoxDecoration(
                      color: Colors
                          .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                      border: Border.all(
                        color: Colors.black, // Warna garis tepi (outline) hitam
                        width: 2.0, // Ketebalan garis tepi
                      ),
                      borderRadius: BorderRadius.circular(size.sizeRoundedGlobal
                          .r), // Sudut melengkung sebesar 30 unit
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.sizeFieldText.h),
                      child: SingleChildScrollView(
                        physics: PageScrollPhysics(),
                        child: Form(
                          key: _formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: size.marginTopAndBottom.h,
                                ),
                                Center(
                                    child: ComponentTextTittle(
                                        tr("your_teaching_experiences"))),
                                SizedBox(
                                  height: size.marginTopAndBottom.h,
                                ),
                                DropDownWidget(
                                  textEditingControllerDropDown:
                                      textEditingControllerSelectCountry,
                                  initialValueDropDown:
                                      tr("select_experienye_in_years"),
                                  containerHeight: 50,
                                  labelText:
                                      tr("select_length_of_this_experi") + " 2",
                                  listData: countryOfResidenceList,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                DropDownWidget(
                                  textEditingControllerDropDown:
                                      textEditingControllerSelectCountry,
                                  initialValueDropDown:
                                      tr("select_experienye_in_years"),
                                  containerHeight: 50,
                                  labelText:
                                      tr("select_length_of_this_experi") + " 2",
                                  listData: countryOfResidenceList,
                                ),
                                //DividerGlobal(),
                                ...listWidget,
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (limitExpreince == 4) {
                                        Get.snackbar("Notification",
                                            "Maximal Experience Is 5");
                                      } else {
                                        TextEditingController
                                            textEditingControllerLanguage =
                                            TextEditingController();

                                        TextEditingController
                                            textEditingControllerTutoring =
                                            TextEditingController();
                                        AnimationController
                                            animationControllerSelectLanguageList =
                                            AnimationController(
                                                vsync: this,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                upperBound: 0.5);
                                        AnimationController
                                            animationControllerSelectLanguageListTwo =
                                            AnimationController(
                                                vsync: this,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                upperBound: 0.5);
                                        indexLanguage += 1;
                                        // marginConfirm += 60;
                                        // marginContainer += 60;
                                        indexTutoringLanguage += 1;
                                        limitExpreince += 1;
                                        listWidget.addAll([
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: DividerGlobal(),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        // marginConfirm -= 60;
                                                        // marginContainer -=
                                                        //     60;
                                                        indexLanguage -= 1;
                                                        indexTutoringLanguage -=
                                                            1;
                                                        limitExpreince -= 1;
                                                        listWidget.removeAt(0);
                                                      });
                                                    },
                                                    child: Card(
                                                      color: Color.fromARGB(
                                                          255, 214, 214, 214),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.r),
                                                        side: BorderSide(
                                                          width: size
                                                              .sizeBorderBlackGlobal,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 0.h,
                                                                horizontal:
                                                                    15.w),
                                                        child: Center(
                                                          child:
                                                              ComponentTextDescription(
                                                            '\u00D7',
                                                            fontSize:
                                                                size.sizeTextDescriptionGlobal +
                                                                    5.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              DropDownWidget(
                                                textEditingControllerDropDown:
                                                    textEditingControllerLanguage,
                                                initialValueDropDown:
                                                    "select_experience",
                                                containerHeight: 50,
                                                labelText: tr("experience") +
                                                    " " +
                                                    indexLanguage.toString(),
                                                listData:
                                                    countryOfResidenceList,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              DropDownWidget(
                                                textEditingControllerDropDown:
                                                    textEditingControllerTutoring,
                                                initialValueDropDown: tr(
                                                    "select_experienye_in_years"),
                                                containerHeight: 50,
                                                labelText:
                                                    tr("select_length_of_this_experi") +
                                                        " " +
                                                        indexTutoringLanguage
                                                            .toString(),
                                                listData:
                                                    countryOfResidenceList,
                                              ),
                                            ],
                                          )
                                        ]);

                                        widgetDropDown += 1;
                                      }
                                    });
                                  },
                                  child: listWidget.length == maxLanguage
                                      ? Container()
                                      : Padding(
                                          padding: EdgeInsets.only(top: 15.h),
                                          child: ComponentTextDescription(
                                              "+ Add another Experience",
                                              teksColor: const Color.fromARGB(
                                                  255, 17, 68, 109),
                                              fontSize: size
                                                  .sizeTextDescriptionGlobal),
                                        ),
                                ),
                                SizedBox(
                                  height: 60.h,
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: marginConfirm.h, left: 20.h, right: 20.h),
                    child: Center(
                        child: ButtonLongForm(
                      nameButton: "Confirm",
                      routeName:
                          PageProfileMenuAddExperience.routeName.toString(),
                      formKey: _formKey,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
