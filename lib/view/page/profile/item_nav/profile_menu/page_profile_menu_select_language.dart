import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/controller/account_user_controller.dart';
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

class PageProfileMenuSelectLanguage extends StatefulWidget {
  static String? routeName = "/PageProfileMenuSelectLanguage";

  @override
  State<PageProfileMenuSelectLanguage> createState() =>
      _PageProfileMenuSelectLanguageState();
}

class _PageProfileMenuSelectLanguageState
    extends State<PageProfileMenuSelectLanguage> with TickerProviderStateMixin {
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
    marginContainer = 430;
    marginConfirm = 400;
    String lang_1 = controllerAccount.obsAccountUser.value.detailUser
            ?.languageTeachSelectedByUser?.languageTeachSelect[0] ??
        "";
    String lang_2 = controllerAccount.obsAccountUser.value.detailUser
            ?.languageTeachSelectedByUser?.languageTeachSelect[1] ??
        "";
    String lang_3 = controllerAccount.obsAccountUser.value.detailUser
            ?.languageTeachSelectedByUser?.languageTeachSelect[2] ??
        "";

    print("${lang_1} ${lang_2} ${lang_3} data");
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
  AccountUserController controllerAccount = Get.find<AccountUserController>();

  double marginConfirm = 0;
  double marginContainer = 0;
  final _formKey = GlobalKey<FormState>();
  List<Widget> listWidget = [];
  int indexLanguage = 1;
  int limitLanguage = 0;
  int maxLanguage = 2;
  int widgetDropDown = 0;
  bool showTextAddWidget = true;
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
                    height: marginContainer!.h,
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
                        horizontal: size.sizePaddingLeftAndRightPage.h,
                      ),
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
                                  height: 30.h,
                                ),
                                Center(
                                    child: ComponentTextDescription(
                                  tr("languages_you_can_use_to_teach_math"),
                                  fontSize: size.sizeTextHeaderGlobal.sp,
                                  textAlign: TextAlign.center,
                                )),
                                Center(
                                    child: ComponentTextDescription(
                                  tr("you_will_need_to_provide_a_video_presentation_in_each_selected_languages"),
                                  fontSize: size.sizeTextDescriptionGlobal.sp,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                )),
                                SizedBox(
                                  height: 30.h,
                                ),
                                DropDownWidget(
                                  textEditingControllerDropDown:
                                      textEditingControllerSelectCountry,
                                  initialValueDropDown: "select_a_language",
                                  containerHeight: 50,
                                  labelText: tr("language") + " 1",
                                  listData: countryOfResidenceList,
                                ),
                                ...listWidget,
                                SizedBox(
                                  height: 20.h,
                                ),
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

                                    setState(() {
                                      if (limitLanguage == maxLanguage) {
                                        Get.snackbar("Notification",
                                            "You Only Can Add Maximal 3 Language");
                                      } else {
                                        indexLanguage += 1;
                                        limitLanguage += 1;
                                        // marginConfirm += 60;
                                        // marginContainer += 60;
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
                                                      child: DividerGlobal()),
                                                  GestureDetector(
                                                    onTap: () {
                                                      int indxRemoveSelected =
                                                          widgetDropDown;
                                                      setState(() {
                                                        // marginConfirm -= 60;
                                                        // marginContainer -=
                                                        //     60;
                                                        indexLanguage -= 1;
                                                        limitLanguage -= 1;
                                                        limitLanguage -= 1;
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
                                                                vertical: 2.h,
                                                                horizontal:
                                                                    15.w),
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
                                                  )
                                                ],
                                              ),
                                              DropDownWidget(
                                                textEditingControllerDropDown:
                                                    textEditingControllerTutoring,
                                                initialValueDropDown:
                                                    tr("select_a_language"),
                                                containerHeight: 50,
                                                labelText:
                                                    tr("tutoring_language") +
                                                        " " +
                                                        indexLanguage
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
                                      : ComponentTextDescription(
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
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 25.h),
                    margin: EdgeInsets.only(
                        top: marginConfirm.h, left: 20.h, right: 20.h),
                    child: Center(
                        child: ButtonLongForm(
                      nameButton: "Confirm",
                      routeName:
                          PageProfileMenuSelectLanguage.routeName.toString(),
                      formKey: _formKey,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
