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
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_description.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_select_language.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_playgorund.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_video/page_profile_add_video_description.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

class DropdownController extends GetxController {
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

class PageProfileAddVideoCategory extends StatefulWidget {
  static String? routeName = "/PageAddVideoCategory";

  @override
  State<PageProfileAddVideoCategory> createState() =>
      _PageProfileAddVideoCategoryState();
}

class _PageProfileAddVideoCategoryState
    extends State<PageProfileAddVideoCategory> with TickerProviderStateMixin {
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
    print("d1 : ${dropdownController.targetCountry.value}");

    print("d2 : ${dropdownController.grades.value}");

    print("d3 : ${dropdownController.mainLanguage.value}");

    print("d4 : ${dropdownController.subject.value}");
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
  final DropdownController dropdownController = Get.put(DropdownController());

  double marginConfirm = 0;
  double marginContainer = 0;
  final _formKey = GlobalKey<FormState>();
  List<Widget> listWidget = [];
  int indexLanguage = 1;
  int limitLanguage = 0;
  int maxLanguage = 2;
  int widgetDropDown = 0;
  bool showTextAddWidget = true;
  TextEditingController textEditingControllerMainLanguage =
      TextEditingController();
  TextEditingController textEditingControllerGrades = TextEditingController();
  TextEditingController textEditingControllerSubject = TextEditingController();
  TextEditingController textEditingControllerTopics = TextEditingController();
  List<int> listData = [];
  Color? buttonColor;

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
                      height: 600.h,
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
                          controller: _scrollController,
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
                                  SizedBox(height: 40.h),

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
                                    initialValueDropDown:
                                        "Select an ability level",
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
                                                  "Thick the box if this video can be watched and understood withoud sound",
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
                                                  margin: EdgeInsets.only(
                                                      left: 10.h),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          isCheckedBox == true
                                                              ? Colors.purple
                                                              : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0.r),
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: size
                                                              .sizeBorderBlackGlobal)),
                                                  width: 25.w,
                                                  height: 23.h,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 69.h),
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
                            top: 595.h, left: 20.h, right: 20.h),
                        child: Center(
                            child: ButtonLongForm(
                          nameButton: "Next",
                          routeName: PageProfileMenuSelectLanguage.routeName
                              .toString(),
                          formKey: _formKey,
                          heightLongHeader: 40.h,
                          onClickButton: () {
                            print("clicked");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        PageProfileAddVideoDescription()));
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

class CardItemPageProfileAddVideoCategory extends StatelessWidget {
  Color? colorCardItem;
  String? valueCard;
  String? descriptionCard;
  Color? colorFont;

  CardItemPageProfileAddVideoCategory({
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
