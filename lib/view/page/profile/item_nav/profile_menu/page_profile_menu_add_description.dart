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

class PageProfileMenuAddDescription extends StatefulWidget {
  static String? routeName = "/PageProfileMenuAddDescription";

  @override
  State<PageProfileMenuAddDescription> createState() =>
      _PageProfileMenuAddDescriptionState();
}

class _PageProfileMenuAddDescriptionState
    extends State<PageProfileMenuAddDescription> with TickerProviderStateMixin {
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
          extendBodyBehindAppBar: true, //
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
                        height: 470.h,
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
                                          tr("description"))),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFieldFormMultiLine(
                                    labelText:
                                        "Short Description (max 120 character)",
                                    textEditingControllerEmail:
                                        textEditingControllerShortDescription,
                                    hintText: "test",
                                    minLines: 3,
                                    lengthMax: 120,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFieldFormMultiLine(
                                    labelText:
                                        "Short Description (max 300 character)",
                                    textEditingControllerEmail:
                                        textEditingControllerFullDescription,
                                    hintText: "test",
                                    minLines: 8,
                                    lengthMax: 300,
                                  )
                                ]),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 440.h, left: 20.h, right: 20.h),
                        child: Center(
                            child: ButtonLong(
                          nameButton: "Confirm",
                          routeName: PageProfileMenuAddDescription.routeName
                              .toString(),
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
