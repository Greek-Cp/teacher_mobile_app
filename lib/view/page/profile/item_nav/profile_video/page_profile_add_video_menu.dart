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
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_add_video_quiz.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_upload_video.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../../res/border/border.dart';

class PageProfileAddVideoMenu extends StatefulWidget {
  static String? routeName = "/PageProfileAddVideoMenu";

  @override
  State<PageProfileAddVideoMenu> createState() =>
      _PageProfileAddVideoMenuState();
}

class _PageProfileAddVideoMenuState extends State<PageProfileAddVideoMenu>
    with TickerProviderStateMixin {
  TextEditingController textEditingControllerVideoTittle =
      TextEditingController();
  TextEditingController textEditingControllerVideoDescription =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool _isTextFieldVideoTittleEmpty = true;
  bool _isTextFieldVideoDescriptionEmpty = true;
  bool _isMinimumCharacterVideoTittle = false;
  bool _isMinimumCharacterVideoDescription = false;

  Color? buttonColor;
  bool isCheckedBox = false;
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
          ListColor.colorbuttonPageVideoDescriptionEnabled),
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
                      height: 730.h,
                      margin: EdgeInsets.only(
                          left: size.sizePaddingLeftAndRightPage.w,
                          right: size.sizePaddingLeftAndRightPage.w,
                          top: 20.h),
                      decoration: BoxDecoration(
                        color: ListColor
                            .colBackroundColorContainer, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                                SizedBox(height: 20.h),
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.4, // 30% of the screen width
                                    height: MediaQuery.of(context).size.width *
                                        0.4 *
                                        194.7 /
                                        110, // Maintaining the 6:19 aspect ratio
                                    margin: EdgeInsets.only(top: 10.h),
                                    child: Card(
                                      color: ListColor
                                          .colorBackgroundVideoContainer,
                                      shape: BorderApp.border,
                                      child: Container(
                                        child: selectedImageThumbnail == null
                                            ? Container(
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        ComponentTextDescription(
                                                      "",
                                                      fontSize:
                                                          size.sizeTextDescriptionGlobal -
                                                              2.sp,
                                                      textAlign:
                                                          TextAlign.center,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Stack(
                                                // this stack
                                                children: [],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          size.sizePaddingLeftAndRightPage -
                                              3.w),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 229, 248,
                                        252), // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                                    border: Border.all(
                                      color: Colors
                                          .black, // Warna garis tepi (outline) hitam
                                      width: 2.0, // Ketebalan garis tepi
                                    ),
                                    borderRadius: BorderRadius.circular(size
                                        .sizeRoundedGlobal
                                        .r), // Sudut melengkung sebesar 30 unit
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w,
                                                  vertical: 8.h),
                                              child: ComponentTextDescription(
                                                "I agree with Terms and Condition",
                                                fontSize:
                                                    size.sizeTextDescriptionGlobal -
                                                        1.sp,
                                                maxLines: 3,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (isCheckedBox == false) {
                                                  isCheckedBox = true;
                                                } else {
                                                  isCheckedBox = false;
                                                }
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h,
                                                  horizontal: 4.h),
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.only(
                                                    left: 10.h,
                                                    top: 10.h,
                                                    right: 5.h,
                                                    bottom: 10.h),
                                                decoration: BoxDecoration(
                                                    color: isCheckedBox == true
                                                        ? Colors.purple
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0.r),
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: size
                                                            .sizeBorderBlackGlobal)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                PageProfileAddVideoQuiz()));
                                  },
                                  child: CardMenuVideoProfile(
                                      ListColor.backgroundItemRatingCyan,
                                      "Add Quiz",
                                      "(You can do that later)",
                                      true),
                                ),
                                SizedBox(height: 10.h),
                                CardMenuVideoProfile(
                                    Color.fromARGB(255, 110, 186, 249),
                                    "Link to a\nstudyo Math activity",
                                    "",
                                    false),
                                SizedBox(height: 10.h),
                                CardMenuVideoProfile(
                                    Color.fromARGB(255, 145, 252, 107),
                                    "Publish Video",
                                    "",
                                    false),
                              ]),
                        ),
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
  Future<Uint8List?> generateThumbnail(String videoPath) async {
    print("gen video path ${videoPath}");
    final thumbnailBytes = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      quality: 85,
    );
    imageFrameVideo = thumbnailBytes;

    return thumbnailBytes;
  }

  File? selectedImage;
  File? selectedImageThumbnail;
  Uint8List? imageFrameVideo;

  void toggleTabs() {
    setState(() {
      myCourseSelected = !myCourseSelected;
    });
  }

  final List<String> itemNames = ['student', 'views', 'videos', 'quizzes'];
}

class CardMenuVideoProfile extends StatelessWidget {
  Color? colorBackground;
  String? stringHeader;
  String? body;
  bool? usingTwoText;
  CardMenuVideoProfile(
      this.colorBackground, this.stringHeader, this.body, this.usingTwoText);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorBackground,
      elevation: 4.0, // Elevation card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
        side: BorderSide(
          width: size.sizeBorderBlackGlobal,
          color: Colors.black,
        ),
      ),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Center(
              child: usingTwoText == true
                  ? Column(
                      children: [
                        ComponentTextDescription(
                          "${stringHeader}",
                          teksColor: Colors.black,
                          fontSize: size.sizeTextDescriptionGlobal.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        ComponentTextDescription(
                          "${body}",
                          teksColor: Colors.black,
                          fontSize: size.sizeTextDescriptionGlobal - 5.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          isWrappedText: true,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        ComponentTextDescription(
                          "${stringHeader}",
                          teksColor: Colors.black,
                          fontSize: size.sizeTextDescriptionGlobal.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}
