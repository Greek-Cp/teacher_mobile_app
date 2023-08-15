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
import 'package:teacher_mobile_app/view/component/appbar/app_bar.dart';
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
  final _formKey = GlobalKey<FormState>();
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
                        child: Form(
                          key: _formKey,
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
                                      height: 40.h,
                                    ),
                                    DropDownWidgetChooseCountry(
                                      textEditingControllerDropDown:
                                          textEditingControllerSelectCountry,
                                      initialValueDropDown: "Country",
                                      containerHeight: 50,
                                      labelText: "Choose a Country",
                                      listData: countryCodes,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Center(
                                      child: ButtonLongForm(
                                        nameButton: "Send",
                                        routeName: PageProfileMenuAddPhoneNumber
                                            .routeName
                                            .toString(),
                                        formKey: _formKey,
                                        colorButton:
                                            Color.fromARGB(255, 114, 87, 216),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        ComponentTextDescription("Verification",
                                            fontSize:
                                                size.sizeTextDescriptionGlobal),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        ComponentTextDescription(
                                          "5 Digit Pin has been sent to: number_phone}",
                                          fontSize:
                                              size.sizeTextDescriptionGlobal,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        OtpTextField(
                                          numberOfFields: 5,
                                          fieldWidth: 50.0.w,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 2.h),
                                          borderColor: Colors.black,
                                          //set to true to show as box or false to show as dash
                                          showFieldAsBox: true,
                                          //runs when a code is typed in
                                          onCodeChanged: (String code) {
                                            //handle validation or checks here
                                          },
                                          fillColor: ListColor
                                              .colorBackgroundTextFieldAll,
                                          filled: true,
                                          enabledBorderColor: Colors.black,
                                          //runs when every textfield is filled
                                          onSubmit: (String verificationCode) {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "Verification Code"),
                                                    content: Text(
                                                        'Code entered is $verificationCode'),
                                                  );
                                                });
                                          }, // end onSubmit
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        ComponentTextDescription(
                                          "minutes:seconds",
                                          fontSize:
                                              size.sizeTextHeaderGlobal - 2,
                                          teksColor:
                                              Color.fromARGB(255, 114, 87, 215),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        /*
                                        30 second
                                        */
                                        // ComponentTextDescription(
                                        //     "Didn't Receive Code ?",
                                        //     fontSize:
                                        //         size.sizeTextDescriptionGlobal),
                                        // ComponentTextDescription(
                                        //   "Resend Code",
                                        //   teksColor: ListColor.colorVerified,
                                        //   fontSize:
                                        //       size.sizeTextDescriptionGlobal,
                                        //   textAlign: TextAlign.center,
                                        //   fontWeight: FontWeight.bold,
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ]),
                            ),
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
            ),
          ),
        );
      },
    );
  }
}
