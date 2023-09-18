import 'dart:io';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tex/flutter_tex.dart';
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

import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_select_language.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_playgorund.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_add_video_category.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:flutter/services.dart';

import '../../../../../res/border/border.dart';
import '../page_nav_profile_select_picture.dart';
import '../profile_menu/page_profile_menu_add_videos.dart';

class PageProfileAddVideoQuizCustom extends StatefulWidget {
  static String? routeName = "/PageProfileAddVideoQuizCustom";

  @override
  State<PageProfileAddVideoQuizCustom> createState() =>
      _PageProfileAddVideoQuizCustomState();
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

class _PageProfileAddVideoQuizCustomState
    extends State<PageProfileAddVideoQuizCustom> with TickerProviderStateMixin {
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
      print("y index ${y}");
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
        print("is empy false ${listImageQuiz[indexQuiz][b].path}");
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
            "-Your quizzes should be in the same language of the video.",
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
                        //     child: ButtonLongForm(
                        //         nameButton: "Save Quiz",
                        //         routeName: PageProfileAddVideoQuizCustom.routeName
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
                                routeName: PageProfileAddVideoQuizCustom
                                    .routeName
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
            builder: (context) => PageProfileAddVideoQuizCustom(),
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
  final Map<String, String> questionTypes = {
    'assets/img/ic_question_1.svg': 'Multiple\nChoice\nQuestions',
    'assets/img/ic_question_2.svg': 'Matching',
    'assets/img/ic_question_3.svg': 'Fill the Blanks',
    'assets/img/ic_question_4.svg': 'Group',
  };
  int indexQuestSelection = -1;
  bool showListTypeQuestion = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (indexQuestSelection == -1)
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: ComponentTextDescription("Choose a Question type",
                        fontSize: size.sizeTextDescriptionGlobal.sp),
                  ),
                if (indexQuestSelection != -1)
                  Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      DropDownWidget(
                        textEditingControllerDropDown: TextEditingController(),
                        initialValueDropDown: "Select a Subject",
                        containerHeight: 50,
                        containerListHeight: 90,
                        labelText: "Question Type",
                        listData: [
                          "Multiple Choice Questions",
                          "Matching",
                          "Fill the Blanks",
                          "Group"
                          // Add more subject options
                        ],
                        isFilledWithData: (isFiled, value) {},
                      ),
                    ],
                  ),
                showListTypeQuestion == true
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: questionTypes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final assetsIconSvg =
                              questionTypes.keys.elementAt(index);
                          final name = questionTypes.values.elementAt(index);

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                indexQuestSelection = index;
                                showListTypeQuestion = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                              child: widgetQuestionType(name, assetsIconSvg),
                            ),
                          );
                        },
                      )
                    : Container(),
                if (indexQuestSelection == 0) QuizFormWidget(),
                if (indexQuestSelection == 1) MatchingFormWidget(),
                if (indexQuestSelection == 2) FillBlankForm(),
                if (indexQuestSelection == 3) GroupForm(),
                SizedBox(
                  height: 50.h,
                )
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

class MatchingFormWidget extends StatefulWidget {
  @override
  State<MatchingFormWidget> createState() => _MatchingFormWidgetState();
}

class _MatchingFormWidgetState extends State<MatchingFormWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 10.h),
      // Widget TextFieldFormMultiLine untuk pertanyaan

      TextFieldFormMultiLine(
        minCharacterHint: 20,
        hintStyle: GoogleFonts.nunito(
          fontSize: size.sizeTextDescriptionGlobal.sp,
          color: ListColor.colorOutlineTextFieldWhenEmpty,
        ),
        labelText: "Question",
        textEditingControllerEmail: TextEditingController(text: "questionText"),
        hintText: "Write a question \nmax 300 characters",
        showIndicatorMin: false,
        minLines: 5,
        lengthMax: 700,
        colorBackgroundTextField: Color.fromARGB(255, 249, 220, 253),
      ),
      // Widget ComponentTextDescription untuk instruksi tambahan
      ComponentTextDescription(
        "- Fill each box below with a text or an image.\n-The right and left boxes positions will be randomized on the student app.",
        fontSize: size.sizeTextDescriptionGlobal - 4.sp,
        fontWeight: FontWeight.bold,
      ),
      ComponentSelectAnswerType(),
      ComponentSelectAnswerType(),
      ComponentSelectAnswerType(),
      ComponentSelectAnswerType(),
      SizedBox(
        height: 50.h,
      )
    ]);
  }
}

class GroupForm extends StatefulWidget {
  @override
  State<GroupForm> createState() => _GroupFormState();
}

class _GroupFormState extends State<GroupForm> {
  List<Widget> resultDrag = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          // Widget TextFieldFormMultiLine untuk pertanyaan
          TextFieldFormMultiLine(
            minCharacterHint: 20,
            hintStyle: GoogleFonts.nunito(
              fontSize: size.sizeTextDescriptionGlobal.sp,
              color: ListColor.colorOutlineTextFieldWhenEmpty,
            ),
            labelText: "Question",
            textEditingControllerEmail: TextEditingController(),
            hintText: "Write a question \nmax 300 characters",
            showIndicatorMin: false,
            minLines: 5,
            lengthMax: 700,
            colorBackgroundTextField: Color.fromARGB(255, 249, 220, 253),
          ),
          Row(
            children: [
              Expanded(
                child: TextFieldForm(
                  textEditingControllerEmail: TextEditingController(),
                  hintText: "",
                  hintStyle: GoogleFonts.nunito(
                      fontSize: size.sizeTextDescriptionGlobal - 10.sp),
                  labelText: "Group 1 name",
                  sizeTextLabel: 10,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: TextFieldForm(
                  textEditingControllerEmail: TextEditingController(),
                  hintText: "",
                  labelText: "Group 2 name",
                  sizeTextLabel: 10,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: DragTarget(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 226, 254, 235),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: Colors.black, width: 2)),
                        height: 200.h,
                        child: Column(
                          children: [...resultDrag],
                        ));
                  },
                  onAccept: (data) {
                    setState(() {
                      resultDrag.add(
                        Container(
                          width: 40.w,
                          height: 40.h,
                          color: Colors.yellow,
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 226, 254, 235),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.black, width: 2)),
                height: 200.h,
              )),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          ComponentTextDescription(
            "Add Group Elements",
            fontSize: size.sizeTextDescriptionGlobal.sp,
            fontWeight: FontWeight.bold,
          ),
          ComponentTextDescription(
            "- Fill the box below and drag it into one of the two groups above\n- Each group can have between 1 to 4 elements\n- To remove a box, drag it outside the group box.",
            fontSize: size.sizeTextDescriptionGlobal - 5.sp,
            fontWeight: FontWeight.bold,
            maxLines: 6,
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 185, 212, 219),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(width: 2, color: Colors.black)),
              child: Center(
                  child: Draggable(
                child: BoxAddQuestionType(),
                feedback: BoxAddQuestionType(),
              )))
          // Widget ComponentTextDescription untuk instruksi tambahan
        ]);
  }
}

class ComponentSelectAnswerType extends StatelessWidget {
  const ComponentSelectAnswerType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BoxAddQuestionType(),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.r)),
                height: 10.h,
                width: 30.h,
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.r)),
                height: 10.h,
                width: 30.h,
              )
            ],
          ),
          BoxAddQuestionType()
        ],
      ),
    );
  }
}

class ComponentTextFieldDragQuest extends StatefulWidget {
  @override
  _ComponentTextFieldDragQuestState createState() =>
      _ComponentTextFieldDragQuestState();
}

class _ComponentTextFieldDragQuestState
    extends State<ComponentTextFieldDragQuest> {
  TextEditingController _textController =
      TextEditingController(text: " Type Text ");
  double _textFieldWidth = 100.0;
  int i = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 250, 231, 249),
          borderRadius: BorderRadius.circular(10)),
      width: _textFieldWidth,
      child: TextField(
        controller: _textController,
        style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: size.sizeTextDescriptionGlobal.sp),
        decoration: InputDecoration(
          border: InputBorder.none, // Remove the outline
        ),
        onEditingComplete: () {
          if (i == 1) {
            _textController.text = ' ' + _textController.text;
          }
          setState(() {
            i++;
          });
        },
        onSubmitted: (value) {
          if (i == 1) {
            _textController.text = ' ' + _textController.text;
          }
          setState(() {
            i++;
          });
        },
        onChanged: (value) {
          // Calculate the required width based on the text input length

          setState(() {
            _textFieldWidth = (value.length * 10).toDouble();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class ComponentTextFieldDragAnswer extends StatefulWidget {
  @override
  ComponentTextFieldDragAnswerState createState() =>
      ComponentTextFieldDragAnswerState();
}

class ComponentTextFieldDragAnswerState
    extends State<ComponentTextFieldDragAnswer> {
  TextEditingController _textController =
      TextEditingController(text: " Type Answer ");
  double _textFieldWidth = 100.0;
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          color: Color.fromARGB(255, 213, 139, 215),
          borderRadius: BorderRadius.circular(10)),
      width: _textFieldWidth,
      child: TextField(
        controller: _textController,
        textAlign: TextAlign.start,
        cursorWidth: 0,
        onEditingComplete: () {
          if (i == 1) {
            _textController.text = ' ' + _textController.text;
          }
          setState(() {
            i++;
          });
        },
        onSubmitted: (value) {
          if (i == 1) {
            _textController.text = ' ' + _textController.text;
          }
          setState(() {
            i++;
          });
        },
        style: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: size.sizeTextDescriptionGlobal.sp,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          border: InputBorder.none, // Remove the outline
          contentPadding: EdgeInsets.zero, // Remove padding
        ),
        onChanged: (value) {
          // Calculate the required width based on the text input length

          setState(() {
            _textFieldWidth = (value.length * 10).toDouble();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class FillBlankForm extends StatefulWidget {
  @override
  State<FillBlankForm> createState() => _FillBlankFormState();
}

class _FillBlankFormState extends State<FillBlankForm> {
  List<Widget> listWidgetQUestion = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 10.h),
      // Widget TextFieldFormMultiLine untuk pertanyaan

      TextFieldFormMultiLine(
        minCharacterHint: 20,
        hintStyle: GoogleFonts.nunito(
          fontSize: size.sizeTextDescriptionGlobal.sp,
          color: ListColor.colorOutlineTextFieldWhenEmpty,
        ),
        labelText: "Text",
        textEditingControllerEmail: TextEditingController(text: "questionText"),
        hintText: "Write a question \nmax 300 characters",
        showIndicatorMin: false,
        minLines: 5,
        lengthMax: 700,
        colorBackgroundTextField: Color.fromARGB(255, 249, 220, 253),
      ),
      SizedBox(
        height: 10.h,
      ),
      DragTarget(
        builder: (context, candidateData, rejectedData) {
          return Stack(
            children: [
              Container(
                height: 200.h,
                margin: EdgeInsets.only(top: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 215, 252),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(width: 2, color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                      children: listWidgetQUestion,
                      spacing: 8.w,
                      runSpacing: 2.0.w),
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin:
                          EdgeInsets.only(left: size.sizeMarginLeftTittle.w),
                      color: Color.fromARGB(255, 248, 209, 250),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: ComponentTextDescription(
                          "Text",
                          fontWeight: FontWeight.normal,
                          fontSize: size.sizeTextDescriptionGlobal - 3,
                        ),
                      ))),
            ],
          );
        },
        onAccept: (data) {
          if (data == "textfield") {
            Get.snackbar("Alert", "TextField Added");
            listWidgetQUestion.add(ComponentTextFieldDragQuest());
          }
          if (data == "answer_textfield") {
            Get.snackbar("Alert", "Answer TextField Added");
            listWidgetQUestion.add(ComponentTextFieldDragAnswer());
          }
        },
      ),

      SizedBox(
        height: 10.h,
      ),

      SizedBox(
        height: 10.h,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ComponentTextDescription(
                "Add Text",
                fontSize: size.sizeTextDescriptionGlobal.sp,
                fontWeight: FontWeight.bold,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 249, 221, 251),
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Draggable(
                  data: "textfield",
                  child: Container(
                    height: 40.h,
                    padding: EdgeInsets.all(10.w),
                    margin: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 249, 234, 249),
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: ComponentTextDescription(
                      "Text Field",
                      fontWeight: FontWeight.bold,
                      fontSize: size.sizeTextDescriptionGlobal.sp,
                    ),
                  ),
                  feedback: Container(
                    padding: EdgeInsets.all(10.w),
                    margin: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 249, 234, 249),
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: ComponentTextDescription(
                      "Main Field",
                      fontSize: size.sizeTextDescriptionGlobal.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ComponentTextDescription("Add Blanks",
                  fontWeight: FontWeight.bold,
                  fontSize: size.sizeTextDescriptionGlobal.sp),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 249, 221, 251),
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Draggable(
                  data: "answer_textfield",
                  child: Container(
                    height: 40.h,
                    padding: EdgeInsets.all(10.w),
                    margin: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 213, 139, 215),
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: ComponentTextDescription(
                      "Main Field",
                      fontWeight: FontWeight.bold,
                      fontSize: size.sizeTextDescriptionGlobal.sp,
                    ),
                  ),
                  feedback: Container(
                    padding: EdgeInsets.all(10.w),
                    margin: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 213, 139, 215),
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: ComponentTextDescription(
                      "Main Field",
                      fontWeight: FontWeight.bold,
                      fontSize: size.sizeTextDescriptionGlobal.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      ComponentTextDescription(
        " - Fill the box below and drag it in the text box above.\n - To remove a box, drag it outside the text area.",
        fontSize: size.sizeTextDescriptionGlobal - 3.sp,
        maxLines: 4,
      ),
      ComponentTextDescription(
        " - Fill the box below and drag it in the text box above.\n - You can add up to 6 blanks of 30 chracters each.\n - To remove a box, drag it outside the text area.",
        fontSize: size.sizeTextDescriptionGlobal - 3.sp,
        maxLines: 4,
      ),
      SizedBox(
        height: 10.h,
      ),

      SizedBox(
        height: 10.h,
      ),
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
        onTap: () {},
      ),
      // Widget ComponentTextDescription untuk instruksi tambahan
    ]);
  }
}

class BoxAddQuestionType extends StatefulWidget {
  @override
  State<BoxAddQuestionType> createState() => _BoxAddQuestionTypeState();
}

class _BoxAddQuestionTypeState extends State<BoxAddQuestionType> {
  TextEditingController _textEditingController = TextEditingController();
  String? resultAddText = "";
  String? resultAddLatex = "";
  File? resultAddImage;
  bool? isLatexAdded = false;
  bool? isImageAdded = false;

  Future<void> _showMyDialogAddText() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              // Background blur effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
              // Content
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 200.w,
                              height: 200.h,
                              child: AutoSizeTextField(
                                keyboardType: TextInputType.text,
                                controller: _textEditingController,
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 120.sp),
                                maxFontSize: 90,
                                minFontSize: 60,
                                stepGranularity: 10,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  border:
                                      InputBorder.none, // Remove the outline
                                ),
                                minLines: 2,
                                onEditingComplete: () {},
                                onChanged: (value) {
                                  // Calculate the required width based on the text input length
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resultAddText = _textEditingController.text;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text('Add Text'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    print("add text" + resultAddText!);
  }

  String latexCode = "";
  Future<void> _showMyDialogAddLatex() async {
    showDialog(
      context: context,
      builder: (context) {
        String contentText = "Content of Dialog";
        return StatefulBuilder(
          builder: (context, setStates) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  // Background blur effect
                  BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                      child: Container(
                        color: Colors.white.withOpacity(0.0),
                      )),
                  // Content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ComponentTextDescription("Latex Code",
                                    teksColor: Colors.white,
                                    fontSize:
                                        size.sizeTextDescriptionGlobal.sp),
                                Container(
                                  height: 100.h,
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _textEditingController,
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:
                                            size.sizeTextDescriptionGlobal.sp),
                                    decoration: InputDecoration(
                                      border: InputBorder
                                          .none, // Remove the outline
                                    ),
                                    maxLines: null,
                                    onEditingComplete: () {},
                                    onChanged: (value) {
                                      // Calculate the required width based on the text input length
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    ClipboardData? cdata =
                                        await Clipboard.getData(
                                            Clipboard.kTextPlain);
                                    String copiedtext = cdata!.text!;
                                    Get.snackbar("Information",
                                        "Paste Latex from clipboard succesfully");
                                    setStates(() {
                                      _textEditingController.text = copiedtext;
                                    });
                                  },
                                  child: Container(
                                    width: 130.w,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3, color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color:
                                            Color.fromARGB(255, 187, 252, 199)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ComponentTextDescription(
                                        "Paste\nLaTeX Code",
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            size.sizeTextDescriptionGlobal -
                                                3.sp,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ComponentTextDescription("Latex Code",
                                    teksColor: Colors.white,
                                    fontSize:
                                        size.sizeTextDescriptionGlobal.sp),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 3, color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    height: 100.h,
                                    width: 100.w,
                                    child: TeXView(
                                      child: TeXViewColumn(children: [
                                        TeXViewDocument(latexCode,
                                            style: TeXViewStyle(
                                                padding:
                                                    TeXViewPadding.all(10))),
                                      ]),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Get.snackbar("Information",
                                        "Generate LaTeX Succesfully");
                                    setStates(() {
                                      latexCode = "<p>" +
                                          _textEditingController.text +
                                          "</p>";
                                    });
                                  },
                                  child: Container(
                                    width: 130.w,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3, color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color:
                                            Color.fromARGB(255, 223, 170, 250)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ComponentTextDescription(
                                        "Generate\nLaTeX Output",
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            size.sizeTextDescriptionGlobal -
                                                3.sp,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              resultAddText =
                                  "<p>" + _textEditingController.text + "</p>";
                              isLatexAdded = true;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Add Text'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
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
        resultAddImage = File(image.path);
        resultAddText = image.path;
        isImageAdded = true;
      });
    } else {
      // User canceled the selection
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 102.h,
      width: 110.w,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 235, 235),
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20.r)),
      child: resultAddText == ""
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _showMyDialogAddText();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 168, 252, 155),
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      child: ComponentTextDescription(
                        "Add Text",
                        fontWeight: FontWeight.bold,
                        fontSize: size.sizeTextDescriptionGlobal - 5.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    _showMyDialogAddLatex();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 120, 215, 222),
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
                      child: ComponentTextDescription(
                        "add latex",
                        fontWeight: FontWeight.bold,
                        fontSize: size.sizeTextDescriptionGlobal - 5.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 189, 251),
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
                      child: ComponentTextDescription(
                        "Add Image",
                        fontWeight: FontWeight.bold,
                        fontSize: size.sizeTextDescriptionGlobal - 5.sp,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : isImageAdded == true
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18.r),
                      child: Image.file(
                        resultAddImage!,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Get.snackbar("Click", "Delete");
                          resultAddImage = null;
                          isImageAdded = false;
                          resultAddText = "";
                        });
                      },
                      child: Container(
                        height: 40.h,
                        transform: Matrix4.translationValues(40.w, -5.h, 0),
                        child: Card(
                          shape: CircleBorder(
                            side: BorderSide(
                              width: size.sizeBorderBlackGlobal,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: ComponentTextDescription(
                              '\u00D7',
                              fontSize: size.sizeTextDescriptionGlobal + 0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    isLatexAdded == true
                        ? Container(
                            height: 110.h,
                            width: 110.w,
                            child: TeXView(
                                loadingWidgetBuilder: (BuildContext ctx) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                child: TeXViewInkWell(
                                    child: TeXViewColumn(children: [
                                      TeXViewDocument(latexCode,
                                          style: TeXViewStyle(
                                              padding: TeXViewPadding.all(10))),
                                    ]),
                                    id: "id_0")),
                          )
                        : Container(
                            height: 110.h,
                            width: 110.w,
                            child: Center(
                              child: AutoSizeText(
                                '${resultAddText}',
                                style: TextStyle(fontSize: 30),
                                maxLines: 2,
                              ),
                            ),
                          ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Get.snackbar("Click", "Delete");
                          resultAddImage = null;
                          isImageAdded = false;
                          isLatexAdded = false;
                          resultAddText = "";
                          latexCode = "";
                          _textEditingController.text = "";
                        });
                      },
                      child: Container(
                        height: 40.h,
                        transform: Matrix4.translationValues(40.w, -5.h, 0),
                        child: Card(
                          shape: CircleBorder(
                            side: BorderSide(
                              width: size.sizeBorderBlackGlobal,
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: ComponentTextDescription(
                              '\u00D7',
                              fontSize: size.sizeTextDescriptionGlobal + 0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

class QuizFormWidget extends StatefulWidget {
  @override
  _QuizFormWidgetState createState() => _QuizFormWidgetState();
}

class _QuizFormWidgetState extends State<QuizFormWidget> {
  // Define atribut-atribut yang diperlukan untuk menyimpan data
  String questionText = "";
  List<String?> answerText = ["", "", "", ""];
  String? selectedImage = "";
  int selectedItemIndex = -1;
  final List<String> answerChoices = [
    "Choice 1",
    "Choice 2",
    "Choice 3",
    "Choice 4"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        // Widget TextFieldFormMultiLine untuk pertanyaan

        SizedBox(
          height: 20.h,
        ),
        TextFieldFormMultiLine(
          minCharacterHint: 20,
          hintStyle: GoogleFonts.nunito(
            fontSize: size.sizeTextDescriptionGlobal.sp,
            color: ListColor.colorOutlineTextFieldWhenEmpty,
          ),
          labelText: "Question",
          textEditingControllerEmail: TextEditingController(text: questionText),
          hintText: "Write a question \nmax 300 characters",
          showIndicatorMin: false,
          minLines: 5,
          lengthMax: 700,
          colorBackgroundTextField: Color.fromARGB(255, 249, 220, 253),
        ),
        // Widget ComponentTextDescription untuk instruksi tambahan
        ComponentTextDescription(
          "Optional:\n-Upload a picture related to the question.\n-PNG or Jpeg\n-Max 3 MB",
          fontSize: size.sizeTextDescriptionGlobal - 4.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 20.h),
        // Widget untuk menambahkan gambar
        if (selectedImage!.isEmpty)
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
        // Widget untuk menampilkan gambar yang sudah dipilih
        if (selectedImage!.isNotEmpty)
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0.w),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.file(
                    File(selectedImage!),
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 1,
                child: Container(
                  transform: Matrix4.translationValues(5, -20.h, 0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImage = "";
                        // Clear selected image here
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
                            fontSize: size.sizeTextDescriptionGlobal + 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        SizedBox(height: 20.h),
        // Widget untuk jawaban
        GestureDetector(
          onTap: () {},
          child: TextFieldFormMultiLine(
            minCharacterHint: 20,
            hintStyle: GoogleFonts.nunito(
              fontSize: size.sizeTextDescriptionGlobal.sp,
              color: ListColor.colorOutlineTextFieldWhenEmpty,
            ),
            labelText: "Answer 1",
            textEditingControllerEmail:
                TextEditingController(text: answerText[0]),
            hintText: "Max 200 characters",
            showIndicatorMin: false,
            showIndicatorMax: false,
            minLines: 5,
            lengthMax: 700,
            colorBackgroundTextField: Color.fromARGB(255, 249, 220, 253),
          ),
        ),
        SizedBox(height: 20.h),
        // Widget untuk pilihan jawaban
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.9,
          ),
          itemCount: answerChoices.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  // Ketika item diklik, atur indeks item yang dipilih
                  selectedItemIndex = index;
                  // Update selected answer here
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2),
                    color: selectedItemIndex == index
                        ? Color.fromARGB(255, 178, 253, 178)
                        : Color.fromARGB(255, 183, 155, 248)),
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
        SizedBox(height: 30.h),
      ],
    );
  }

  // Fungsi untuk memilih gambar
  void pickImage() {
    // Implement image picking logic here
  }
}

class ModelQuestionMatching {
  String? questionText;
  List<String>? answerLeft;
  List<String>? answerRight;
  bool? statusFilled = false;
  ModelQuestionMatching({
    this.questionText,
    this.answerLeft,
    this.answerRight,
  });
  bool isFullyFilled() {
    // Memeriksa apakah semua atribut yang perlu diisi sudah terisi
    return questionText != null &&
        answerLeft != null &&
        answerRight != null &&
        !answerLeft!.any((answer) => answer == null) &&
        !answerRight!.any((answer) => answer == null);
  }
}

class ModelQuestionMultipleChoiceQuestions {
  String? questionText;
  String? imageQuiz;
  List<String>? answerText;
  String? answer;

  ModelQuestionMultipleChoiceQuestions({
    this.questionText,
    this.imageQuiz,
    this.answerText,
    this.answer,
  });

  bool isFullyFilled() {
    // Memeriksa apakah semua atribut yang perlu diisi sudah terisi
    return questionText != null &&
        imageQuiz != null &&
        answerText != null &&
        answer != null &&
        !answerText!.any((answer) => answer == null);
  }
}

Widget widgetQuestionType(String name, String assetsIconSvg) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color.fromARGB(255, 249, 220, 252),
        border: Border.all()),
    child: Padding(
      padding: EdgeInsets.all(size.sizeMarginLeftTittle - 2.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ComponentTextDescription("${name}",
            isWrappedText: true, fontSize: size.sizeTextDescriptionGlobal.sp),
        SvgPicture.asset("${assetsIconSvg}")
      ]),
    ),
  );
}

class ModelQuestionGroup {
  String? groupName1;
  String? groupName2;
  List<String>? groupNameElement1;
  List<String>? groupNameElement2;

  ModelQuestionGroup({
    this.groupName1,
    this.groupName2,
    this.groupNameElement1,
    this.groupNameElement2,
  });

  bool isFullyFilled() {
    // Memeriksa apakah semua atribut yang perlu diisi sudah terisi
    return groupName1 != null &&
        groupName2 != null &&
        groupNameElement1 != null &&
        groupNameElement2 != null &&
        !groupNameElement1!.any((element) => element == null) &&
        !groupNameElement2!.any((element) => element == null);
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
            builder: (context) => PageProfileAddVideoQuizCustom(),
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
