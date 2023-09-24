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
import 'package:lottie/lottie.dart';
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
import 'package:video_player/video_player.dart';
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

class DataController extends GetxController {
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

  List<List<File>> listImageQuiz = [
    [File("")],
    [File("")],
    [File("")],
  ];

  List<List<String>> listAnswerSelectedByUser = [
    [""],
    [""],
    [""],
  ]; // Fungsi untuk memuat data
}

class _PageProfileAddVideoQuizState extends State<PageProfileAddVideoQuiz>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;

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

  List<List<File>> listImageQuiz = [
    [File("")],
    [File("")],
    [File("")],
  ];

  List<List<String>> listAnswerSelectedByUser = [
    [""],
    [""],
    [""],
  ]; // Fungsi

  int indexCardSelectedUser = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ValueNotifier<bool> isAllFilledNotifier = ValueNotifier<bool>(false);

  List<ValueNotifier<bool>> listValueNotifier = [
    ValueNotifier<bool>(false),
    ValueNotifier<bool>(false),
    ValueNotifier<bool>(false),
  ];
  int count = 0;
  void _checkAllFields() {
    bool allFilled = true;

    for (int i = 0; i < listTextEditingController.length; i++) {
      int mt1 = 0;
      int mt2 = 0;
      if (listTextEditingController[i][3].text.isNotEmpty) {
        mt1 = 1;
      } else {
        mt1 = 0;
      }
      if (listTextEditingController[i][4].text.isNotEmpty) {
        mt2 = 1;
      } else {
        mt2 = 0;
      }
      for (int x = 0; x < 3 + mt1 + mt2; x++) {
        if (listTextEditingController[i][x].text.isEmpty) {
          allFilled = false;
          break;
        }
      }
    }

    for (int d = 0; d < listImageQuiz.length; d++) {
      for (int b = 0; b < listImageQuiz[d].length; b++) {
        if (listImageQuiz[d][b].path.isEmpty) {
          print("is empty true ${listImageQuiz[d][b].path}");
          allFilled = false;
          break;
        } else {
          print("is empy false ${listImageQuiz[d][b].path}");
        }
      }
    }

    for (int d = 0; d < listAnswerSelectedByUser.length; d++) {
      for (int b = 0; b < listAnswerSelectedByUser[d].length; b++) {
        if (listImageQuiz[d][b].path.isEmpty) {
          print("is empty true ${listImageQuiz[d][b].path}");
          allFilled = false;
          break;
        } else {
          print("is empy false ${listImageQuiz[d][b].path}");
        }
      }
    }
    // for (int b = 0; b < listImageQuiz.length; b++) {
    //   if (listImageQuiz[b].path.isEmpty) {
    //     allFilled = false;
    //   }
    // }
    isAllFilledNotifier.value = allFilled;
  }

  int mx1 = 0;
  int mx2 = 0;
  void _checkALlFiellQuiz(int indexQuiz) {
    bool isQuizFilled = true;
    print("Index Quiz ${listTextEditingController[indexQuiz].length}");
    if (listTextEditingController[indexQuiz][3].text.isNotEmpty) {
      mx1 = 1;
    } else {
      mx1 = 0;
    }
    if (listTextEditingController[indexQuiz][4].text.isNotEmpty) {
      mx2 = 1;
    } else {
      mx2 = 0;
    }
    print("mx ${mx1}");
    print("mx ${mx2}");
    for (int y = 0; y < 3 + mx1 + mx2; y++) {
      print("y inde x ${y}");
      if (listTextEditingController[indexQuiz][y].text.isEmpty) {
        isQuizFilled = false;
        break;
      }
    }
    for (int b = 0; b < listImageQuiz[indexQuiz].length; b++) {
      if (listImageQuiz[indexQuiz][b].path.isEmpty) {
        print("is empty true ${listImageQuiz[indexQuiz][b].path}");
        isQuizFilled = false;
        break;
      } else {
        print("is empy false  s${listImageQuiz[indexQuiz][b].path}");
      }
    }

    listValueNotifier[indexQuiz].value = isQuizFilled;
  }

  bool oneQUizFilled = false;
  final controllerData = Get.put(DataController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.file(
        File(dropdownController.videoPathCreate.value));
    if (listTextEditingController != null) {
      listTextEditingController = controllerData.listTextEditingController;
      for (int i = 0; i < listTextEditingController.length; i++) {
        for (int x = 0; x < listTextEditingController[i].length; x++) {
          {
            _checkAllFields();
            _checkALlFiellQuiz(i);
          }
        }
      }
    }
    if (listImageQuiz != null) {
      listImageQuiz = controllerData.listImageQuiz;
      for (int i = 0; i < listImageQuiz.length; i++) {
        for (int x = 0; x < listImageQuiz[i].length; x++) {
          {
            _checkAllFields();
            _checkALlFiellQuiz(i);
          }
        }
      }
    }
    for (int i = 0; i < listTextEditingController.length; i++) {
      for (int x = 0; x < listTextEditingController[i].length; x++) {
        listTextEditingController[i][x].addListener(() {
          _checkAllFields();
          _checkALlFiellQuiz(i);
        });
      }
    }
    for (int i = 0; i < listAnswerSelectedByUser.length; i++) {
      for (int x = 0; x < listAnswerSelectedByUser[i].length; x++) {
        listTextEditingController[i][x].addListener(() {
          _checkAllFields();
          _checkALlFiellQuiz(i);
        });
      }
    }
    controllerData.listTextEditingController = listTextEditingController;
    controllerData.listImageQuiz = listImageQuiz;
    controllerData.listAnswerSelectedByUser = listAnswerSelectedByUser;
    listCardHeader = [
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 0;
          });
        },
        child: QuizHeaderWidget(
          color: Color.fromARGB(255, 221, 158, 244),
          isHeaderOnLeft: true,
          headerName: "Question 1",
          indexQuizHeaderWidget: 0,
          textEditingController: listTextEditingController[0],
          selectedImage: listImageQuiz[0],
          key_form: listKey[0],
          isFieldValue: listValueNotifier[0],
          answerSelectedByUser: listAnswerSelectedByUser[0],
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 1;
          });
        },
        child: QuizHeaderWidget(
          color: Color.fromARGB(255, 204, 244, 253),
          isHeaderOnCenter: true,
          headerName: "Question 2",
          indexQuizHeaderWidget: 1,
          textEditingController: listTextEditingController[1],
          selectedImage: listImageQuiz[1],
          key_form: listKey[1],
          isFieldValue: listValueNotifier[1],
          answerSelectedByUser: listAnswerSelectedByUser[1],
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 2;
          });
        },
        child: QuizHeaderWidget(
          indexQuizHeaderWidget: 2,
          color: Color.fromARGB(255, 236, 198, 160),
          isHeaderOnRight: true,
          headerName: "Question 3",
          textEditingController: listTextEditingController[2],
          selectedImage: listImageQuiz[2],
          key_form: listKey[2],
          isFieldValue: listValueNotifier[2],
          answerSelectedByUser: listAnswerSelectedByUser[2],
        ),
      ),
    ];
    listCardWidget = [
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 0;
          });
        },
        child: QuizWidget(
          indexSelectedQuizWidget: indexCardSelectedUser,
          color: Color.fromARGB(255, 221, 158, 244),
          isHeaderOnLeft: true,
          headerName: "Question 1",
          indexQuizWidget: 0,
          textEditingController: listTextEditingController[0],
          selectedImage: listImageQuiz[0],
          key_form: listKey[0],
          isFieldValue: listValueNotifier[0],
          answerSelectedByUser: listAnswerSelectedByUser[0],
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 1;
          });
        },
        child: QuizWidget(
          indexSelectedQuizWidget: indexCardSelectedUser,
          color: Color.fromARGB(255, 204, 244, 253),
          isHeaderOnCenter: true,
          headerName: "Question 2",
          indexQuizWidget: 1,
          textEditingController: listTextEditingController[1],
          selectedImage: listImageQuiz[1],
          key_form: listKey[1],
          isFieldValue: listValueNotifier[1],
          answerSelectedByUser: listAnswerSelectedByUser[1],
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            indexCardSelectedUser = 2;
          });
        },
        child: QuizWidget(
          indexSelectedQuizWidget: indexCardSelectedUser,
          indexQuizWidget: 2,
          color: Color.fromARGB(255, 236, 198, 160),
          isHeaderOnRight: true,
          headerName: "Question 3",
          textEditingController: listTextEditingController[2],
          selectedImage: listImageQuiz[2],
          key_form: listKey[2],
          isFieldValue: listValueNotifier[2],
          answerSelectedByUser: listAnswerSelectedByUser[2],
        ),
      ),
    ];
  }

  List<Widget> listCardWidget = [];

  List<Widget> listCardHeader = [];
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
            "-Your quizzes should be  in the same language of the video.",
        statusRequirement: false),
  ];

  bool isAlreadyUploadVideo = false;
  bool isAlreadyUploadThumbnail = false;
  Color backgroundColor = Colors.grey; // Warna latar belakang awalnya abu

  File? selectedImage;
  Uint8List? imageThumbnnail;
  File? selectedVideoIntro;
  Uint8List? thumbnailImageSelectedIntro;
  TextEditingController textEditingControllerQuiz = TextEditingController();

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
      appBar: AppBarPageVideo(
        dropdownController.buttonColorPageVideoUpload,
        showButtonLeftOnly: true,
        nameAppBar: "Quiz",
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
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: size.sizePaddingLeftAndRightPage.w,
                                right: size.sizePaddingLeftAndRightPage.w,
                                top: 20.h,
                                bottom: 30.h),
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
                                  horizontal:
                                      size.sizePaddingLeftAndRightPage.h),
                              child: SingleChildScrollView(
                                child: Form(
                                  key: listKey[indexCardSelectedUser],
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        for (int i = 0;
                                            i <
                                                listRequirementPhotoProfile
                                                    .length;
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
                                            ...listCardHeader,
                                            ...listCardWidget,

                                            //...listCardHeader,
                                            listCardWidget[
                                                indexCardSelectedUser]
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
                        // Container(
                        //     margin: EdgeInsets.only(
                        //         top: 1575.w,
                        //         left: size.sizePaddingLeftAndRightPage + 25.w,
                        //         right: size.sizePaddingLeftAndRightPage + 25.w),
                        //     child : ButtonLongForm(
                        //         nameButton: "Save Quiz",
                        //         routeName: PageProfileAddVideoQuiz.routeName
                        //             .toString(),
                        //         formKey: listKey[indexCardSelectedUser]))
                      ],
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: isAllFilledNotifier,
                      builder: (context, isAllFilled, child) {
                        backgroundColor =
                            isAllFilled ? Colors.green : Colors.grey;
                        return Container(
                            transform: Matrix4.translationValues(0, -120.h, 2),
                            margin: EdgeInsets.only(
                                left: size.sizePaddingLeftAndRightPage + 40.w,
                                right: size.sizePaddingLeftAndRightPage + 40.w),
                            child: ButtonLongForm(
                                colorButton: backgroundColor,
                                nameButton: "Save Quiz",
                                routeName: PageProfileAddVideoQuiz.routeName
                                    .toString(),
                                formKey: listKey[indexCardSelectedUser]));
                      },
                    ),
                    SizedBox(
                      height: 0.h,
                    )
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

class ModelAnswer {
  String? nameAnswer;
  bool? isAnswer;
  ModelAnswer(this.nameAnswer, this.isAnswer);
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
      required this.key_form,
      required this.isFieldValue,
      required this.answerSelectedByUser,
      require,
      required this.indexSelectedQuizWidget})
      : super(key: key);
  List<TextEditingController> textEditingController;

  int indexQuizWidget;
  int indexSelectedQuizWidget;
  final Color color;
  final bool? isHeaderOnLeft;
  final bool? isHeaderOnRight;
  final bool? isHeaderOnCenter;
  final String? headerName;
  List<File?> selectedImage;
  List<String>? answerSelectedByUser;
  ValueNotifier<bool> isFieldValue;

  final GlobalKey<FormState> key_form;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  bool rightAnswer1 = false;
  int? heightContainer = 0;
  final controllerData = Get.put(DataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    heightContainer = 1300;

    widget.textEditingController[3].addListener(() {
      if (widget.textEditingController[3].text.isEmpty) {
        setState(() {
          countDefault_1 = 0;
        });
      } else {
        setState(() {
          countDefault_1 = 1;
        });
      }
    });
    widget.textEditingController[4].addListener(() {
      if (widget.textEditingController[4].text.isEmpty) {
        setState(() {
          countDefault_2 = 0;
        });
      } else {
        setState(() {
          countDefault_2 = 1;
        });
      }
    });

    print(
        "widget index ${extractLastCharacter(controllerData.listAnswerSelectedByUser[widget.indexQuizWidget][0])}");
    selectedItemIndex = extractLastCharacter(
        controllerData.listAnswerSelectedByUser[widget.indexQuizWidget][0]);

    // if (widget.answerSelectedByUser![widget.indexQuizWidget][0] != "") {
    //   selectedItemIndex =
    //       int.parse(widget.answerSelectedByUser![widget.indexQuizWidget][0]);
    // }
  }

  int extractLastCharacter(String text) {
    if (text.isEmpty) {
      return -1; // String kosong, tidak ada karakter terakhir
    }
    text.substring(text.length - 1);

    print("widget index" + text.substring(text.length - 1));

    return int.parse(text.substring(text.length - 1)) - 1;
  }

  int selectedItemIndex =
      -1; // Variabel untuk melacak indeks item yang dipilih, -1 berarti tidak ada yang dipilih
  int countIndex = 2;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image from the gallery
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Crop the selected image
      ImageCropper imageCropper = ImageCropper();
      CroppedFile? croppedImage = await imageCropper.cropImage(
          sourcePath: image.path,
          cropStyle: CropStyle.rectangle,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Color.fromARGB(255, 32, 36, 47),
                activeControlsWidgetColor: Color.fromARGB(255, 114, 87, 215),
                toolbarWidgetColor: Colors.white,
                backgroundColor: Colors.black,
                hideBottomControls: true,
                initAspectRatio: CropAspectRatioPreset.square,
                lockAspectRatio: true),
          ]);

      setState(() {
        widget.selectedImage[0] =
            File(croppedImage!.path); // Set the selected and cropped image
        controllerData.listImageQuiz[widget.indexQuizWidget][0] =
            File(croppedImage!.path);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PageProfileAddVideoQuiz(),
          ),
        );
      });
    } else {
      // User canceled the selection
      print('No image selected');
    }
  }

  Color backgroundColor = Colors.grey; // Warna latar belakang awalnya abu

  DropdownController dropdownController = Get.put(DropdownController());

  List<String> answerChoices = [
    "Answer 1",
    "Answer 2",
    "Answer 3",
    "Answer 4",
  ];
  bool isItemSelected =
      false; // Variabel untuk melacak status item yang dipilih
  int countDefault_1 = 0;
  int countDefault_2 = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: heightContainer!.h,
          transform: Matrix4.translationValues(0, .5, 2),
          margin:
              EdgeInsets.only(top: 37.h, left: 0.w, right: 0.w, bottom: 30.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: widget.color,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: SingleChildScrollView(
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
                  lengthMax: 700,
                  colorBackgroundTextField: Color.fromARGB(255, 249, 220, 253),
                ),
                ComponentTextDescription(
                  "Optional:\n-Upload a picture related to the question.\n-PNG or Jpeg\n-Max 3 MB",
                  fontSize: size.sizeTextDescriptionGlobal - 4.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20.h),
                if (widget.selectedImage[0]!.path.isEmpty)
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
                if (widget.selectedImage[0]!.path.isNotEmpty)
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0.w),
                        child: AspectRatio(
                          aspectRatio:
                              1.0, // 1.0 adalah aspect ratio persegi (1:1)
                          child: Image.file(widget.selectedImage[0]!,
                              width: 50.w, height: 50.h, fit: BoxFit.cover),
                        ),
                      ),
                      widget.selectedImage != null
                          ? Positioned(
                              right: 1,
                              child: Container(
                                transform:
                                    Matrix4.translationValues(5, -20.h, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.selectedImage[0] = File("");
                                      controllerData.listImageQuiz[
                                          widget.indexQuizWidget][0] = File("");
                                    });
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PageProfileAddVideoQuiz(),
                                      ),
                                    );
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
                GestureDetector(
                  onTap: () {},
                  child: TextFieldFormMultiLine(
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
                    lengthMax: 700,
                    colorBackgroundTextField:
                        Color.fromARGB(255, 249, 220, 253),
                  ),
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
                  lengthMax: 700,
                  colorBackgroundTextField: Color.fromARGB(255, 249, 220, 253),
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
                  labelText: "Answer 3 (Optional)",
                  textEditingControllerEmail: widget.textEditingController[3],
                  hintText: "Max 200 characters",
                  showIndicatorMin: false,
                  showIndicatorMax: false,
                  minLines: 5,
                  lengthMax: 700,
                  colorBackgroundTextField: Color.fromARGB(255, 249, 220, 253),
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
                  labelText: "Answer 4 (Optional)",
                  textEditingControllerEmail: widget.textEditingController[4],
                  hintText: "Max 200 characters",
                  showIndicatorMin: false,
                  minLines: 5,
                  lengthMax: 700,
                  showIndicatorMax: false,
                  colorBackgroundTextField: Color.fromARGB(255, 249, 220, 253),
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
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.9,
                  ),
                  itemCount: countIndex + countDefault_1 + countDefault_2,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // Ketika item diklik, atur indeks item yang dipilih
                          selectedItemIndex = index;
                          widget.answerSelectedByUser![0] =
                              answerChoices[index];
                          controllerData.listAnswerSelectedByUser[
                              widget.indexQuizWidget][0] = answerChoices[index];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2),
                          color: selectedItemIndex ==
                                  index // Ubah warna hanya pada item yang dipilih
                              ? Color.fromARGB(255, 178, 253, 178)
                              : Color.fromARGB(255, 183, 155, 248),
                        ),
                        child: Center(
                          child: ComponentTextDescription(
                            answerChoices[index],
                            fontSize: size.sizeTextDescriptionGlobal - 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
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
              isFieldValue: widget.isFieldValue,
            ),
          ),
      ],
    );
  }
}

class QuizHeaderWidget extends StatefulWidget {
  QuizHeaderWidget(
      {Key? key,
      required this.color,
      this.isHeaderOnLeft,
      this.isHeaderOnRight,
      this.isHeaderOnCenter,
      this.headerName,
      required this.indexQuizHeaderWidget,
      required this.textEditingController,
      required this.selectedImage,
      required this.key_form,
      required this.isFieldValue,
      required this.answerSelectedByUser,
      require})
      : super(key: key);
  List<TextEditingController> textEditingController;

  int indexQuizHeaderWidget;
  final Color color;
  final bool? isHeaderOnLeft;
  final bool? isHeaderOnRight;
  final bool? isHeaderOnCenter;
  final String? headerName;
  List<File?> selectedImage;
  List<String>? answerSelectedByUser;
  ValueNotifier<bool> isFieldValue;

  final GlobalKey<FormState> key_form;

  @override
  State<QuizHeaderWidget> createState() => _QuizHeaderWidgetState();
}

class _QuizHeaderWidgetState extends State<QuizHeaderWidget> {
  bool rightAnswer1 = false;

  final controllerData = Get.put(DataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (dropdownController.listModelQuizVideo[widget.indexQuizHeaderWidget].answer1 !=
    //     null) {
    //   textEditingControllerAnswer1.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizHeaderWidget!].answer1!;
    // }

    // textEditingControllerQuiz.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizHeaderWidget!].question =
    //       textEditingControllerQuiz.text;
    // });

    // if (dropdownController
    //         .listModelQuizVideo.value[widget.indexQuizHeaderWidget!].answer1 !=
    //     null) {
    //   textEditingControllerAnswer1.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizHeaderWidget!].answer1!;
    // }
    // if (dropdownController
    //         .listModelQuizVideo.value[widget.indexQuizHeaderWidget!].answer2 !=
    //     null) {
    //   textEditingControllerAnswer2.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizHeaderWidget!].answer2!;
    // }
    // if (dropdownController
    //         .listModelQuizVideo.value[widget.indexQuizHeaderWidget!].answer3 !=
    //     null) {
    //   textEditingControllerAnswer3.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizHeaderWidget!].answer3!;
    // }
    // if (dropdownController
    //         .listModelQuizVideo.value[widget.indexQuizHeaderWidget!].answer4 !=
    //     null) {
    //   textEditingControllerAnswer4.text = dropdownController
    //       .listModelQuizVideo.value[widget.indexQuizHeaderWidget!].answer4!;
    // }

    // textEditingControllerQuiz.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizHeaderWidget!].question =
    //       textEditingControllerQuiz.text;
    // });
    // textEditingControllerAnswer1.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizHeaderWidget!].answer1 =
    //       textEditingControllerAnswer1.text;
    // });
    // textEditingControllerAnswer2.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizHeaderWidget!].answer2 =
    //       textEditingControllerAnswer2.text;
    // });
    // textEditingControllerAnswer3.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizHeaderWidget!].answer3 =
    //       textEditingControllerAnswer3.text;
    // });
    // textEditingControllerAnswer4.addListener(() {
    //   dropdownController.listModelQuizVideo[widget.indexQuizHeaderWidget!].answer4 =
    //       textEditingControllerAnswer4.text;
    // });
    widget.textEditingController[3].addListener(() {
      if (widget.textEditingController[3].text.isEmpty) {
        setState(() {
          countDefault_1 = 0;
        });
      } else {
        setState(() {
          countDefault_1 = 1;
        });
      }
    });
    widget.textEditingController[4].addListener(() {
      if (widget.textEditingController[4].text.isEmpty) {
        setState(() {
          countDefault_2 = 0;
        });
      } else {
        setState(() {
          countDefault_2 = 1;
        });
      }
    });

    print(
        "widget index ${extractLastCharacter(controllerData.listAnswerSelectedByUser[widget.indexQuizHeaderWidget][0])}");
    selectedItemIndex = extractLastCharacter(controllerData
        .listAnswerSelectedByUser[widget.indexQuizHeaderWidget][0]);

    // if (widget.answerSelectedByUser![widget.indexQuizHeaderWidget][0] != "") {
    //   selectedItemIndex =
    //       int.parse(widget.answerSelectedByUser![widget.indexQuizHeaderWidget][0]);
    // }
  }

  int extractLastCharacter(String text) {
    if (text.isEmpty) {
      return -1; // String kosong, tidak ada karakter terakhir
    }
    text.substring(text.length - 1);

    print("widget index" + text.substring(text.length - 1));

    return int.parse(text.substring(text.length - 1)) - 1;
  }

  int selectedItemIndex =
      -1; // Variabel untuk melacak indeks item yang dipilih, -1 berarti tidak ada yang dipilih
  int countIndex = 2;

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
        widget.selectedImage[0] =
            File(croppedImage!.path); // Set the selected and cropped image
        controllerData.listImageQuiz[widget.indexQuizHeaderWidget][0] =
            File(croppedImage!.path);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PageProfileAddVideoQuiz(),
          ),
        );
      });
    } else {
      // User canceled the selection
      print('No image selected');
    }
  }

  Color backgroundColor = Colors.grey; // Warna latar belakang awalnya abu

  DropdownController dropdownController = Get.put(DropdownController());

  List<String> answerChoices = [
    "Answer 1",
    "Answer 2",
    "Answer 3",
    "Answer 4",
  ];
  bool isItemSelected =
      false; // Variabel untuk melacak status item yang dipilih
  int countDefault_1 = 0;
  int countDefault_2 = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              isFieldValue: widget.isFieldValue,
            ),
          ),
      ],
    );
  }
}

class HeaderCard extends StatelessWidget {
  HeaderCard(
      {Key? key,
      required this.color,
      required this.headerName,
      required this.isLeft,
      required this.isCenter,
      required this.isRight,
      required this.isFieldValue})
      : super(key: key);

  final Color color;
  final String? headerName;
  final bool? isLeft;
  final bool? isCenter;
  final bool? isRight;

  final ValueNotifier<bool> isFieldValue;
  Color backgroundColor = Colors.grey; // Warna latar belakang awalnya abu

  EdgeInsetsGeometry _calculateMargin() {
    if (isLeft == true) {
      return EdgeInsets.only(left: 20.w, right: 0.w);
    } else if (isRight == true) {
      return EdgeInsets.only(left: 0.w, right: 20.w);
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
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
        child: ValueListenableBuilder<bool>(
          valueListenable: isFieldValue,
          builder: (context, isAllFilled, child) {
            backgroundColor = isAllFilled ? Colors.green : Colors.grey;
            return isAllFilled == true
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.w,
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
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: ComponentTextDescription(
                          "${headerName}",
                          fontSize: size.sizeTextDescriptionGlobal - 6.sp,
                          fontWeight: FontWeight.bold,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
            // : Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SizedBox(
            //         width: 30.w,
            //         child: ComponentTextDescription(
            //           "${headerName}",
            //           fontSize: size.sizeTextDescriptionGlobal - 6.sp,
            //           fontWeight: FontWeight.bold,
            //           maxLines: 2,
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //             color: Color.fromARGB(255, 201, 148, 4),
            //             shape: BoxShape.circle),
            //         child: LottieBuilder.asset(
            //           "assets/icon/animation_confirm_to_save_changes.json",
            //           width: 20.w,
            //           height: 20.h,
            //         ),
            //       ),
            //     ],
            //   );
          },
        ),
      ),
    );
  }
}
