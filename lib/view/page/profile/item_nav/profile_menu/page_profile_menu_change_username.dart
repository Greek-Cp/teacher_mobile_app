import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/controller/account_user_controller.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/appbar/app_bar.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/button_small.dart';
import 'package:teacher_mobile_app/view/component/button/jenis_button.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/button/widget_different_login.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_about.dart';

class PageProfileMenuChangeUsername extends StatefulWidget {
  static String? routeName = "/PageProfileMenuChangeUsername";

  @override
  State<PageProfileMenuChangeUsername> createState() =>
      _PageProfileMenuChangeUsernameState();
}

class _PageProfileMenuChangeUsernameState
    extends State<PageProfileMenuChangeUsername> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  String lang = UtilLocalization.checkLocalization.toString();
  List<ModelValidationTextField> listModelValidationUsername =
      RepositoryValidation().listModelValidationUsername;
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
    marginContainer = 260;
    marginConfirm = 235;
    // textEditingControllerEmail.text =
    //     accountController.obsAccountUser.value.detailUser!.Username.toString();
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
  //AccountUserController accountController = Get.find<AccountUserController>();
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
                                    child: ComponentTextTittle(
                                        tr("Change Username"))),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFieldFormWithValidation(
                                      textEditingControllerEmail:
                                          textEditingControllerEmail,
                                      labelText: "username",
                                      hintText: "username",
                                      listModelValidation:
                                          listModelValidationUsername,
                                      requestTypeValidation: "username",
                                    ),
                                    // TextFieldFormPhone(
                                    //     textEditingControllerEmail:
                                    //         textEditingControllerLastName,
                                    //     hintText: "phoneNumber",
                                    //     labelText: "phone"),
                                  ],
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
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
                      routeName: PageProfileMenuAbout.routeName.toString(),
                      formKey: _formKey,
                      onClickButton: () {
                        if (textEditingControllerEmail.text
                            .toString()
                            .isNotEmpty) {
                          // accountController
                          //         .obsAccountUser.value.detailUser!.Username =
                          //     textEditingControllerEmail.text.toString();
                          Get.snackbar("Success", "Change Username Succes");
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return DialogWrong();
                          //     });
                        } else {
                          Get.snackbar("Failed",
                              "Change Username Failed, the data is empty");
                        }
                      },
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

class DialogWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.sizeRoundedGlobal.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: 300.h,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.roundedCircularGlobal),
            boxShadow: [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]),
        child: Column(
          children: [
            LottieBuilder.asset(
              "assets/lottie/animation_wrong.json",
              repeat: false,
              width: 150.h,
              height: 150.h,
            ),
            ComponentTextDescription("Please Fill The Username !",
                fontSize: size.sizeTextDescriptionGlobal.sp)
          ],
        ),
      ),
    );
  }
}
