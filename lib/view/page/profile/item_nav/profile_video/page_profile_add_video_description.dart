import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teacher_mobile_app/controller/account_user_controller.dart';
import 'package:teacher_mobile_app/res/border/divider_global.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/font/font_type.dart';
import 'package:teacher_mobile_app/view/component/appbar/app_bar.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_select_language.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_playgorund.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_add_video_category.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

class PageProfileAddVideoDescription extends StatefulWidget {
  static String? routeName = "/PageProfileAddVideoDescription";

  @override
  State<PageProfileAddVideoDescription> createState() =>
      _PageProfileAddVideoDescriptionState();
}

class _PageProfileAddVideoDescriptionState
    extends State<PageProfileAddVideoDescription>
    with TickerProviderStateMixin {
  TextEditingController textEditingControllerVideoTittle =
      TextEditingController();
  TextEditingController textEditingControllerVideoDescription =
      TextEditingController();

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
  }

  Color? buttonColor;
  final DropdownController dropdownController = Get.put(DropdownController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Color.fromARGB(255, 38, 6, 77),
          systemNavigationBarIconBrightness: Brightness.light));
    }
    return Scaffold(
      appBar: AppBarPageVideo(dropdownController.buttonColor.value),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 6, 76), // #08F4F9
              Color.fromARGB(255, 64, 10, 150), // #B988FF
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Stack(
                  children: [
                    Container(
                      height: 490.h,
                      margin: EdgeInsets.only(
                          left: size.sizePaddingLeftAndRightPage.w,
                          right: size.sizePaddingLeftAndRightPage.w,
                          top: 20.h),
                      decoration: BoxDecoration(
                        color: ListColor
                            .colorCardBaseNewVideo, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                        border: Border.all(
                          color:
                              Colors.black, // Warna garis tepi (outline) hitam
                          width: 2.0, // Ketebalan garis tepi
                        ),
                        borderRadius: BorderRadius.circular(size
                            .sizeRoundedGlobal
                            .r), // Sudut melengkung sebesar 30 unit
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.sizePaddingLeftAndRightPage.h,
                        ),
                        child: SingleChildScrollView(
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
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ListColor
                                          .colorCardHeaderVideo, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                                      padding: EdgeInsets.all(
                                          size.sizePaddingLeftAndRightPage.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ComponentTextDescription(
                                            "Countries : ${dropdownController.targetCountry}",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            isWrappedText: true,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          ComponentTextDescription(
                                            "Language: ${dropdownController.mainLanguage}",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            isWrappedText: true,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          ComponentTextDescription(
                                            "Grade: ${dropdownController.grades}",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            isWrappedText: true,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          ComponentTextDescription(
                                            "Subject: ${dropdownController.subject}",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            isWrappedText: true,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          ComponentTextDescription(
                                            "Topic: ${dropdownController.topics}",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            isWrappedText: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  TextFieldFormMultiLine(
                                    minCharacterHint: 5,
                                    labelText:
                                        "Video tittle ( 5 to 30 characters) ",
                                    textEditingControllerEmail:
                                        textEditingControllerVideoTittle,
                                    hintText: "Short tittle",
                                    minLines: 2,
                                    lengthMax: 30,
                                  ),
                                  SizedBox(height: 20.h),
                                  TextFieldFormMultiLine(
                                    minCharacterHint: 90,
                                    labelText:
                                        "Video Description (90 character max)",
                                    textEditingControllerEmail:
                                        textEditingControllerVideoDescription,
                                    hintText: "Short tittle",
                                    minLines: 5,
                                    lengthMax: 90,
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Container(
                        padding: EdgeInsets.only(
                            bottom: 50.h, left: 20.w, right: 20.w),
                        margin: EdgeInsets.only(
                            top: 487.h, left: 20.h, right: 20.h),
                        child: Center(
                            child: ButtonLongForm(
                          nameButton: "Next",
                          routeName: PageProfileMenuSelectLanguage.routeName
                              .toString(),
                          formKey: _formKey,
                          heightLongHeader: 40.h,
                          onClickButton: () {
                            Navigator.pushNamed(
                                context, PagePlayground.routeName.toString());
                          },
                          colorButton: dropdownController.buttonColor.value,
                        )),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                                child: ButtonLongHeader(
                              nameButton: "Video Description",
                              routeName: "",
                              heightLongHeader: 10.h,
                              colorButton: ListColor.colorCardHeaderVideo,
                              fontWeight: FontWeight.bold,
                              colorFont: Colors.white,
                            ))))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool myCourseSelected = false;

  void toggleTabs() {
    setState(() {
      myCourseSelected = !myCourseSelected;
    });
  }

  final List<String> itemNames = ['student', 'views', 'videos', 'quizzes'];
}