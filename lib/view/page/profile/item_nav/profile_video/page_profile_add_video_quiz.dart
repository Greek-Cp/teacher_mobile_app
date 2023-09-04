import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
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
  List<List<TextEditingController>> listTextEditingController = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
  ];

  List<File> listImageQuiz = [
    File(""),
    File(""),
    File(""),
  ];

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
          indexQuizWidget: 0,
          textEditingController: listTextEditingController[0],
          selectedImage: listImageQuiz[0],
          key_form: listKey[0],
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
          indexQuizWidget: 1,
          textEditingController: listTextEditingController[1],
          selectedImage: listImageQuiz[1],
          key_form: listKey[1],
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 2;
          });
        },
        child: QuizWidget(
          indexQuizWidget: 2,
          color: Color.fromARGB(255, 236, 198, 160),
          isHeaderOnRight: true,
          headerName: "Quiz 3",
          textEditingController: listTextEditingController[2],
          selectedImage: listImageQuiz[2],
          key_form: listKey[2],
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
      print('No im  age selected');
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

  final _formKey = GlobalKey<FormState>();
  List<GlobalKey<FormState>> listKey = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  DropdownController dropdownController = Get.put(DropdownController());
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
                        height: 1400.h,
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
                              key: listKey[indexCardSelectedUser],
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      height: 40.h,
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
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Stack(
                                      children: [
                                        ...listCardWidget,
                                        listCardWidget[indexCardSelectedUser]
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    )
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
                              nameButton: "Video Tittle",
                              routeName: "",
                              textAlign: TextAlign.center,
                              heightLongHeader: 10.h,
                              colorButton: ListColor.colorCardHeaderVideo,
                              fontWeight: FontWeight.bold,
                              colorFont: Colors.white,
                            )))),
                    Container(
                        margin: EdgeInsets.only(
                            top: 1575.w,
                            left: size.sizePaddingLeftAndRightPage + 25.w,
                            right: size.sizePaddingLeftAndRightPage + 25.w),
                        child: ButtonLongForm(
                            nameButton: "Save Quiz",
                            routeName:
                                PageProfileAddVideoQuiz.routeName.toString(),
                            formKey: listKey[indexCardSelectedUser]))
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

class QuizWidget extends StatefulWidget {
  QuizWidget(
      {Key? key,
      required this.color,
      this.isHeaderOnLeft,
      this.isHeaderOnRight,
      this.isHeaderOnCenter,
      this.headerName,
      required this.indexQuizWidget,
      required this.textEditingController,
      required this.selectedImage,
      required this.key_form})
      : super(key: key);
  List<TextEditingController> textEditingController;

  int indexQuizWidget;
  final Color color;
  final bool? isHeaderOnLeft;
  final bool? isHeaderOnRight;
  final bool? isHeaderOnCenter;
  final String? headerName;
  File? selectedImage;

  final GlobalKey<FormState> key_form;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  bool rightAnswer1 = false;

  bool rightAnswer2 = false;

  bool rightAnswer3 = false;

  bool rightAnswer4 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (dropdownController.listModelQuizVideo[widget.indexQuizWidget].answer1 !=
    //     null) {
    //   textEditingControllerAnswer1.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizWidget!].answer1!;
    // }

    // textEditingControllerQuiz.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizWidget!].question =
    //       textEditingControllerQuiz.text;
    // });

    // if (dropdownController
    //         .listModelQuizVideo.value[widget.indexQuizWidget!].answer1 !=
    //     null) {
    //   textEditingControllerAnswer1.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizWidget!].answer1!;
    // }
    // if (dropdownController
    //         .listModelQuizVideo.value[widget.indexQuizWidget!].answer2 !=
    //     null) {
    //   textEditingControllerAnswer2.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizWidget!].answer2!;
    // }
    // if (dropdownController
    //         .listModelQuizVideo.value[widget.indexQuizWidget!].answer3 !=
    //     null) {
    //   textEditingControllerAnswer3.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizWidget!].answer3!;
    // }
    // if (dropdownController
    //         .listModelQuizVideo.value[widget.indexQuizWidget!].answer4 !=
    //     null) {
    //   textEditingControllerAnswer4.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizWidget!].answer4!;
    // }

    // textEditingControllerQuiz.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizWidget!].question =
    //       textEditingControllerQuiz.text;
    // });
    // textEditingControllerAnswer1.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizWidget!].answer1 =
    //       textEditingControllerAnswer1.text;
    // });
    // textEditingControllerAnswer2.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizWidget!].answer2 =
    //       textEditingControllerAnswer2.text;
    // });
    // textEditingControllerAnswer3.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizWidget!].answer3 =
    //       textEditingControllerAnswer3.text;
    // });
    // textEditingControllerAnswer4.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizWidget!].answer4 =
    //       textEditingControllerAnswer4.text;
    // });
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image from the gallery
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Crop the selected image
      ImageCropper imageCropper = ImageCropper();
      CroppedFile? croppedImage = await imageCropper.cropImage(
          sourcePath: image.path,
          cropStyle: CropStyle.circle,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Color.fromARGB(255, 32, 36, 47),
                activeControlsWidgetColor: Color.fromARGB(255, 114, 87, 215),
                toolbarWidgetColor: Colors.white,
                backgroundColor: Colors.black,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
          ]);

      setState(() {
        widget.selectedImage =
            File(croppedImage!.path); // Set the selected and cropped image
      });
    } else {
      // User canceled the selection
      print('No image selected');
    }
  }

  DropdownController dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          transform: Matrix4.translationValues(0, .5, 2),
          margin: EdgeInsets.only(top: 37.h, left: 0.w, right: 0.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: widget.color,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                TextFieldFormMultiLine(
                  minCharacterHint: 20,
                  hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp,
                    color: ListColor.colorOutlineTextFieldWhenEmpty,
                  ),
                  labelText: "Question",
                  textEditingControllerEmail: widget.textEditingController[0],
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
                SizedBox(height: 20.h),
                if (widget.selectedImage!.path.isEmpty)
                  GestureDetector(
                    child: CardButtonLong(
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
                    onTap: () {
                      pickImage();
                    },
                  ),
                if (widget.selectedImage!.path.isNotEmpty)
                  Stack(
                    children: [
                      Image.asset(
                        widget.selectedImage!.path,
                        fit: BoxFit.fill,
                      ),
                      widget.selectedImage != null
                          ? Positioned(
                              right: 1,
                              child: Container(
                                transform:
                                    Matrix4.translationValues(10, -30.h, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.selectedImage = File("");
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
                                              size.sizeTextDescriptionGlobal +
                                                  15.sp,
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
                SizedBox(height: 20.h),
                TextFieldFormMultiLine(
                  minCharacterHint: 20,
                  hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp,
                    color: ListColor.colorOutlineTextFieldWhenEmpty,
                  ),
                  labelText: "Answer 1",
                  textEditingControllerEmail: widget.textEditingController[1],
                  hintText: "Max 200 characters",
                  showIndicatorMin: false,
                  showIndicatorMax: false,
                  minLines: 5,
                  lengthMax: 90,
                  colorBackgroundTextField:
                      ListColor.colBackroundColorContainer,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldFormMultiLine(
                  minCharacterHint: 20,
                  hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp,
                    color: ListColor.colorOutlineTextFieldWhenEmpty,
                  ),
                  labelText: "Answer 2",
                  textEditingControllerEmail: widget.textEditingController[2],
                  hintText: "Max 200 characters",
                  showIndicatorMin: false,
                  showIndicatorMax: false,
                  minLines: 5,
                  lengthMax: 90,
                  colorBackgroundTextField:
                      ListColor.colBackroundColorContainer,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldFormMultiLine(
                  minCharacterHint: 20,
                  hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp,
                    color: ListColor.colorOutlineTextFieldWhenEmpty,
                  ),
                  labelText: "Answer 3",
                  textEditingControllerEmail: widget.textEditingController[3],
                  hintText: "Max 200 characters",
                  showIndicatorMin: false,
                  showIndicatorMax: false,
                  minLines: 5,
                  lengthMax: 90,
                  colorBackgroundTextField:
                      ListColor.colBackroundColorContainer,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFieldFormMultiLine(
                  minCharacterHint: 20,
                  hintStyle: GoogleFonts.nunito(
                    fontSize: size.sizeTextDescriptionGlobal.sp,
                    color: ListColor.colorOutlineTextFieldWhenEmpty,
                  ),
                  labelText: "Answer 4",
                  textEditingControllerEmail: widget.textEditingController[4],
                  hintText: "Max 200 characters",
                  showIndicatorMin: false,
                  minLines: 5,
                  lengthMax: 90,
                  showIndicatorMax: false,
                  colorBackgroundTextField:
                      ListColor.colBackroundColorContainer,
                ),
                SizedBox(
                  height: 0.h,
                ),
                ComponentTextDescription(
                  "Right Answer",
                  fontSize: size.sizeTextDescriptionGlobal.sp,
                  fontWeight: FontWeight.bold,
                ),
                ComponentTextDescription(
                  "Select 1 to 3 right answers.",
                  fontSize: size.sizeTextDescriptionGlobal - 4.sp,
                  fontWeight: FontWeight.bold,
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1.9,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.black, width: 2.w),
                          color: Color.fromARGB(255, 183, 155, 248)),
                      child: Center(
                        child: ComponentTextDescription(
                          "Answer 1",
                          fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.black, width: 2.w),
                          color: Color.fromARGB(255, 183, 155, 248)),
                      child: Center(
                        child: ComponentTextDescription(
                          "Answer 2",
                          fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.black, width: 2.w),
                          color: Color.fromARGB(255, 183, 155, 248)),
                      child: Center(
                        child: ComponentTextDescription(
                          "Answer 3",
                          fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.black, width: 2.w),
                          color: Color.fromARGB(255, 178, 253, 178)),
                      child: Center(
                        child: ComponentTextDescription(
                          "Answer 4",
                          fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
        if (widget.isHeaderOnLeft == true ||
            widget.isHeaderOnCenter == true ||
            widget.isHeaderOnRight == true)
          Align(
            alignment: widget.isHeaderOnLeft == true
                ? Alignment.topLeft
                : widget.isHeaderOnCenter == true
                    ? Alignment.topCenter
                    : Alignment.topRight,
            child: HeaderCard(
              color: widget.color,
              headerName: widget.headerName,
              isLeft: widget.isHeaderOnLeft,
              isCenter: widget.isHeaderOnCenter,
              isRight: widget.isHeaderOnRight,
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
            SizedBox(
              width: 30.w,
              child: ComponentTextDescription(
                "${headerName}",
                fontSize: size.sizeTextDescriptionGlobal - 6.sp,
                fontWeight: FontWeight.bold,
                maxLines: 2,
                textAlign: TextAlign.center,
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
