import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/models/CountryCode.dart';
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

class PageProfileMenuAddPhoneNumber extends StatefulWidget {
  static String? routeName = "/PageProfileMenuAddPhoneNumber";

  @override
  State<PageProfileMenuAddPhoneNumber> createState() =>
      _PageProfileMenuAddPhoneNumberState();
}

class _PageProfileMenuAddPhoneNumberState
    extends State<PageProfileMenuAddPhoneNumber> with TickerProviderStateMixin {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  String lang = UtilLocalization.checkLocalization.toString();
  late AnimationController animationControllerDropDownSelectCountry;
  TextEditingController textEditingControllerSelectCountry =
      TextEditingController();
  List<CountryCode> countryCodes = [
    CountryCode('🇺🇸', 'United States', '+1'),
    CountryCode('🇬🇧', 'United Kingdom', '+44'),
    CountryCode('🇨🇦', 'Canada', '+1'),
    CountryCode('🇦🇺', 'Australia', '+61'),
    CountryCode('🇩🇪', 'Germany', '+49'),
    CountryCode('🇯🇵', 'Japan', '+81'),
    CountryCode('🇧🇷', 'Brazil', '+55'),
    CountryCode('🇮🇳', 'India', '+91'),
    CountryCode('🇫🇷', 'France', '+33'),
    CountryCode('🇮🇹', 'Italy', '+39'),
    CountryCode('🇪🇸', 'Spain', '+34'),
    CountryCode('🇨🇳', 'China', '+86'),
    CountryCode('🇷🇺', 'Russia', '+7'),
    CountryCode('🇿🇦', 'South Africa', '+27'),
    CountryCode('🇲🇽', 'Mexico', '+52'),
  ];
  @override
  void initState() {
    super.initState();
    animationControllerDropDownSelectCountry = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      upperBound: 0.5,
    );
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonBackArrow(
                    onPressed: () {
                      Navigator.of(context);
                    },
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 450.h,
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
                              horizontal: size.sizePaddingLeftAndRightPage.h),
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  DropDownWidgetChooseCountry(
                                    animationRotateIndicatorController:
                                        animationControllerDropDownSelectCountry,
                                    textEditingControllerDropDown:
                                        textEditingControllerSelectCountry,
                                    initialValueDropDown:
                                        "Select Phone Number Country",
                                    containerHeight: 50,
                                    labelText: "Choose a Country",
                                    listData: countryCodes,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ComponentTextDescription("textContent",
                                          fontSize:
                                              size.sizeTextDescriptionGlobal),
                                      OtpTextField(
                                        numberOfFields: 5,

                                        borderColor: Colors.black,
                                        //set to true to show as box or false to show as dash
                                        showFieldAsBox: true,
                                        //runs when a code is typed in
                                        onCodeChanged: (String code) {
                                          //handle validation or checks here
                                        },
                                        //runs when every textfield is filled
                                        onSubmit: (String verificationCode) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      Text("Verification Code"),
                                                  content: Text(
                                                      'Code entered is $verificationCode'),
                                                );
                                              });
                                        }, // end onSubmit
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 420.h, left: 20.r, right: 20.r),
                        child: Center(
                            child: ButtonLong(
                          nameButton: "Confirm",
                          routeName: PageProfileMenuAddPhoneNumber.routeName
                              .toString(),
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
