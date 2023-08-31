import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingControllerVideoDescription.text =
        dropdownController.videoDescripiton.toString();

    textEditingControllerVideoTittle.text =
        dropdownController.videoTittle.toString();
    textEditingControllerVideoTittle.addListener(() {
      _onTextChangeVideoTittle();
      dropdownController.videoTittle.value =
          textEditingControllerVideoTittle.text;
    });

    textEditingControllerVideoDescription.addListener(() {
      _onTextChangeVideoDescription();
      dropdownController.videoDescripiton.value =
          textEditingControllerVideoDescription.text;
    });

    print("d2 : ${dropdownController.grades}");

    print("d3 : ${dropdownController.mainLanguage}");

    print("d4 : ${dropdownController.subject}");
  }

  bool _isTextFieldVideoTittleEmpty = true;
  bool _isTextFieldVideoDescriptionEmpty = true;
  bool _isMinimumCharacterVideoTittle = false;
  bool _isMinimumCharacterVideoDescription = false;

  void _onTextChangeVideoTittle() {
    setState(() {
      _isTextFieldVideoTittleEmpty =
          textEditingControllerVideoTittle.text.isEmpty;
      if (textEditingControllerVideoTittle.text.length >= 5) {
        _isMinimumCharacterVideoTittle = true;
      } else {
        _isMinimumCharacterVideoTittle = false;
      }
    });
    print(_isMinimumCharacterVideoTittle);

    print("Value bool ${_isMinimumCharacterVideoTittle}");
  }

  void _onTextChangeVideoDescription() {
    setState(() {
      _isTextFieldVideoDescriptionEmpty =
          textEditingControllerVideoDescription.text.isEmpty;

      if (textEditingControllerVideoDescription.text.length >= 20) {
        _isMinimumCharacterVideoDescription = true;
      } else {
        _isMinimumCharacterVideoDescription = false;
      }
    });
    print("Value bool  data ${_isMinimumCharacterVideoDescription}");
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
      appBar: AppBarPageVideoSecond(
          _isMinimumCharacterVideoDescription == true &&
                  _isMinimumCharacterVideoTittle == true
              ? ListColor.colorbuttonPageVideoDescriptionEnabled
              : Colors.grey),
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
                                    height: 55.h,
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
                                            "Countries : ${dropdownController.listItemSelectedByUser[0].join(",")}",
                                            fontSize:
                                                size.sizeTextDescriptionGlobal -
                                                    2.sp,
                                            teksColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            isWrappedText: true,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          ComponentTextDescription(
                                            "Language: ${dropdownController.mainLanguage.value}",
                                            fontSize:
                                                size.sizeTextDescriptionGlobal -
                                                    2.sp,
                                            teksColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            isWrappedText: true,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          ComponentTextDescription(
                                            "Grade: ${dropdownController.listItemSelectedByUser[1].join(",")}",
                                            fontSize:
                                                size.sizeTextDescriptionGlobal -
                                                    2.sp,
                                            teksColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            isWrappedText: true,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          ComponentTextDescription(
                                            "Subject: ${dropdownController.subject.value}",
                                            fontSize:
                                                size.sizeTextDescriptionGlobal -
                                                    2.sp,
                                            teksColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            isWrappedText: true,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          ComponentTextDescription(
                                            "Topic: ${dropdownController.listItemSelectedByUser[2].join(",")}",
                                            fontSize:
                                                size.sizeTextDescriptionGlobal -
                                                    2.sp,
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
                                    hintStyle: GoogleFonts.nunito(
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                      color: ListColor
                                          .colorOutlineTextFieldWhenEmpty,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  TextFieldFormMultiLine(
                                    minCharacterHint: 20,
                                    hintStyle: GoogleFonts.nunito(
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                      color: ListColor
                                          .colorOutlineTextFieldWhenEmpty,
                                    ),
                                    labelText:
                                        "Video Description (90 character max)",
                                    textEditingControllerEmail:
                                        textEditingControllerVideoDescription,
                                    hintText: "Video Description",
                                    minLines: 5,
                                    lengthMax: 90,
                                  ),
                                  SizedBox(height: 40.h),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 50.h, left: 20.w, right: 20.w),
                      margin:
                          EdgeInsets.only(top: 487.h, left: 20.h, right: 20.h),
                      child: Center(
                          child: ButtonLongForm(
                        nameButton: "Next",
                        routeName:
                            PageProfileMenuSelectLanguage.routeName.toString(),
                        formKey: _formKey,
                        heightLongHeader: 40.h,
                        onClickButton: () {
                          Navigator.pushNamed(
                              context, PagePlayground.routeName.toString());
                        },
                        colorButton: _isMinimumCharacterVideoDescription ==
                                    true &&
                                _isMinimumCharacterVideoTittle == true
                            ? ListColor.colorbuttonPageVideoDescriptionEnabled
                            : ListColor.colorbuttonPageVideoDescriptionDisabled,
                      )),
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
