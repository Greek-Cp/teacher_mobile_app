import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/font/font_type.dart';
import 'package:teacher_mobile_app/view/component/appbar/app_bar.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

import 'page_nav_profile_select_picture.dart';

class PageVideos extends StatefulWidget {
  static String? routeName = "/PageNavVideos";
  @override
  State<PageVideos> createState() => _PageVideosState();
}

class _PageVideosState extends State<PageVideos> {
  ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_handleScroll);
    _scrollController?.dispose();
    super.dispose();
  }

  final List<String> keywords = [
    'Kinematics',
    'Newton\'s Laws',
    'Thermodynamics',
    'Quantum Mechanics',
    'Relativity',
    'Electricity and Magnetism',
    'Particle Physics',
    'Astrophysics',
    'Optics',
    'Nuclear Physics',
  ];

  bool showFollowing = true;
  bool _showAppBar = true;
  bool _showWidget = false;

  void _handleScroll() {
    setState(() {
      _showWidget = _scrollController.offset >= 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarMainVideo(_showWidget, _opacity),
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
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 50.h,
                              left: size.sizePaddingLeftAndRightPage.w,
                              right: size.sizePaddingLeftAndRightPage.w),
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          width: double.infinity.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: size.sizeBorderBlackGlobal),
                              color: ListColor.colorContainerBase,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.location_pin,
                                        color:
                                            Color.fromARGB(255, 255, 126, 195),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Cassablanca\nMorroco",
                                          style: FontType.font_utama(
                                            fontSize:
                                                size.sizeTextDescriptionGlobal -
                                                    2.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 255, 126, 195),
                                            height: 0.7
                                                .h, // Adjust this value as needed
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "English\nFrench\nGerman",
                                            style: FontType.font_utama(
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 126, 195),
                                              height: 0.7
                                                  .h, // Adjust this value as needed
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ]),
                                    SizedBox(width: 3.w),
                                    SvgPicture.asset(
                                      "assets/icon/profile/ic_world_wide.svg",
                                      width: 20.w,
                                      height: 20.h,
                                      color: Color.fromARGB(255, 255, 126, 195),
                                    ),
                                  ]),
                              SizedBox(
                                height: 20.h,
                              ),
                              _showWidget == false
                                  ? ComponentTextDescription(
                                      "@Username",
                                      fontSize:
                                          size.sizeTextDescriptionGlobal - 1.sp,
                                      teksColor:
                                          Color.fromARGB(255, 227, 203, 254),
                                      fontWeight: FontWeight.bold,
                                    )
                                  : Container(),
                              SizedBox(
                                height: 0.h,
                              ),
                              ComponentTextDescription(
                                "Firstname Lastname",
                                fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                                teksColor: Color.fromARGB(255, 227, 203, 254),
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Chip(
                                      side: BorderSide(
                                          color: Colors.black,
                                          width: size.sizeBorderBlackGlobal.w),
                                      label: ComponentTextDescription(
                                        "Mathematics",
                                        teksColor: Colors.black,
                                        fontSize:
                                            size.sizeTextDescriptionGlobal -
                                                5.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 165, 165),
                                    ),
                                    SizedBox(width: 3.w),
                                    Chip(
                                      side: BorderSide(
                                          color: Colors.black,
                                          width: size.sizeBorderBlackGlobal.w),
                                      label: ComponentTextDescription(
                                        "Physics",
                                        teksColor: Colors.black,
                                        fontSize:
                                            size.sizeTextDescriptionGlobal -
                                                5.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 139, 190, 252),
                                    ),
                                    SizedBox(width: 3.w),
                                    Chip(
                                      side: BorderSide(
                                          color: Colors.black,
                                          width: size.sizeBorderBlackGlobal.w),
                                      label: ComponentTextDescription(
                                        "Biology",
                                        teksColor: Colors.black,
                                        fontSize:
                                            size.sizeTextDescriptionGlobal -
                                                5.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 175, 255, 209),
                                    )
                                  ]),
                              SizedBox(height: 5.h),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Chip(
                                      side: BorderSide(
                                          color: Colors.black,
                                          width: size.sizeBorderBlackGlobal.w),
                                      label: ComponentTextDescription(
                                        "years 5 to 6",
                                        teksColor: Colors.white,
                                        fontSize:
                                            size.sizeTextDescriptionGlobal -
                                                5.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 162, 97, 219),
                                    ),
                                    SizedBox(width: 3.w),
                                    Chip(
                                      side: BorderSide(
                                          color: Colors.black,
                                          width: size.sizeBorderBlackGlobal.w),
                                      label: ComponentTextDescription(
                                        "year 8 ",
                                        teksColor: Colors.white,
                                        fontSize:
                                            size.sizeTextDescriptionGlobal -
                                                5.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 162, 97, 219),
                                    ),
                                    SizedBox(width: 3.w),
                                    Chip(
                                      side: BorderSide(
                                          color: Colors.black,
                                          width: size.sizeBorderBlackGlobal.w),
                                      label: ComponentTextDescription(
                                        "yaer 9 ",
                                        teksColor: Colors.white,
                                        fontSize:
                                            size.sizeTextDescriptionGlobal -
                                                5.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 162, 97, 219),
                                    )
                                  ]),
                              SizedBox(
                                height: 10.h,
                              ),
                              ComponentTextDescription(
                                "Math teacher by day, tutor by night, contact me if you need any help!",
                                fontSize: size.sizeTextDescriptionGlobal - 2.sp,
                                teksColor: Color.fromARGB(255, 227, 203, 254),
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                mainAxisSize: MainAxisSize
                                    .max, // Ensures minimum required space
                                children: [
                                  CardItemPageVideos(
                                      colorCardItem:
                                          ListColor.colorBackgoundItemCard,
                                      valueCard: "-",
                                      descriptionCard: "Views"),
                                  CardItemPageVideos(
                                      colorCardItem:
                                          ListColor.colorBackgoundItemCard,
                                      valueCard: "-",
                                      descriptionCard: "Reaction)"),
                                  CardItemPageVideos(
                                      colorCardItem:
                                          ListColor.colorBackgoundItemCard,
                                      valueCard: "-",
                                      descriptionCard: "Quick Help"),
                                  CardItemPageVideos(
                                      colorCardItem:
                                          ListColor.colorBackgoundItemCard,
                                      valueCard: "-",
                                      descriptionCard:
                                          "Tutoring SessionsTutoring Sessions"),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              )
                            ],
                          ),
                        ),
                        _showWidget == false
                            ? Align(
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Color.fromARGB(255, 0, 255, 78),
                                            width:
                                                size.sizeBorderBlackGlobal.w),
                                        color: Color.fromARGB(255, 29, 94, 134),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                child: Stack(
                  children: [
                    RawScrollbar(
                      thumbColor: ListColor.colorHeaderCard,
                      thickness: 10,
                      trackColor: ListColor.colorBackgroundScrollBar,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)),
                      trackVisibility: true,
                      thumbVisibility: true,
                      padding: EdgeInsets.only(left: 40.w, bottom: 10.h),
                      trackRadius: Radius.circular(30.r),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: size.sizePaddingLeftAndRightPage.w),
                          padding: EdgeInsets.only(bottom: 20.sp),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: size.sizeBorderBlackGlobal),
                              color: ListColor.colorBackgroundVideosList,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(5, (index) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                ListColor.colorPlaceHolderVideo,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3, // 30% of the screen width
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.4,
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
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .play_arrow_outlined,
                                                        color: Color.fromARGB(
                                                            255, 133, 146, 193),
                                                      ),
                                                      ComponentTextDescription(
                                                        "4564",
                                                        fontSize: size
                                                            .sizeTextDescriptionGlobal,
                                                        teksColor:
                                                            Color.fromARGB(255,
                                                                133, 146, 193),
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
                                                      left: 5.w, bottom: 5.h),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 20, 20, 20),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child:
                                                      ComponentTextDescription(
                                                    "👍",
                                                    fontSize: size
                                                        .sizeTextDescriptionGlobal
                                                        .sp,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      margin: EdgeInsets.only(
                          left: size.sizePaddingLeftAndRightPage + 20.w,
                          top: size.sizePaddingLeftAndRightPage.h,
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
                              "Trending",
                              fontSize: size.sizeTextDescriptionGlobal.sp,
                              teksColor: ListColor.colorFontPageNav,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              Icons.show_chart,
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
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                child: Stack(
                  children: [
                    RawScrollbar(
                      thumbColor: ListColor.colorHeaderCard,
                      thickness: 10,
                      trackColor: ListColor.colorBackgroundScrollBar,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)),
                      trackVisibility: true,
                      thumbVisibility: true,
                      padding: EdgeInsets.only(left: 40.w, bottom: 10.h),
                      trackRadius: Radius.circular(30.r),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: size.sizePaddingLeftAndRightPage.w),
                          padding: EdgeInsets.only(bottom: 20.sp),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: size.sizeBorderBlackGlobal),
                              color: Color.fromARGB(255, 11, 18, 70),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(5, (index) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                ListColor.colorPlaceHolderVideo,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3, // 30% of the screen width
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.4,
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
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .play_arrow_outlined,
                                                        color: Color.fromARGB(
                                                            255, 133, 146, 193),
                                                      ),
                                                      ComponentTextDescription(
                                                        "4564",
                                                        fontSize: size
                                                            .sizeTextDescriptionGlobal,
                                                        teksColor:
                                                            Color.fromARGB(255,
                                                                133, 146, 193),
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
                                                      left: 5.w, bottom: 5.h),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 20, 20, 20),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child:
                                                      ComponentTextDescription(
                                                    "👍",
                                                    fontSize: size
                                                        .sizeTextDescriptionGlobal
                                                        .sp,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      margin: EdgeInsets.only(
                          left: size.sizePaddingLeftAndRightPage + 20.w,
                          top: size.sizePaddingLeftAndRightPage.h,
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
                              "New Videos",
                              fontSize: size.sizeTextDescriptionGlobal.sp,
                              teksColor: ListColor.colorFontPageNav,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              Icons.show_chart,
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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.sizePaddingLeftAndRightPage - 2.h,
                    right: size.sizePaddingLeftAndRightPage - 2.h),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: size.sizeBorderBlackGlobal),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  color: ListColor.colorContainerBase,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: toggleTabs,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: size.sizeBorderBlackGlobal,
                                ),
                                color: myCourseSelected
                                    ? Color.fromARGB(255, 57, 29, 92)
                                    : Color.fromARGB(255, 151, 131, 190),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 5.w),
                                  ComponentTextDescription(
                                    "My Video",
                                    fontSize:
                                        size.sizeTextDescriptionGlobal - 3.sp,
                                    fontWeight: FontWeight.bold,
                                    teksColor: myCourseSelected
                                        ? Color.fromARGB(255, 118, 87, 159)
                                        : Colors.white,
                                  ),
                                  SizedBox(width: 20.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 0.h,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: myCourseSelected == false
                                          ? Color.fromARGB(255, 201, 180, 206)
                                          : Color.fromARGB(255, 141, 99, 150),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: ComponentTextDescription(
                                      "338",
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          size.sizeTextDescriptionGlobal - 3.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: toggleTabs,
                            child: Container(
                              decoration: BoxDecoration(
                                color: myCourseSelected
                                    ? Color.fromARGB(255, 151, 131, 190)
                                    : Color.fromARGB(255, 57, 29, 92),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 0.h,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: myCourseSelected == true
                                          ? Color.fromARGB(255, 201, 180, 206)
                                          : Color.fromARGB(255, 141, 99, 150),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: ComponentTextDescription(
                                      "8",
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          size.sizeTextDescriptionGlobal - 3.sp,
                                    ),
                                  ),
                                  ComponentTextDescription(
                                    "My Course",
                                    fontSize:
                                        size.sizeTextDescriptionGlobal - 3.sp,
                                    fontWeight: FontWeight.bold,
                                    teksColor: myCourseSelected
                                        ? Colors.white
                                        : Color.fromARGB(255, 118, 87, 159),
                                  ),
                                  SizedBox(width: 5.w),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            myCourseSelected
                ? SliverToBoxAdapter(
                    child: Container(
                      height: 400.h,
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3.4 / 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return index == 0
                              ? Container(
                                  color: Color.fromARGB(255, 17, 0, 49),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ComponentTextDescription("New Course",
                                          teksColor: Color.fromARGB(
                                              255, 255, 123, 159),
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              size.sizeTextDescriptionGlobal +
                                                  0.sp),
                                      Card(
                                        color:
                                            Color.fromARGB(255, 141, 99, 150),
                                        shape: CircleBorder(),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0.h),
                                          child: ComponentTextDescription("+",
                                              teksColor: Color.fromARGB(
                                                  255, 255, 123, 159),
                                              fontSize:
                                                  size.sizeTextHeaderGlobal +
                                                      4.sp),
                                        ),
                                      )
                                    ],
                                  ))
                              : Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(
                                              255, 17, 0, 49), // #08F4F9
                                          Color.fromARGB(
                                              255, 17, 0, 49), // #B988FF
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.r))),
                                  width: MediaQuery.of(context).size.width *
                                      0.3, // 30% of the screen width
                                  height:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Padding(
                                    padding: EdgeInsets.all(0.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    255, 88, 83, 83), // #08F4F9
                                                Color.fromARGB(
                                                    255, 11, 11, 11), // #B988FF
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                          height: double.infinity,
                                          width: 70.w,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ComponentTextDescription(
                                                  "Course Name over 4 lines with overflow …..",
                                                  teksColor: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      size.sizeTextDescriptionGlobal -
                                                          2.sp),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      WidgetCardCourseItem(),
                                                      WidgetCardCourseItem(),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      WidgetCardCourseItem(),
                                                      WidgetCardCourseItem(),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        },
                        itemCount: 20, // Number of items in the GridView
                      ),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Container(
                      height: 400.h,
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2 / 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return index == 0
                              ? Container(
                                  color: Color.fromARGB(255, 237, 175, 255),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ComponentTextDescription("New Video",
                                          teksColor:
                                              Color.fromARGB(255, 26, 80, 167),
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              size.sizeTextDescriptionGlobal +
                                                  0.sp),
                                      Card(
                                        color: Color.fromARGB(255, 26, 80, 167),
                                        shape: CircleBorder(),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0.h),
                                          child: ComponentTextDescription("+",
                                              teksColor: Color.fromARGB(
                                                  255, 175, 255, 243),
                                              fontSize:
                                                  size.sizeTextHeaderGlobal +
                                                      4.sp),
                                        ),
                                      )
                                    ],
                                  ))
                              : Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(
                                              255, 47, 61, 111), // #08F4F9
                                          Color.fromARGB(
                                              255, 11, 14, 26), // #B988FF
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.r))),
                                  width: MediaQuery.of(context).size.width *
                                      0.3, // 30% of the screen width
                                  height:
                                      MediaQuery.of(context).size.width * 0.8,
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
                                                    255, 0, 1, 16),
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
                                      ],
                                    ),
                                  )),
                                );
                        },
                        itemCount: 10, // Number of items in the GridView
                      ),
                    ),
                  )
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

            return Container(
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

class CardItemPageVideos extends StatelessWidget {
  Color? colorCardItem;
  String? valueCard;
  String? descriptionCard;
  Color? colorFont;

  CardItemPageVideos({
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
