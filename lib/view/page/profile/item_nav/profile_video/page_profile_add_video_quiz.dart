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
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../../res/border/border.dart';
import '../page_nav_profile_select_picture.dart';
import '../profile_menu/page_profile_menu_add_videos.dart';

class PageProfileAddVideoQuiz extends StatefulWidget {
  static String? routeName = "/PageProfileAddVideoQuiz";

  @override
  State<PageProfileAddVideoQuiz> createState() =>
      _PageProfileAddVideoQuizState();
}

class _PageProfileAddVideoQuizState extends State<PageProfileAddVideoQuiz>
    with TickerProviderStateMixin {
  int indexCardSelectedUser = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listCardWidget = [
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 0;
          });
        },
        child: QuizWidget(
          color: Color.fromARGB(255, 221, 158, 244),
          isHeaderOnLeft: true,
          headerName: "Quiz 1",
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 1;
          });
        },
        child: QuizWidget(
          color: Color.fromARGB(255, 204, 244, 253),
          isHeaderOnCenter: true,
          headerName: "Quiz 2",
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 2;
          });
        },
        child: QuizWidget(
          color: Color.fromARGB(255, 236, 198, 160),
          isHeaderOnRight: true,
          headerName: "Quiz 3",
        ),
      ),
    ];
  }

  List<Widget> listCardWidget = [];
  List<ModelPhotoRequirements> listRequirementPhotoProfile = [
    ModelPhotoRequirements(
        photoRequirements:
            "-You can add up to 3 Multiple choice Quizzes to help students practice the knowledge they learned in your video. ",
        statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements:
            "-The quiz question should have 1 to 3 right answers.",
        statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements:
            "-You can use ChatGPT or other AI tools to help you generate these Quizzes.",
        statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements:
            "-Your quizzes should be in the same language of the video.",
        statusRequirement: false),
  ];

  bool isAlreadyUploadVideo = false;
  bool isAlreadyUploadThumbnail = false;

  File? selectedImage;
  Uint8List? imageThumbnnail;
  File? selectedVideoIntro;
  Uint8List? thumbnailImageSelectedIntro;
  TextEditingController textEditingControllerQuiz = TextEditingController();
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
      appBar: AppBarPageVideo(dropdownController.buttonColorPageVideoUpload),
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
                                        fontSize:
                                            size.sizeTextDescriptionGlobal -
                                                4.sp,
                                        fontWeight: FontWeight.bold,
                                        maxLines: 2,
                                      ),
                                    Stack(
                                      children: [
                                        ...listCardWidget,
                                        listCardWidget[indexCardSelectedUser]
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        )),
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

class QuizWidget extends StatelessWidget {
  QuizWidget({
    Key? key,
    required this.color,
    this.isHeaderOnLeft,
    this.isHeaderOnRight,
    this.isHeaderOnCenter,
    this.headerName,
  }) : super(key: key);

  final Color color;
  final bool? isHeaderOnLeft;
  final bool? isHeaderOnRight;
  final bool? isHeaderOnCenter;
  final String? headerName;
  TextEditingController textEditingControllerQuiz = TextEditingController();
  TextEditingController textEditingControllerAnswer1 = TextEditingController();
  TextEditingController textEditingControllerAnswer2 = TextEditingController();
  TextEditingController textEditingControllerAnswer3 = TextEditingController();
  TextEditingController textEditingControllerAnswer4 = TextEditingController();
  bool rightAnswer1 = false;
  bool rightAnswer2 = false;
  bool rightAnswer3 = false;
  bool rightAnswer4 = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          transform: Matrix4.translationValues(0, .5, 2),
          margin: EdgeInsets.only(top: 37.h, left: 0.w, right: 0.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: color,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldFormMultiLine(
                  minCharacterHint: 20,
                  hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp,
                    color: ListColor.colorOutlineTextFieldWhenEmpty,
                  ),
                  labelText: "Question",
                  textEditingControllerEmail: textEditingControllerQuiz,
                  hintText: "Write a question \nmax 300 characters",
                  showIndicatorMin: false,
                  minLines: 5,
                  lengthMax: 90,
                  colorBackgroundTextField:
                      ListColor.colBackroundColorContainer,
                ),
                ComponentTextDescription(
                  "Optional:\n-Upload a picture related to the question.\n-PNG or Jpeg\n-Max 3 MB",
                  fontSize: size.sizeTextDescriptionGlobal - 4.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10.h),
                CardButtonLong(
                  nameButton: "Add Image",
                  routeName: "profile_picture",
                  fontWeight: FontWeight.bold,
                  colorButton: ListColor.backgroundItemRatingCyan,
                  colorFont: Colors.black,
                  borderShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    side: BorderSide(
                      width: size.sizeBorderBlackGlobal,
                      color: Colors.black,
                    ),
                  ),
                ),
                TextFieldFormMultiLine(
                  minCharacterHint: 20,
                  hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp,
                    color: ListColor.colorOutlineTextFieldWhenEmpty,
                  ),
                  labelText: "Question",
                  textEditingControllerEmail: textEditingControllerQuiz,
                  hintText: "Write a question \nmax 300 characters",
                  showIndicatorMin: false,
                  minLines: 5,
                  lengthMax: 90,
                  colorBackgroundTextField:
                      ListColor.colBackroundColorContainer,
                ),
              ],
            ),
          ),
        ),
        if (isHeaderOnLeft == true ||
            isHeaderOnCenter == true ||
            isHeaderOnRight == true)
          Align(
            alignment: isHeaderOnLeft == true
                ? Alignment.topLeft
                : isHeaderOnCenter == true
                    ? Alignment.topCenter
                    : Alignment.topRight,
            child: HeaderCard(
              color: color,
              headerName: headerName,
              isLeft: isHeaderOnLeft,
              isCenter: isHeaderOnCenter,
              isRight: isHeaderOnRight,
            ),
          ),
      ],
    );
  }
}

class HeaderCard extends StatelessWidget {
  HeaderCard({
    Key? key,
    required this.color,
    required this.headerName,
    required this.isLeft,
    required this.isCenter,
    required this.isRight,
  }) : super(key: key);

  final Color color;
  final String? headerName;
  final bool? isLeft;
  final bool? isCenter;
  final bool? isRight;

  EdgeInsetsGeometry _calculateMargin() {
    if (isLeft == true) {
      return EdgeInsets.only(left: 29.w, right: 0.w);
    } else if (isRight == true) {
      return EdgeInsets.only(left: 0.w, right: 29.w);
    } else {
      return EdgeInsets.zero; // Tanpa margin jika di tengah
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: _calculateMargin(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2, -1.5),
            spreadRadius: 0,
            blurRadius: 0,
          ),
          BoxShadow(
            color: Colors.black,
            offset: Offset(-2, -1.5),
            spreadRadius: 0,
            blurRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${headerName}",
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.verified_rounded,
              size: 18.h,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
