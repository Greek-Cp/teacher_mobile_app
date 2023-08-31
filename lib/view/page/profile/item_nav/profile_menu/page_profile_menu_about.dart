import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
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
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_add_video_description.dart';

class PageProfileMenuAbout extends StatefulWidget {
  static String? routeName = "/PageProfileMenuAbout";

  @override
  State<PageProfileMenuAbout> createState() => _PageProfileMenuAboutState();
}

class _PageProfileMenuAboutState extends State<PageProfileMenuAbout>
    with SingleTickerProviderStateMixin {
  TextEditingController textEditingControllerFirstName =
      TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  String lang = UtilLocalization.checkLocalization.toString();
  TextEditingController textEditingControllerSelectCountry =
      TextEditingController();
  late AnimationController animationControllerDropDownSelectCountry;
  int containerHeight = 545;
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
    animationControllerDropDownSelectCountry = AnimationController(
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
  int marginContainer = 0;
  int marginConfirm = 0;
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
      extendBodyBehindAppBar:
          true, // Extend the body behind the AppBar to show the blur effect
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
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Scrollbar(
                        thickness: 2.5,
                        thumbVisibility: true,
                        trackVisibility: true,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.sizeFieldText.h),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Center(
                                        child:
                                            ComponentTextTittle(tr("about"))),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        TextFieldForm(
                                            textEditingControllerEmail:
                                                textEditingControllerFirstName,
                                            hintText: "first_name",
                                            labelText: "first_name"),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        TextFieldForm(
                                            textEditingControllerEmail:
                                                textEditingControllerLastName,
                                            hintText: "last_name",
                                            labelText: "last_name"),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // containerHeight += 50;x
                                            });
                                          },
                                          child: DropDownWidget(
                                            textEditingControllerDropDown:
                                                textEditingControllerSelectCountry,
                                            initialValueDropDown:
                                                "select_a_country",
                                            containerHeight: 50,
                                            labelText: "country_of_residence",
                                            listData: countryOfResidenceList,
                                          ),
                                        ),
                                        // TextFieldFormPhone(
                                        //     textEditingControllerEmail:
                                        //         textEditingControllerLastName,
                                        //     hintText: "phoneNumber",
                                        //     labelText: "phone"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: marginConfirm.h, left: 20.h, right: 20.h),
                    child: Center(
                        child: ButtonLongForm(
                      nameButton: "confirm",
                      onClickButton: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    PageProfileAddVideoDescription()));
                      },
                      routeName: PageProfileMenuAbout.routeName.toString(),
                      formKey: _formKey,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
