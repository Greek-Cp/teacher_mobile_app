import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/border/border.dart';
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
import 'package:video_thumbnail/video_thumbnail.dart';

import '../page_nav_profile_select_picture.dart';

class PageProfileMenuAddVideos extends StatefulWidget {
  static String? routeName = "/PageProfileMenuAddVideos";

  @override
  State<PageProfileMenuAddVideos> createState() =>
      _PageProfileMenuAddVideosState();
}

class _PageProfileMenuAddVideosState extends State<PageProfileMenuAddVideos>
    with TickerProviderStateMixin {
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

  List<ModelPhotoRequirements> listRequirementPhotoProfile = [
    ModelPhotoRequirements(
        photoRequirements: "- 30 to 1min", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Vertical orientation (9:16), HD",
        statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Good lighting", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Clear sound", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- No shaking", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Clear communication", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Warm welcome", statusRequirement: false),
  ];
  List<ModelPhotoRequirements> listRequirementTutoring = [
    ModelPhotoRequirements(
        photoRequirements: "- 1 to 3 min.", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Vertical orientation (9:16), HD",
        statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Good lighting", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Clear sound", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- No shaking", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Clear communication", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Warm welcome", statusRequirement: false),
  ];
  File? selectedImage;
  Uint8List? imageThumbnnail;
  File? selectedVideoIntro;
  Uint8List? thumbnailImageSelectedIntro;
  Future<void> pickVIdeo() async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image from the gallery
    XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        selectedImage = File(video.path);
      });
    } else {
      // User canceled the selection
      print('No image selected');
    }
  }

  Future<void> pickVideoIntro() async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image from the gallery
    XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        selectedVideoIntro = File(video.path);
      });
    } else {
      // User canceled the selection
      print('No image selected');
    }
  }

  Future<Uint8List?> generateThumbnail(String videoPath) async {
    final thumbnailBytes = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      quality: 85,
    );
    return thumbnailBytes;
  }

  int marginConfirm = 60;
  List<Widget> listWidget = [];
  int indexLanguage = 1;
  int indexTutoringLanguage = 2;
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
      appBar: AppBarGlobal(),
      extendBodyBehindAppBar: true, //
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 25.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors
                            .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                            horizontal: size.sizeFieldText.h),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                Center(
                                    child: ComponentTextTittle(
                                        tr("videos_english"))),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Center(
                                    child: ComponentTextDescription(
                                  tr("1_intro_video"),
                                  fontSize: size.sizeTextHeaderGlobal,
                                  fontWeight: FontWeight.bold,
                                )),
                                Center(
                                    child: ComponentTextDescription(
                                  tr("introduce_yourself_to_the_students"),
                                  fontSize: size.sizeTextDescriptionGlobal,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                )),
                                Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 30.h),
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
                                            horizontal: 10.h),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 40.h,
                                              ),
                                              ComponentTextDescription(
                                                "Requirements: ",
                                                fontSize:
                                                    size.sizeTextDescriptionGlobal +
                                                        5.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              for (int i = 0;
                                                  i <
                                                      listRequirementPhotoProfile
                                                          .length;
                                                  i++)
                                                ComponentTextDescription(
                                                  tr("${listRequirementPhotoProfile[i].photoRequirements}"),
                                                  fontSize: size
                                                      .sizeTextDescriptionGlobal,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  pickVideoIntro();
                                                },
                                                child: Center(
                                                  child:
                                                      ComponentTextDescription(
                                                    "Tap to Upload",
                                                    fontSize:
                                                        size.sizeTextDescriptionGlobal +
                                                            5.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: BorderApp.border,
                                                        child: Container(
                                                          width: 110.w,
                                                          height: 150.h,
                                                          child:
                                                              selectedVideoIntro ==
                                                                      null
                                                                  ? Container()
                                                                  : Stack(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.r),
                                                                          child:
                                                                              FutureBuilder<Uint8List?>(
                                                                            future:
                                                                                generateThumbnail(selectedVideoIntro!.path),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                                                                                return Image.memory(
                                                                                  fit: BoxFit.cover,
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  snapshot.data!,
                                                                                );
                                                                              } else {
                                                                                return CircularProgressIndicator();
                                                                              }
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              Icon(
                                                                            Icons.play_circle_fill,
                                                                            size:
                                                                                40,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                        ),
                                                      ),
                                                      ComponentTextDescription(
                                                          "Video",
                                                          fontSize: size
                                                              .sizeTextDescriptionGlobal)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: BorderApp.border,
                                                        child: Container(
                                                          width: 110.w,
                                                          height: 150.h,
                                                          child:
                                                              selectedImage ==
                                                                      null
                                                                  ? Container()
                                                                  : ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.r),
                                                                      child: FutureBuilder<
                                                                          Uint8List?>(
                                                                        future:
                                                                            generateThumbnail(selectedImage!.path),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          if (snapshot.connectionState == ConnectionState.done &&
                                                                              snapshot.hasData) {
                                                                            return Image.memory(
                                                                              fit: BoxFit.cover,
                                                                              snapshot.data!,
                                                                            );
                                                                          } else {
                                                                            return CircularProgressIndicator();
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                      ComponentTextDescription(
                                                          "Thumbnail",
                                                          fontSize: size
                                                              .sizeTextDescriptionGlobal)
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 40.h,
                                              )
                                            ]),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 10.h),
                                      child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Center(
                                            child: Card(
                                              color: ListColor
                                                  .backgroundColorVerified,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r),
                                                  side: BorderSide(
                                                      width: size
                                                          .sizeBorderBlackGlobal,
                                                      color: Colors.black)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ComponentTextDescription(
                                                      "Status: ",
                                                      fontSize: size
                                                          .sizeTextDescriptionGlobal,
                                                      teksColor: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    ComponentTextDescription(
                                                      "Verified",
                                                      fontSize: size
                                                          .sizeTextDescriptionGlobal,
                                                      teksColor: ListColor
                                                          .colorVerified,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Center(
                                    child: ComponentTextDescription(
                                  tr("2_tutoring_exapmle_in_english"),
                                  fontSize: size.sizeTextHeaderGlobal,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                )),
                                Center(
                                    child: ComponentTextDescription(
                                  tr("Display an example of your teaching skills to potential students through real example."),
                                  fontSize: size.sizeTextDescriptionGlobal,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                )),
                                Stack(
                                  children: [
                                    Container(
                                      height: 500.h,
                                      margin: EdgeInsets.only(top: 30.h),
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
                                            horizontal: 10.h),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 40.h,
                                              ),
                                              ComponentTextDescription(
                                                "Requirements: ",
                                                fontSize:
                                                    size.sizeTextDescriptionGlobal +
                                                        5.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              for (int i = 0;
                                                  i <
                                                      listRequirementPhotoProfile
                                                          .length;
                                                  i++)
                                                ComponentTextDescription(
                                                  tr("${listRequirementTutoring[i].photoRequirements}"),
                                                  fontSize: size
                                                      .sizeTextDescriptionGlobal,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  pickVIdeo();
                                                },
                                                child: Center(
                                                  child:
                                                      ComponentTextDescription(
                                                    "Tap to Upload",
                                                    fontSize:
                                                        size.sizeTextDescriptionGlobal +
                                                            5.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Card(
                                                        color: ListColor
                                                            .colorBackgroundVideoContainer,
                                                        shape: BorderApp.border,
                                                        child: Container(
                                                          width: 110.w,
                                                          height: 150.h,
                                                          child:
                                                              selectedImage ==
                                                                      null
                                                                  ? Container(
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            ComponentTextDescription(
                                                                          "Tap to select a video",
                                                                          fontSize: size
                                                                              .sizeTextDescriptionGlobal
                                                                              .sp,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Stack(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.r),
                                                                          child:
                                                                              FutureBuilder<Uint8List?>(
                                                                            future:
                                                                                generateThumbnail(selectedImage!.path),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                                                                                return Image.memory(
                                                                                  fit: BoxFit.cover,
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  snapshot.data!,
                                                                                );
                                                                              } else {
                                                                                return CircularProgressIndicator();
                                                                              }
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              Icon(
                                                                            Icons.play_circle_fill,
                                                                            size:
                                                                                40,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                        ),
                                                      ),
                                                      ComponentTextDescription(
                                                          "Video",
                                                          fontSize: size
                                                              .sizeTextDescriptionGlobal)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Card(
                                                        color: ListColor
                                                            .colorBackgroundVideoContainer,
                                                        shape: BorderApp.border,
                                                        child: Container(
                                                          width: 110.w,
                                                          height: 150.h,
                                                          child:
                                                              selectedImage ==
                                                                      null
                                                                  ? Container(
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            ComponentTextDescription(
                                                                          "Tap to select an image",
                                                                          fontSize: size
                                                                              .sizeTextDescriptionGlobal
                                                                              .sp,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.r),
                                                                      child: FutureBuilder<
                                                                          Uint8List?>(
                                                                        future:
                                                                            generateThumbnail(selectedImage!.path),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          if (snapshot.connectionState == ConnectionState.done &&
                                                                              snapshot.hasData) {
                                                                            return Image.memory(
                                                                              fit: BoxFit.cover,
                                                                              snapshot.data!,
                                                                            );
                                                                          } else {
                                                                            return CircularProgressIndicator();
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                      ComponentTextDescription(
                                                          "Thumbnail",
                                                          fontSize: size
                                                              .sizeTextDescriptionGlobal)
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 40.h,
                                              )
                                            ]),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 10.h),
                                      child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Center(
                                            child: Card(
                                              color: ListColor
                                                  .colorBackgroundConfirmToSaveChanges,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r),
                                                  side: BorderSide(
                                                      width: size
                                                          .sizeBorderBlackGlobal,
                                                      color: Colors.black)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ComponentTextDescription(
                                                      "Status: ",
                                                      fontSize: size
                                                          .sizeTextDescriptionGlobal,
                                                      teksColor: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    ComponentTextDescription(
                                                      "modifications needed",
                                                      fontSize: size
                                                          .sizeTextDescriptionGlobal,
                                                      teksColor: ListColor
                                                          .colorVerified,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 500.h, left: 20.h, right: 20.h),
                                      child: Center(
                                          child: ButtonLongForm(
                                        nameButton: "Submit Video",
                                        routeName: "",
                                        formKey: _formKey,
                                      )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                )
                              ]),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 0.h, left: 20.h, right: 20.h, bottom: 0.h),
                      child: Center(
                          child: ButtonLongForm(
                        nameButton: "English",
                        routeName: "",
                        formKey: _formKey,
                        colorButton: Color.fromARGB(255, 244, 162, 255),
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
      ),
    );
  }
}
