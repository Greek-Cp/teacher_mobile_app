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
import 'package:teacher_mobile_app/res/border/border.dart';
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
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_description.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_select_language.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_playgorund.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_add_video_description.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ModelQuizVideo {
  String? question = "";
  String? imagePathQuestion = "";
  String? answer1 = "";
  String? answer2 = "";
  String? answer3 = "";
  String? answer4 = "";
  bool? rightAnswer1;
  bool? rightAnswer2;
  bool? rightAnswer3;
  bool? rihgtAnswer4;
  ModelQuizVideo(
      {this.question,
      this.imagePathQuestion,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.rightAnswer1,
      this.rightAnswer2,
      this.rightAnswer3,
      this.rihgtAnswer4});
}

class DropdownControllerCourse extends GetxController {
  List<List<ModelDropDownMultiChoose>> listDropDown = [
    [
      ModelDropDownMultiChoose("Germany", false),
      ModelDropDownMultiChoose("French", false),
      ModelDropDownMultiChoose("United Kingdom", false),
      ModelDropDownMultiChoose("Indonesia", false),
      ModelDropDownMultiChoose("Usa", false),
    ].obs,
    [
      ModelDropDownMultiChoose("Grade 1", false),
      ModelDropDownMultiChoose("Grade 2", false),
      ModelDropDownMultiChoose("Grade 3", false),
    ],
    [
      ModelDropDownMultiChoose("Physic", false),
      ModelDropDownMultiChoose("Mathematic", false),
      ModelDropDownMultiChoose("Algrebra", false),
    ]
  ].obs;

  var targetCountry = "".obs;
  var mainLanguage = "".obs;
  var grades = "".obs;
  var subject = "".obs;
  var topics = "".obs;
  var videoTittle = "".obs;
  var videoDescripiton = "".obs;
  var videoPathCreate = "".obs;
  var videoPathThumbnail = "".obs;
  var videoCourseName = "".obs;
  var videoCourseDescription = "".obs;

  RxList<ModelQuizVideo> listModelQuizVideo = [
    ModelQuizVideo(),
    ModelQuizVideo(),
    ModelQuizVideo(),
  ].obs;

  List<RxInt> listItemCount = List.generate(3, (index) => 0.obs);

  void updateItemCount(int indexItemCount, int valueNew) {
    listItemCount[indexItemCount].value = valueNew;
    print("after changed ${listItemCount[indexItemCount].value}");
  }

  void updateItem(int index, bool isSelected, int dropDown) {
    listDropDown[dropDown][index].itemSelected = isSelected;
  }

  Rx<Color?> buttonColor =
      ListColor.colorbuttonPageVideoDescriptionDisabled.obs;
  Rx<Color?> buttonColorPageVideoUpload =
      ListColor.colorbuttonPageVideoDescriptionDisabled.obs;
  List<RxBool> listIsFilledDataDropDown =
      List.generate(5, (index) => false.obs);

  List<List<String>> listItemSelectedByUser = [[], [], []];

  void addItemSelected(int indexItem, String name) {
    print("add item ${name}");
    listItemSelectedByUser[indexItem].add(name);
  }

  void removeItemSelectedListUser(int indexItem, String name) {
    print("remove item ${name}");

    listItemSelectedByUser[indexItem].remove(name);
  }

  bool isFilledPath = false;
  void checkIsVideoPathFilled() {
    if (videoPathCreate.value.isEmpty == true &&
        videoPathThumbnail.isEmpty == true) {
      isFilledPath = false;
    } else {
      isFilledPath = true;
    }
    buttonColorPageVideoUpload.value = isFilledPath
        ? ListColor.colorbuttonPageVideoDescriptionEnabled
        : ListColor.colorbuttonPageVideoDescriptionDisabled;
  }

  void updateButtonColor() {
    bool isAllTrue = listIsFilledDataDropDown.every((element) {
      print("valbool = ${element}");
      return element.value;
    });
    buttonColor.value = isAllTrue
        ? ListColor.colorbuttonPageVideoDescriptionEnabled
        : ListColor.colorbuttonPageVideoDescriptionDisabled;
  }
}

class PageProfileAddVideoCourse extends StatefulWidget {
  static String? routeName = "/PageAddVideoCategory";

  @override
  State<PageProfileAddVideoCourse> createState() =>
      _PageProfileAddVideoCourseState();
}

class _PageProfileAddVideoCourseState extends State<PageProfileAddVideoCourse>
    with TickerProviderStateMixin {
  TextEditingController textEditingControllerFirstName =
      TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
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
    animationControllerSelectLanguage = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);
    marginContainer = 430;
    marginConfirm = 400;
    if (dropdownController.targetCountry != "") {
      textEditingControllerSelectCountry.text =
          dropdownController.targetCountry.value;
    } else {
      textEditingControllerSelectCountry.text = "Select a Country";
    }
    if (dropdownController.grades != "") {
      textEditingControllerGrades.text = dropdownController.grades.value;
    } else {
      textEditingControllerGrades.text = "Select a Grade";
    }
    if (dropdownController.topics != "") {
      textEditingControllerTopics.text = dropdownController.topics.value;
    } else {
      textEditingControllerTopics.text = "Select a Topic";
    }
    if (dropdownController.mainLanguage != "") {
      textEditingControllerMainLanguage.text =
          dropdownController.mainLanguage.value;
    } else {
      textEditingControllerMainLanguage.text = "Select a Language";
    }
    if (dropdownController.subject != "") {
      textEditingControllerSubject.text = dropdownController.subject.value;
    } else {
      textEditingControllerSubject.text = "Select a Subject";
    }
  }

  bool isCheckedBox = false;
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
  AccountUserController controllerAccount = Get.find<AccountUserController>();
  ScrollController _scrollController = ScrollController();
  final DropdownControllerCourse dropdownController =
      Get.put(DropdownControllerCourse());

  double marginConfirm = 0;
  double marginContainer = 0;
  final _formKey = GlobalKey<FormState>();
  List<Widget> listWidget = [];
  int indexLanguage = 1;
  int limitLanguage = 0;
  int maxLanguage = 2;
  int widgetDropDown = 0;
  String ad = "or";

  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();
  bool showTextAddWidget = true;
  TextEditingController textEditingControllerMainLanguage =
      TextEditingController();
  TextEditingController textEditingControllerGrades = TextEditingController();
  TextEditingController textEditingControllerSubject = TextEditingController();
  TextEditingController textEditingControllerTopics = TextEditingController();
  TextEditingController textEditingControllerCourseName =
      TextEditingController();
  TextEditingController textEditingControllerCourseDescription =
      TextEditingController();

  List<int> listData = [];
  Color? buttonColor;
  List<String> items1 = [];
  List<String> items2 = [
    '100',
    '200',
    '300',
    '400',
    '500',
    '600',
    '700',
    '800',
    '900',
    '1000',
    '1100',
    '1200',
    '1300',
    '1400'
  ];
  TextEditingController courseName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Color.fromARGB(255, 38, 6, 77),
          systemNavigationBarIconBrightness: Brightness.light));
    }
    print("${dropdownController.listItemCount[0].value} value asu");
    return Scaffold(
      appBar: AppBarPageVideo(
        dropdownController.buttonColor,
        onTapVideoRight: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PageProfileAddVideoDescription()));
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
                      height: 1655.h,
                      margin: EdgeInsets.only(
                          left: size.sizePaddingLeftAndRightPage.w,
                          right: size.sizePaddingLeftAndRightPage.w,
                          top: 20.h,
                          bottom: 50.w),
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
                          controller: _scrollController,
                          child: Form(
                            key: _formKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                  ),

                                  PagePlaygroundaDropDownWidgetMultiChooseBoxTest(
                                    textEditingControllerDropDown:
                                        textEditingControllerSelectCountry,
                                    initialValueDropDown: "Select a Country",
                                    containerHeight: 50,
                                    containerListHeight: 120,
                                    labelText: "Target Country",
                                    listData:
                                        dropdownController.listDropDown[0],
                                    maxBoxChoose: 3,
                                    f: (isFIlled, index, resultSelect,
                                        itemCount, name, statusRemove) {
                                      dropdownController.updateItem(
                                          index, isFIlled, 0);

                                      dropdownController
                                          .listIsFilledDataDropDown[0]
                                          .value = isFIlled;

                                      print(
                                          "asu ${textEditingControllerSelectCountry.text}");
                                      dropdownController.updateButtonColor();
                                      dropdownController.targetCountry.value =
                                          resultSelect;
                                      print("from callback ${itemCount}");
                                      print("name lur ${name}");
                                      dropdownController.updateItemCount(
                                          0, itemCount);
                                      if (statusRemove == true) {
                                        dropdownController
                                            .listItemSelectedByUser[0]
                                            .remove(name);
                                        print(dropdownController
                                                .listItemSelectedByUser[0]
                                                .join(",") +
                                            " data rem  ");
                                      } else {
                                        dropdownController
                                            .listItemSelectedByUser[0]
                                            .add(name);
                                        print(dropdownController
                                                .listItemSelectedByUser[0]
                                                .join(",") +
                                            " data add");
                                      }
                                    },
                                    itemCount: dropdownController
                                        .listItemCount[0].value,
                                    listItemSelectedByUser: dropdownController
                                        .listItemSelectedByUser[0],
                                  ),
                                  SizedBox(height: 20.h),
                                  DropDownWidget(
                                    textEditingControllerDropDown:
                                        textEditingControllerMainLanguage,
                                    initialValueDropDown: "Select a Language",
                                    containerHeight: 50,
                                    containerListHeight: 150,
                                    labelText: "Main Language",
                                    listData: [
                                      "Select a Language",
                                      "English",
                                      "Spanish",
                                      "French",
                                      "German",
                                    ],
                                    isFilledWithData: (isFiled, value) {
                                      print(
                                          "val before add ${dropdownController.listIsFilledDataDropDown[1].value}");

                                      dropdownController
                                          .listIsFilledDataDropDown[1]
                                          .value = isFiled;
                                      dropdownController.mainLanguage.value =
                                          value;

                                      dropdownController.updateButtonColor();
                                      print(
                                          "val after add ${dropdownController.listIsFilledDataDropDown[1].value}");
                                    },
                                  ),
                                  SizedBox(
                                      height: 20
                                          .h), // Add more DropDownWidget instances for other labels
                                  PagePlaygroundaDropDownWidgetMultiChooseBoxTest(
                                    textEditingControllerDropDown:
                                        textEditingControllerGrades,
                                    initialValueDropDown: "Select a Grade",
                                    containerHeight: 50,
                                    labelText: "Grades",
                                    containerListHeight: 90,
                                    listData:
                                        dropdownController.listDropDown[1],
                                    maxBoxChoose: 3,
                                    f: (isFIlled, index, resultString,
                                        itemCount, name, statusRemove) {
                                      dropdownController.updateItem(
                                          index, isFIlled, 1);
                                      dropdownController
                                          .listIsFilledDataDropDown[2]
                                          .value = isFIlled;

                                      dropdownController.updateButtonColor();
                                      dropdownController.grades.value =
                                          resultString;
                                      dropdownController.updateItemCount(
                                          1, itemCount);
                                      if (statusRemove == true) {
                                        dropdownController
                                            .listItemSelectedByUser[1]
                                            .remove(name);
                                      } else {
                                        dropdownController
                                            .listItemSelectedByUser[1]
                                            .add(name);
                                      }
                                    },
                                    itemCount: dropdownController
                                        .listItemCount[1].value,
                                    listItemSelectedByUser: dropdownController
                                        .listItemSelectedByUser[1],
                                  ),
                                  SizedBox(height: 20.h),
                                  DropDownWidget(
                                    textEditingControllerDropDown:
                                        textEditingControllerSubject,
                                    initialValueDropDown: "Select a Subject",
                                    containerHeight: 50,
                                    containerListHeight: 90,
                                    labelText: "Subject",
                                    listData: [
                                      "Subject 1",
                                      "Subject 2",
                                      "Subject 3",
                                      // Add more subject options
                                    ],
                                    isFilledWithData: (isFiled, value) {
                                      dropdownController
                                          .listIsFilledDataDropDown[3]
                                          .value = isFiled;
                                      dropdownController.subject.value = value;
                                      dropdownController.updateButtonColor();
                                    },
                                  ),

                                  SizedBox(height: 20.h),
                                  PagePlaygroundaDropDownWidgetMultiChooseBoxTest(
                                    textEditingControllerDropDown:
                                        textEditingControllerTopics,
                                    initialValueDropDown: "Select a Topic",
                                    maxBoxChoose: 3,
                                    containerHeight: 50,
                                    containerListHeight: 110,
                                    labelText: "Topics",
                                    listData:
                                        dropdownController.listDropDown[2],
                                    f: (isFIlled, index, resultString,
                                        itemCount, name, statusRemove) {
                                      dropdownController.updateItem(
                                          index, isFIlled, 2);
                                      dropdownController
                                          .listIsFilledDataDropDown[4]
                                          .value = isFIlled;

                                      dropdownController.updateButtonColor();
                                      dropdownController.topics.value =
                                          resultString;
                                      dropdownController.updateItemCount(
                                          2, itemCount);
                                      if (statusRemove == true) {
                                        dropdownController
                                            .listItemSelectedByUser[2]
                                            .remove(name);
                                      } else {
                                        dropdownController
                                            .listItemSelectedByUser[2]
                                            .add(name);
                                      }
                                    },
                                    itemCount: dropdownController
                                        .listItemCount[2].value,
                                    listItemSelectedByUser: dropdownController
                                        .listItemSelectedByUser[2],
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
                                    labelText: "Course Name",
                                    textEditingControllerEmail: courseName,
                                    hintText: "course name Max 50 char.",
                                    showIndicatorMin: false,
                                    minLines: 5,
                                    lengthMax: 30,
                                    colorBackgroundTextField:
                                        Color.fromARGB(255, 249, 220, 253),
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
                                    labelText: "Course Description",
                                    textEditingControllerEmail:
                                        TextEditingController(text: ""),
                                    hintText: "course name Max 80 char.",
                                    showIndicatorMin: false,
                                    minLines: 5,
                                    lengthMax: 100,
                                    colorBackgroundTextField:
                                        Color.fromARGB(255, 249, 220, 253),
                                  ),
                                  CardVideo(
                                      hintText: "hintText",
                                      labelVideo: "labelVideo"),
                                  Container(
                                    height: 30.h,
                                  ),
                                  Container(
                                    height: 600.h,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 15.w),
                                          child: ComponentTextDescription(
                                              courseName.text,
                                              fontSize: size
                                                  .sizeTextDescriptionGlobal
                                                  .sp),
                                        ),
                                        Expanded(
                                          child: buildGridView(items1, items2,
                                              1, true, _controller1),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 15.w),
                                          child: ComponentTextDescription(
                                              "My Videos",
                                              fontSize: size
                                                  .sizeTextDescriptionGlobal
                                                  .sp),
                                        ),
                                        Expanded(
                                          child: buildGridView(items2, items1,
                                              0, false, _controller2),
                                        ),
                                      ],
                                    ),
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
                            top: 1650.h, left: 20.h, right: 20.h),
                        child: Center(
                            child: ButtonLongForm(
                          nameButton: "Next",
                          routeName: PageProfileMenuSelectLanguage.routeName
                              .toString(),
                          formKey: _formKey,
                          heightLongHeader: 40.h,
                          onClickButton: () {
                            print("clicked");

                            if (textEditingControllerSelectCountry.text == "Select a Country" &&
                                textEditingControllerGrades.text ==
                                    "Select a Grade" &&
                                textEditingControllerTopics.text ==
                                    "Select a Topic" &&
                                textEditingControllerMainLanguage.text ==
                                    "Select a Language" &&
                                textEditingControllerSubject.text ==
                                    "Select a Subject") {
                              // Jika semua nilai teks adalah teks default
                              // Set variabel dis menjadi true
                            } else {
                              // Jika setidaknya satu nilai teks bukan teks default
                              // Set variabel dis menjadi false
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          PageProfileAddVideoDescription()));
                            }
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
                              nameButton: "Video Category",
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

  Widget buildGridView(List<String> items, List<String> otherItems,
      int gridSize, bool isPlaylistPlace, ScrollController controller) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(20.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: GridView.builder(
          controller: controller,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 1.5.w,
              crossAxisSpacing: 1..w),
          itemCount: items.length + gridSize,
          itemBuilder: (context, index) {
            return DragTarget<String>(
              onWillAccept: (data) => true,
              onAccept: (data) {
                setState(() {
                  bool isNewItem = !items
                      .contains(data); // Variable to track if the item is new

                  if (isNewItem) {
                    if (index < items.length) {
                      items.insert(index, data);
                    } else {
                      items.add(data);
                    }
                    otherItems.remove(data);
                  } else {
                    // Only perform the swap if the index is within the list's range
                    if (index < items.length) {
                      int oldIndex = items.indexOf(data);

                      // Make sure the old index is also valid
                      if (oldIndex >= 0 && oldIndex < items.length) {
                        String temp = items[index];
                        items[index] = items[oldIndex];
                        items[oldIndex] = temp;
                      }
                    }
                  }

                  // Only auto-scroll if the item is new
                  if (isNewItem) {
                    controller.animateTo(
                      controller.position.maxScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                });
              },
              builder: (context, candidateData, rejectedData) {
                if (index < items.length) {
                  return Draggable<String>(
                    data: items[index],
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 179, 192, 250),
                          borderRadius: BorderRadius.all(Radius.circular(0.r))),
                      width: MediaQuery.of(context).size.width *
                          0.3, // 30% of the screen width
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                          child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Stack(
                          children: [
                            isPlaylistPlace == false
                                ? Container()
                                : Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5.w, bottom: 5.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 109, 197, 135),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ComponentTextDescription(
                                          (index + 1).toString(),
                                          fontWeight: FontWeight.bold,
                                          teksColor: Colors.white,
                                          fontSize:
                                              size.sizeTextDescriptionGlobal.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 5.w, bottom: 5.h),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 0, 1, 16),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.play_arrow_outlined,
                                      color: Color.fromARGB(255, 133, 146, 193),
                                    ),
                                    ComponentTextDescription(
                                      "${items[index]}",
                                      fontSize: size.sizeTextDescriptionGlobal,
                                      teksColor:
                                          Color.fromARGB(255, 133, 146, 193),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    feedback: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 179, 192, 250),
                          borderRadius: BorderRadius.all(Radius.circular(0.r))),
                      width: MediaQuery.of(context).size.width *
                          0.3, // 30% of the screen width
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                          child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 5.w, bottom: 5.h),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 0, 1, 16),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.play_arrow_outlined,
                                      color: Color.fromARGB(255, 133, 146, 193),
                                    ),
                                    ComponentTextDescription(
                                      "${items[index]}",
                                      fontSize: size.sizeTextDescriptionGlobal,
                                      teksColor:
                                          Color.fromARGB(255, 133, 146, 193),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    onDragEnd: (details) {
                      if (!details.wasAccepted) {
                        setState(() {
                          otherItems.add(items[index]);
                          items.removeAt(index);
                        });
                      }
                    },
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    alignment: Alignment.center,
                    color:
                        Colors.white.withOpacity(0.5), // Color for empty slot
                    child: ComponentTextDescription(
                      "Drag and drop a Video to add it to the course",
                      fontSize: size.sizeTextDescriptionGlobal - 5.sp,
                      maxLines: 4,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            );
          },
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

class ListVideoHorizontal extends StatelessWidget {
  Color? colorBackroundList;
  Color? colorBackgroundItemListCard;
  String? headerText;
  IconData? unicodeIcon;
  ListVideoHorizontal(
      {this.colorBackroundList,
      this.colorBackgroundItemListCard,
      this.headerText,
      this.unicodeIcon});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin:
                    EdgeInsets.only(left: size.sizePaddingLeftAndRightPage.w),
                padding: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, width: size.sizeBorderBlackGlobal),
                    color: this.colorBackroundList == null
                        ? ListColor.colorBackgroundVideosList
                        : colorBackroundList,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 7.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(5, (index) {
                            return Container(
                              padding: EdgeInsets.all(8.0.h),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ListColor.colorPlaceHolderVideo,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                width: MediaQuery.of(context).size.width *
                                    0.3, // 30% of the screen width
                                height: MediaQuery.of(context).size.width * 0.4,
                                child: Center(
                                    child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 5.w, bottom: 5.h),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 20, 20, 20),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.play_arrow_outlined,
                                                color: Color.fromARGB(
                                                    255, 133, 146, 193),
                                              ),
                                              ComponentTextDescription(
                                                "4564",
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                teksColor: Color.fromARGB(
                                                    255, 133, 146, 193),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 5.w, top: 5.h),
                                          child: ComponentTextDescription(
                                            "👍",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Color.fromARGB(
                                                255, 133, 146, 193),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
              margin: EdgeInsets.only(
                  left: size.sizePaddingLeftAndRightPage + 20.w,
                  top: size.sizePaddingLeftAndRightPage + 2.5.h,
                  bottom: size.sizePaddingLeftAndRightPage - 5.h),
              child: Padding(
                padding: EdgeInsets.all(8.0.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    ComponentTextDescription(
                      "${headerText}",
                      fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                      teksColor: ListColor.colorFontPageNav,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Icon(
                      unicodeIcon,
                      size: 20.h,
                      color: ListColor.colorFontPageNav,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetCardCourseItem extends StatelessWidget {
  const WidgetCardCourseItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Card(
        color: ListColor.colorBackgoundItemCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.sizeRoundedGlobal),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double fontSizeHeader = (screenWidth < 600)
                ? size.sizeTextHeaderGlobal - 15
                : size.sizeTextHeaderGlobal - 9;

            double fontSizeDescription = (screenWidth < 600)
                ? size.sizeTextDescriptionGlobal - 9
                : size.sizeTextDescriptionGlobal - 5;

            return AspectRatio(
              aspectRatio: 2.7 / 3, // Adjust the aspect ratio as needed

              child: Container(
                height: 30.h,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ComponentTextDescription(
                      "3.4k",
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeHeader.sp,
                      teksColor: ListColor.colorFontPageNav,
                    ),
                    ComponentTextDescription(
                      "Student",
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeDescription.sp,
                      teksColor: ListColor.colorFontPageNav,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String name;

  GridItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class WidgetFollowing extends StatelessWidget {
  const WidgetFollowing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 20.w, left: size.sizePaddingLeftAndRightPage.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max, // Ensures minimum required space
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: ComponentTextDescription("Username",
                teksColor: Color.fromARGB(255, 227, 203, 254),
                fontSize: size.sizeTextDescriptionGlobal.sp),
          ),
          Card(
            color: ListColor.colorButtonUnfollow,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: ComponentTextDescription("Unfollow",
                  fontSize: size.sizeTextDescriptionGlobal.sp),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItemPageProfileAddVideoCourse extends StatelessWidget {
  Color? colorCardItem;
  String? valueCard;
  String? descriptionCard;
  Color? colorFont;

  CardItemPageProfileAddVideoCourse({
    Key? key,
    required this.colorCardItem,
    required this.valueCard,
    required this.descriptionCard,
    this.colorFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: colorCardItem,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.sizeRoundedGlobal),
        ),
        child: AspectRatio(
          aspectRatio: 2.7 / 3, // Adjust the aspect ratio as needed
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ComponentTextDescription(
                  "${valueCard}",
                  fontWeight: FontWeight.bold,
                  fontSize: size.sizeTextHeaderGlobal - 2.sp,
                  teksColor: colorFont ?? ListColor.colorFontPageNav,
                ),
                ComponentTextDescription(
                  "$descriptionCard",
                  fontWeight: FontWeight.bold,
                  fontSize: size.sizeTextDescriptionGlobal - 6.sp,
                  teksColor: colorFont ?? ListColor.colorFontPageNav,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TranslucentSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        floating: true,
        pinned: true,
        delegate: _TranslucentSliverAppBarDelegate(
          MediaQuery.of(context).padding,
        ));
  }
}

class _TranslucentSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  /// This is required to calculate the height of the bar
  final EdgeInsets safeAreaPadding;

  _TranslucentSliverAppBarDelegate(this.safeAreaPadding);

  @override
  double get minExtent => safeAreaPadding.top;

  @override
  double get maxExtent => minExtent + kToolbarHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Opacity(
                opacity: 0.93,
                child: Container(
                    // Don't wrap this in any SafeArea widgets, use padding instead
                    padding: EdgeInsets.only(top: safeAreaPadding.top),
                    height: maxExtent,
                    color: Colors.white,
                    // Use Stack and Positioned to create the toolbar slide up effect when scrolled up
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: AppBar(
                            primary: false,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            title: Text("Translucent App Bar"),
                          ),
                        )
                      ],
                    )))));
  }

  @override
  bool shouldRebuild(_TranslucentSliverAppBarDelegate old) {
    return maxExtent != old.maxExtent ||
        minExtent != old.minExtent ||
        safeAreaPadding != old.safeAreaPadding;
  }
}

class ContainerChip extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final String label;
  final double borderWidth;
  final Color labelColor;
  final double labelFontSize;
  final FontWeight labelFontWeight;

  const ContainerChip({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.label,
    required this.borderWidth,
    required this.labelColor,
    required this.labelFontSize,
    required this.labelFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: backgroundColor,
      ),
      child: Container(
        padding: EdgeInsets.all(4.0.h),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        child: ComponentTextDescription(
          "${label}",
          teksColor: labelColor,
          fontSize: size.sizeTextDescriptionGlobal - 7.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  TextEditingController textEditingControllerDropDown = TextEditingController();

  int selectedIndex = 0;

  String? initialValueDropDown;
  double containerHeight = 50;
  double? containerListHeight = 150;
  String? labelText;
  List<String>? listData;
  VoidCallback? voidCallbackDropDownArrowOnTap;
  Color? colorBackgroundDropDown;
  Color? colorBackgroundItemDropDown;
  final Function(String name, int position)? onItemSelected;
  Function(bool isFiled, String data)? isFilledWithData;
  DropDownWidget(
      {this.voidCallbackDropDownArrowOnTap,
      required this.textEditingControllerDropDown,
      required this.initialValueDropDown,
      required this.containerHeight,
      required this.labelText,
      required this.listData,
      this.containerListHeight,
      this.isFilledWithData,
      this.onItemSelected});
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget>
    with TickerProviderStateMixin {
  late final AnimationController animationRotateIndicatorController;
  late final Animation<double> animationRotateDouble;
  late final AnimationController _animationControllerShake;
  late final Animation<double> _animationShake;

  @override
  void initState() {
    super.initState();
    // labelText = tr("select_a_country");
    // textEditingControllerDropDown.text = labelText.toString();
    animationRotateIndicatorController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: 0.5);
    animationRotateDouble = Tween<double>(begin: 0, end: 1.0)
        .animate(animationRotateIndicatorController);
    // widget.textEditingControllerDropDown.text =
    //     widget.initialValueDropDown.toString();

    _animationControllerShake = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animationShake =
        Tween(begin: -5.0, end: 5.0).animate(_animationControllerShake)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationControllerShake.reverse();
            }
          });
  }

  bool isEmpty = false;
  int itemCountAdded = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: _animationControllerShake,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            10 * _animationControllerShake.value,
            0.0,
          ),
          child: child,
        );
      },
      child: Stack(
        children: [
          Stack(children: [
            GestureDetector(
              onTap: () {
                if (animationRotateIndicatorController.status ==
                    AnimationStatus.completed) {
                  animationRotateIndicatorController.reverse(from: 0.5);
                } else {
                  animationRotateIndicatorController.forward(from: 0.0);
                }
                double screenHeight = MediaQuery.of(context).size.height;
                double containerHeight = widget.containerListHeight != null
                    ? widget.containerListHeight!
                    : screenHeight * 0.278;

                if (widget.containerHeight <= 90) {
                  setState(() {
                    widget.containerHeight += containerHeight;
                    if (widget.voidCallbackDropDownArrowOnTap != null) {
                      Future.delayed(Duration(milliseconds: 440),
                          () => {widget.voidCallbackDropDownArrowOnTap!()});
                    }
                  });
                } else {
                  setState(() {
                    widget.containerHeight -= containerHeight;
                  });
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.only(top: 8.h),
                height: widget.containerHeight.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isEmpty == true
                        ? ListColor.colorOutlineTextFieldWhenEmpty
                        : Colors.black,
                    width: 2.0,
                  ),
                  color: isEmpty == true
                      ? ListColor.colorValidationTextFieldBackgroundEmpty
                      : ListColor.colorBackgroundTextFieldAll,
                  borderRadius:
                      BorderRadius.circular(size.roundedCircularGlobal),
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 15.h,
                      left: 15.w,
                      right: 10.w,
                      bottom: 7.h,
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: widget.textEditingControllerDropDown,
                          validator: (value) {
                            print("valuee $value");
                            if (value == widget.initialValueDropDown) {
                              setState(() {
                                isEmpty = true;
                                _animationControllerShake.forward();
                              });
                              return null;
                            } else {
                              setState(() {
                                isEmpty = false;
                              });
                            }
                            return null;
                          },
                          readOnly: true, // Make the field read-only
                          style: FontType.font_utama(
                              fontSize: size.sizeTextDescriptionGlobal.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none, // Remove the outline
                            contentPadding: EdgeInsets.zero, // Remove padding
                            isCollapsed: true, // Collapse the vertical space
                          ),
                        ),
                        UtilLocalization.checkLocalization(context)
                                    .toString() ==
                                "US"
                            ? Positioned(
                                right: 1,
                                child: RotationTransition(
                                  turns: animationRotateIndicatorController,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Image.asset(
                                      "assets/icon/ic_drop_down_chose.png",
                                      width: 20.w,
                                      height: 20.h,
                                      color: isEmpty == true
                                          ? ListColor
                                              .colorOutlineTextFieldWhenEmpty
                                          : Color.fromARGB(255, 114, 87, 216),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 1,
                                child: RotationTransition(
                                  turns: animationRotateIndicatorController,
                                  child: Image.asset(
                                    "assets/icon/ic_drop_down_chose.png",
                                    width: 20.w,
                                    height: 20.h,
                                    color: isEmpty == true
                                        ? ListColor
                                            .colorOutlineTextFieldWhenEmpty
                                        : Color.fromARGB(255, 114, 87, 216),
                                  ),
                                ),
                              ),
                        Container(
                          color: isEmpty == true
                              ? ListColor
                                  .colorValidationTextFieldBackgroundEmpty
                              : ListColor.colorBackgroundTextFieldAll,
                          margin: EdgeInsets.only(top: 40.h),
                          padding: EdgeInsets.only(right: 5, left: 0),
                          child: Scrollbar(
                              thickness: 6,
                              thumbVisibility: true,
                              trackVisibility: true,
                              radius: Radius.circular(30),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemCount: widget.listData!.length,
                                itemBuilder: (context, index) {
                                  return InkResponse(
                                    borderRadius: BorderRadius.circular(30),
                                    highlightColor:
                                        Colors.blue.withOpacity(0.4),
                                    splashColor: Colors.green.withOpacity(0.5),
                                    onTap: () {
                                      //select language
                                      setState(() {
                                        widget.textEditingControllerDropDown
                                            .text = widget.listData![index];
                                        // widget.initialValueDropDown =
                                        if (widget.onItemSelected != null) {
                                          widget.onItemSelected!(
                                              widget.listData![index], index);
                                        }
                                        //     widget.listData![index];
                                        setState(() {
                                          double screenHeight =
                                              MediaQuery.of(context)
                                                  .size
                                                  .height;

                                          if (widget.isFilledWithData != null) {
                                            widget.isFilledWithData!(
                                                true,
                                                widget
                                                    .textEditingControllerDropDown
                                                    .text);

                                            // widget.isFilledWithData!(
                                            //     itemCountAdded);
                                          }
                                          double containerHeight =
                                              widget.containerListHeight != null
                                                  ? widget.containerListHeight!
                                                  : screenHeight * 0.278;

                                          if (animationRotateIndicatorController
                                                  .status ==
                                              AnimationStatus.completed) {
                                            animationRotateIndicatorController
                                                .reverse(from: 0.5);
                                          } else {
                                            animationRotateIndicatorController
                                                .forward(from: 0.0);
                                          }
                                          widget.containerHeight -=
                                              containerHeight;
                                        });
                                        print(
                                            "value${widget.initialValueDropDown}");
                                      });
                                      //EasyLocalization.of(context)
                                      widget.selectedIndex = index;
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 20.h),
                                          child: Divider(
                                            height: 3,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ComponentTextDescription(
                                                widget.listData![index],
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              SizedBox(),
                                              // Padding(
                                              //   padding: EdgeInsets.symmetric(
                                              //       vertical: 2.h,
                                              //       horizontal: 10.h),
                                              //   child: Container(
                                              //     decoration: BoxDecoration(
                                              //         color:
                                              //             widget.selectedIndex ==
                                              //                     index
                                              //                 ? Colors.purple
                                              //                 : ListColor.colorBackgroundTextFieldAll,
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 5.0.r),
                                              //         border: Border.all(
                                              //             color: Colors.black,
                                              //             width: size
                                              //                 .sizeBorderBlackGlobal)),
                                              //     width: 15.w,
                                              //     height: 15.h,
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                        ),
                      ],
                    )),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.only(left: size.sizeMarginLeftTittle.h),
                    color: isEmpty == true
                        ? ListColor.colorValidationTextFieldBackgroundEmpty
                        : ListColor.colorBackgroundTextFieldAll,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: ComponentTextDescription(
                        tr(widget.labelText.toString()),
                        fontWeight: FontWeight.normal,
                        fontSize: size.sizeTextDescriptionGlobal,
                      ),
                    ))),
          ]),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),
    );
  }
}

class CardVideo extends StatefulWidget {
  final String hintText;
  CardVideo(
      {required this.hintText, required this.labelVideo, this.getVideoPath});
  File? selectedImage;
  File? selectedImageThumbnail;
  Uint8List? imageFrameVideo;

  final String labelVideo;
  final Function(String pathVideo)? getVideoPath;

  @override
  State<CardVideo> createState() => _CardVideoState();
}

class _CardVideoState extends State<CardVideo> {
  DropdownControllerCourse dropdownController =
      Get.put(DropdownControllerCourse());

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
