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
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_select_language.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

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
    String lang_1 = controllerAccount.obsAccountUser.value.detailUser
            ?.languageTeachSelectedByUser?.languageTeachSelect[0] ??
        "";
    String lang_2 = controllerAccount.obsAccountUser.value.detailUser
            ?.languageTeachSelectedByUser?.languageTeachSelect[1] ??
        "";
    String lang_3 = controllerAccount.obsAccountUser.value.detailUser
            ?.languageTeachSelectedByUser?.languageTeachSelect[2] ??
        "";

    print("${lang_1} ${lang_2} ${lang_3} data");
  }

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

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Color.fromARGB(255, 38, 6, 77),
          systemNavigationBarIconBrightness: Brightness.light));
    }
    return Scaffold(
      appBar: AppBarPageVideo(),
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
                      height: 505.h,
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
                                  SizedBox(height: 30.h),

                                  DropDownWidget(
                                    textEditingControllerDropDown:
                                        textEditingControllerSelectCountry,
                                    initialValueDropDown: "Select a Country",
                                    containerHeight: 50,
                                    containerListHeight: 150,
                                    labelText: "Target Country",
                                    listData: [
                                      "Select a Country",
                                      "Country 1",
                                      "Country 2",
                                      "Country 3",
                                    ],
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
                                  ),

                                  SizedBox(
                                      height: 20
                                          .h), // Add more DropDownWidget instances for other labels
                                  DropDownWidget(
                                    textEditingControllerDropDown:
                                        textEditingControllerGrades,
                                    initialValueDropDown: "Select a Grade",
                                    containerHeight: 50,
                                    labelText: "Grades",
                                    containerListHeight: 150,
                                    listData: [
                                      "Select a Grade",
                                      "Grade 1",
                                      "Grade 2",
                                      "Grade 3",
                                      // Add more grade options
                                    ],
                                  ),

                                  SizedBox(height: 20.h),
                                  DropDownWidget(
                                    textEditingControllerDropDown:
                                        textEditingControllerSubject,
                                    initialValueDropDown: "Select a Subject",
                                    containerHeight: 50,
                                    containerListHeight: 150,
                                    labelText: "Subject",
                                    listData: [
                                      "Select a Subject",
                                      "Subject 1",
                                      "Subject 2",
                                      "Subject 3",
                                      // Add more subject options
                                    ],
                                  ),

                                  SizedBox(height: 20.h),
                                  DropDownWidget(
                                    textEditingControllerDropDown:
                                        textEditingControllerTopics,
                                    initialValueDropDown:
                                        "Select an ability level",
                                    containerHeight: 50,
                                    containerListHeight: 150,
                                    labelText: "Topics",
                                    listData: [
                                      "Select an ability level",
                                      "Ability Level 1",
                                      "Ability Level 2",
                                      "Ability Level 3",
                                      // Add more ability level options
                                    ],
                                  ),

                                  SizedBox(height: 69.h),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 25.h, left: 20.w, right: 20.w),
                      margin:
                          EdgeInsets.only(top: 495.h, left: 20.h, right: 20.h),
                      child: Center(
                          child: ButtonLongForm(
                        nameButton: "Next",
                        routeName:
                            PageProfileMenuSelectLanguage.routeName.toString(),
                        formKey: _formKey,
                      )),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                                child: ButtonLongHeader(
                              nameButton: "Video Category",
                              routeName: "",
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
