import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_select_language.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_select_login.dart';

class PageProfileMenuAddEducation extends StatefulWidget {
  static String? routeName = "/PageProfileMenuAddEducation";

  @override
  State<PageProfileMenuAddEducation> createState() =>
      _PageProfileMenuAddEducationState();
}

class _PageProfileMenuAddEducationState
    extends State<PageProfileMenuAddEducation> with TickerProviderStateMixin {
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
                horizontal: size.sizePaddingLeftAndRightPage.h,
              ),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonBackArrow(
                        onPressed: () {
                          Navigator.of(context);
                        },
                      ),
                      ConfirmToSaveChanges()
                    ],
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
                          borderRadius: BorderRadius.circular(
                              30.0.r), // Sudut melengkung sebesar 30 unit
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                                          tr("your_teaching_experiences"))),
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
                                  DropDownWidget(
                                    animationRotateIndicatorController:
                                        animationControllerSelectLanguage,
                                    textEditingControllerDropDown:
                                        textEditingControllerSelectCountry,
                                    initialValueDropDown: "selet_experience",
                                    containerHeight: 50,
                                    labelText: tr("experience") + " 1",
                                    listData: countryOfResidenceList,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  DropDownWidget(
                                    animationRotateIndicatorController:
                                        animationControllerTutoringLanguage,
                                    textEditingControllerDropDown:
                                        textEditingControllerSelectCountry,
                                    initialValueDropDown:
                                        tr("select_experienye_in_years"),
                                    containerHeight: 50,
                                    labelText:
                                        tr("select_length_of_this_experi") +
                                            " 2",
                                    listData: countryOfResidenceList,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.h, vertical: 10.h),
                                    child: Divider(
                                      color: Colors.black,
                                      height: 3.h,
                                      thickness: 3.h,
                                    ),
                                  ),
                                  ...listWidget,
                                  GestureDetector(
                                    onTap: () {
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
                                      indexLanguage += 2;
                                      indexTutoringLanguage += 2;
                                      setState(() {
                                        listWidget.addAll([
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Column(
                                            children: [
                                              DropDownWidget(
                                                animationRotateIndicatorController:
                                                    animationControllerSelectLanguageList,
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
                                                animationRotateIndicatorController:
                                                    animationControllerSelectLanguageListTwo,
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
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.h,
                                                    vertical: 10.h),
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 3.h,
                                                  thickness: 3.h,
                                                ),
                                              ),
                                            ],
                                          )
                                        ]);
                                      });
                                    },
                                    child: ComponentTextDescription(
                                        "+ Add another Language",
                                        teksColor: const Color.fromARGB(
                                            255, 17, 68, 109),
                                        fontSize:
                                            size.sizeTextDescriptionGlobal),
                                  ),
                                  SizedBox(
                                    height: 60.h,
                                  )
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
                              PageProfileMenuAddEducation.routeName.toString(),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
