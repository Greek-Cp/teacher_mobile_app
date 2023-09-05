import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_add_video_menu.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_add_video_quiz.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../../res/border/border.dart';
import '../page_nav_profile_select_picture.dart';
import '../profile_menu/page_profile_menu_add_videos.dart';

class PageProfileUploadVideo extends StatefulWidget {
  static String? routeName = "/PageProfileUploadVideo";

  @override
  State<PageProfileUploadVideo> createState() => _PageProfileUploadVideoState();
}

class _PageProfileUploadVideoState extends State<PageProfileUploadVideo>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

  bool isAlreadyUploadVideo = false;
  bool isAlreadyUploadThumbnail = false;

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
      appBar: AppBarPageVideo(
        dropdownController.buttonColorPageVideoUpload,
        onTapVideoRight: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => PageProfileAddVideoMenu()));
        },
      ),
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
                      height: 600.h,
                      margin: EdgeInsets.only(
                          left: size.sizePaddingLeftAndRightPage.w,
                          right: size.sizePaddingLeftAndRightPage.w,
                          top: 20.h,
                          bottom: 30),
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
                                  RowVideo(
                                    getVideopath: (pathVid) {
                                      print("Path Video Lur ${pathVid}");
                                    },
                                  ),
                                  SizedBox(height: 20.h),
                                  ComponentTextDescription(
                                    "Requirements: ",
                                    fontSize:
                                        size.sizeTextDescriptionGlobal + 5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  for (int i = 0;
                                      i < listRequirementPhotoProfile.length;
                                      i++)
                                    ComponentTextDescription(
                                      tr("${listRequirementPhotoProfile[i].photoRequirements}"),
                                      fontSize: size.sizeTextDescriptionGlobal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(
                    //       bottom: 50.h, left: 20.w, right: 20.w),
                    //   margin:
                    //       EdgeInsets.only(top: 487.h, left: 20.h, right: 20.h),
                    //   child: Center(
                    //       child: ButtonLongForm(
                    //     nameButton: "Next",
                    //     routeName:
                    //         PageProfileMenuSelectLanguage.routeName.toString(),
                    //     formKey: _formKey,
                    //     heightLongHeader: 40.h,
                    //     onClickButton: () {
                    //       Navigator.pushNamed(
                    //           context, PagePlayground.routeName.toString());
                    //     },
                    //     colorButton: _isMinimumCharacterVideoDescription ==
                    //                 true &&
                    //             _isMinimumCharacterVideoTittle == true
                    //         ? ListColor.colorbuttonPageVideoDescriptionEnabled
                    //         : ListColor.colorbuttonPageVideoDescriptionDisabled,
                    //   )),
                    // ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                                child: ButtonLongHeader(
                              nameButton: "${dropdownController.videoTittle}",
                              routeName: "",
                              textAlign: TextAlign.center,
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

class RowVideo extends StatefulWidget {
  Function(String pathVid)? getVideopath;

  RowVideo({this.getVideopath});
  @override
  State<RowVideo> createState() => _RowVideoState();
}

class _RowVideoState extends State<RowVideo> {
  String? videoPath;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CardVideo(
      hintText: "Tap to select a video",
      labelVideo: "Video",
      getVideoPath: (pathVideo) {
        setState(() {
          videoPath = pathVideo;

          widget.getVideopath!(pathVideo);
        });
      },
    );
  }
}

class CardVideo extends StatefulWidget {
  final String hintText;
  CardVideo(
      {required this.hintText,
      required this.labelVideo,
      required this.getVideoPath});
  File? selectedImage;
  File? selectedImageThumbnail;
  Uint8List? imageFrameVideo;

  final String labelVideo;
  final Function(String pathVideo) getVideoPath;

  @override
  State<CardVideo> createState() => _CardVideoState();
}

class _CardVideoState extends State<CardVideo> {
  DropdownController dropdownController = Get.put(DropdownController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (dropdownController.videoPathCreate != "") {
      widget.selectedImage = File(dropdownController.videoPathCreate.value);
    }
    if (dropdownController.videoPathThumbnail == "") {
      if (dropdownController.videoPathCreate != "") {
        widget.selectedImageThumbnail =
            File(dropdownController.videoPathCreate.value);
      }
    } else {
      widget.selectedImageThumbnail =
          File(dropdownController.videoPathThumbnail.value);
    }
  }

  Future<void> pickVIdeo() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image from the gallery
    XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        widget.selectedImage = File(video.path);
        print("Video path ${video.path}");
        widget.selectedImageThumbnail = widget.selectedImage;
        dropdownController.videoPathCreate.value = widget.selectedImage!.path;
        dropdownController.checkIsVideoPathFilled();

        //     widget.getVideoPath(video.path);
      });
    } else {
      // User canceled the selection
      print('No video selected');
    }
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image from the gallery
    XFile? video = await _picker.pickImage(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        widget.selectedImageThumbnail = File(video.path);
        dropdownController.videoPathThumbnail.value =
            widget.selectedImageThumbnail!.path;
        dropdownController.checkIsVideoPathFilled();
      });
    } else {
      // User canceled the selection
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.3, // 30% of the screen width
                  height: MediaQuery.of(context).size.width *
                      0.3 *
                      194.7 /
                      110, // Maintaining the 6:19 aspect ratio
                  margin: EdgeInsets.only(top: 10.h),
                  child: Card(
                    color: ListColor.colorBackgroundTextFieldAll,
                    shape: BorderApp.border,
                    child: Container(
                      child: widget.selectedImage == null
                          ? GestureDetector(
                              onTap: pickVIdeo,
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ComponentTextDescription(
                                      "${widget.hintText}",
                                      fontSize:
                                          size.sizeTextDescriptionGlobal - 2.sp,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.bold,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: FutureBuilder<Uint8List?>(
                                      future: generateThumbnail(
                                          dropdownController.videoPathCreate
                                                  .value.isNotEmpty
                                              ? dropdownController
                                                  .videoPathCreate.value
                                              : widget.selectedImage!.path),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                                ConnectionState.done &&
                                            snapshot.hasData) {
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
                                    )),
                                Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.play_circle_fill,
                                      size: 40,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                    ),
                  ),
                ),
                ComponentTextDescription("${widget.labelVideo}",
                    fontSize: size.sizeTextDescriptionGlobal),
              ],
            ),
            widget.selectedImage != null
                ? Positioned(
                    right: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedImage = null;
                          dropdownController.videoPathCreate.value = "";
                          dropdownController.checkIsVideoPathFilled();
                        });
                      },
                      child: Container(
                        transform: Matrix4.translationValues(20.w, -10.h, 0),
                        child: Card(
                          color: Color.fromARGB(255, 214, 214, 214),
                          shape: CircleBorder(
                            side: BorderSide(
                              width: size.sizeBorderBlackGlobal,
                              color: Colors.black,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 15.w),
                            child: Center(
                              child: ComponentTextDescription(
                                '\u00D7',
                                fontSize:
                                    size.sizeTextDescriptionGlobal + 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Positioned(right: 1, child: Container()),
          ],
        ),
        Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.3, // 30% of the screen width
                  height: MediaQuery.of(context).size.width *
                      0.3 *
                      194.7 /
                      110, // Maintaining the 6:19 aspect ratio
                  margin: EdgeInsets.only(top: 10.h),
                  child: Card(
                    color: ListColor.colorBackgroundTextFieldAll,
                    shape: BorderApp.border,
                    child: Container(
                      child: widget.selectedImageThumbnail == null
                          ? GestureDetector(
                              onTap: pickImage,
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ComponentTextDescription(
                                      "Tap to select a thumbnail",
                                      fontSize:
                                          size.sizeTextDescriptionGlobal - 2.sp,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.bold,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Stack(
                              // this stack
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: FutureBuilder<Uint8List?>(
                                      future: generateThumbnail(
                                          widget.selectedImageThumbnail!.path),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                                ConnectionState.done &&
                                            snapshot.hasData) {
                                          return Image.memory(
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                            snapshot.data!,
                                          );
                                        } else {
                                          return Image.file(
                                            widget.selectedImageThumbnail!,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          );
                                        }
                                      },
                                    )),
                                Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: pickImage,
                                      child: Container(
                                        child: Center(
                                          child: ComponentTextDescription(
                                            "${widget.hintText}",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            textAlign: TextAlign.center,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                    ),
                  ),
                ),
                ComponentTextDescription("Thumbnail",
                    fontSize: size.sizeTextDescriptionGlobal)
              ],
            ),
            widget.selectedImageThumbnail != null
                ? Positioned(
                    right: 1,
                    child: Container(
                      transform: Matrix4.translationValues(20.w, -10.h, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.selectedImageThumbnail = null;
                            dropdownController.videoPathThumbnail.value = "";
                            dropdownController.checkIsVideoPathFilled();
                          });
                        },
                        child: Card(
                          color: Color.fromARGB(255, 214, 214, 214),
                          shape: CircleBorder(
                            side: BorderSide(
                              width: size.sizeBorderBlackGlobal,
                              color: Colors.black,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 15.w),
                            child: Center(
                              child: ComponentTextDescription(
                                '\u00D7',
                                fontSize:
                                    size.sizeTextDescriptionGlobal + 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Positioned(right: 1, child: Container()),
          ],
        )
      ],
    );
  }

  Future<Uint8List?> generateThumbnail(String videoPath) async {
    print("gen video path ${videoPath}");
    final thumbnailBytes = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      quality: 85,
    );
    widget.imageFrameVideo = thumbnailBytes;
    return thumbnailBytes;
  }
}
