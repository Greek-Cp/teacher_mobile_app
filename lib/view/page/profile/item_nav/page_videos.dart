import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
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
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [];
          },
          body: CustomScrollView(
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
                                top: 60.h,
                                left: size.sizePaddingLeftAndRightPage.w,
                                right: size.sizePaddingLeftAndRightPage.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.sizePaddingLeftAndRightPage.w),
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
                                      Icon(
                                        Icons.location_pin,
                                        color:
                                            Color.fromARGB(255, 255, 126, 195),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ComponentTextDescription(
                                            "Cassablanca",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Color.fromARGB(
                                                255, 255, 126, 195),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          ComponentTextDescription(
                                            "Morroco",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Color.fromARGB(
                                                255, 255, 126, 195),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ComponentTextDescription(
                                            "Cassablanca",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Color.fromARGB(
                                                255, 255, 126, 195),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          ComponentTextDescription(
                                            "Morroco",
                                            fontSize: size
                                                .sizeTextDescriptionGlobal.sp,
                                            teksColor: Color.fromARGB(
                                                255, 255, 126, 195),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.maps_home_work_rounded,
                                          color: Color.fromARGB(
                                              255, 255, 126, 195)),
                                    ]),
                                SizedBox(
                                  height: 40.h,
                                ),
                                ComponentTextDescription(
                                  "@FirstName",
                                  fontSize: size.sizeTextDescriptionGlobal.sp,
                                  teksColor: ListColor.colorFontPageNav,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ComponentTextDescription(
                                  "Math teacher by day, tutor by night, contact me if you need any help!",
                                  fontSize: size.sizeTextDescriptionGlobal.sp,
                                  teksColor: ListColor.colorFontPageNav,
                                  fontWeight: FontWeight.normal,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(children: [
                                  Chip(
                                    side: BorderSide(
                                        color: Colors.black,
                                        width: size.sizeBorderBlackGlobal.w),
                                    label: ComponentTextDescription(
                                      "Mathematics",
                                      teksColor: Colors.black,
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 165, 165),
                                  ),
                                  Chip(
                                    side: BorderSide(
                                        color: Colors.black,
                                        width: size.sizeBorderBlackGlobal.w),
                                    label: ComponentTextDescription(
                                      "Physics",
                                      teksColor: Colors.black,
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 139, 190, 252),
                                  ),
                                  Chip(
                                    side: BorderSide(
                                        color: Colors.black,
                                        width: size.sizeBorderBlackGlobal.w),
                                    label: ComponentTextDescription(
                                      "Biology",
                                      teksColor: Colors.black,
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 175, 255, 209),
                                  )
                                ]),
                                SizedBox(height: 10.h),
                                Row(children: [
                                  Chip(
                                    side: BorderSide(
                                        color: Colors.black,
                                        width: size.sizeBorderBlackGlobal.w),
                                    label: ComponentTextDescription(
                                      "years 5 to 6",
                                      teksColor: Colors.white,
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 162, 97, 219),
                                  ),
                                  Chip(
                                    side: BorderSide(
                                        color: Colors.black,
                                        width: size.sizeBorderBlackGlobal.w),
                                    label: ComponentTextDescription(
                                      "year 8 ",
                                      teksColor: Colors.white,
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 162, 97, 219),
                                  ),
                                  Chip(
                                    side: BorderSide(
                                        color: Colors.black,
                                        width: size.sizeBorderBlackGlobal.w),
                                    label: ComponentTextDescription(
                                      "yaer 9 ",
                                      teksColor: Colors.white,
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 162, 97, 219),
                                  )
                                ]),
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
                                        descriptionCard: "Tutoring Sessions"),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                height: 100.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 0, 255, 78),
                                        width: size.sizeBorderBlackGlobal.w),
                                    color: Color.fromARGB(255, 29, 94, 134),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 40.w,
                              height: 40.h,
                              margin: EdgeInsets.only(right: 10.h),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.5)),
                              child: Icon(
                                Icons.search_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: RawScrollbar(
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
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              margin: EdgeInsets.only(
                                  left: size.sizePaddingLeftAndRightPage.w,
                                  top: size.sizePaddingLeftAndRightPage.h,
                                  bottom:
                                      size.sizePaddingLeftAndRightPage - 5.h),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    ComponentTextDescription(
                                      "Trending",
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
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
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(20, (index) {
                                  return Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              ListColor.colorPlaceHolderVideo,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      width: MediaQuery.of(context).size.width *
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
                                                    left: 5.w, bottom: 5.h),
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 20, 20, 20),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: ComponentTextDescription(
                                                  "👍",
                                                  fontSize: size
                                                      .sizeTextDescriptionGlobal,
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
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 20.h, bottom: 40.h),
                  child: RawScrollbar(
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
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 27, 41, 114)
                                      .withOpacity(0.6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              margin: EdgeInsets.only(
                                  left: size.sizePaddingLeftAndRightPage.w,
                                  top: size.sizePaddingLeftAndRightPage.h,
                                  bottom:
                                      size.sizePaddingLeftAndRightPage - 5.h),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    ComponentTextDescription(
                                      "New Videos",
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                      teksColor: ListColor.colorFontPageNav,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    ComponentTextDescription(
                                      "🔥",
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: List.generate(20, (index) {
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ListColor.colorPlaceHolderVideo,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    width: MediaQuery.of(context).size.width *
                                        0.3, // 30% of the screen width
                                    height:
                                        MediaQuery.of(context).size.width * 0.4,
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
                                                  left: 5.w, bottom: 5.h),
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 20, 20, 20),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: ComponentTextDescription(
                                                "👍",
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
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
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: size.sizeBorderBlackGlobal),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  color: ListColor.colorContainerBase,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                    fontSize: size.sizeTextDescriptionGlobal.sp,
                                    fontWeight: FontWeight.bold,
                                    teksColor: myCourseSelected
                                        ? Color.fromARGB(255, 118, 87, 159)
                                        : Colors.white,
                                  ),
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
                                      "8",
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          size.sizeTextDescriptionGlobal.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
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
                                          size.sizeTextDescriptionGlobal.sp,
                                    ),
                                  ),
                                  ComponentTextDescription(
                                    "My Course",
                                    fontSize: size.sizeTextDescriptionGlobal.sp,
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
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 40.h,
              ))
            ],
          ),
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
                teksColor: Colors.white,
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
  CardItemPageVideos(
      {super.key,
      required this.colorCardItem,
      required this.valueCard,
      required this.descriptionCard,
      this.colorFont});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        color: colorCardItem,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: size.sizeBorderBlackGlobal,
          ),
          borderRadius: BorderRadius.circular(size.sizeRoundedGlobal),
        ),
        child: Container(
          height: 60.h,
          width: 100.w,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ComponentTextDescription(
                "${valueCard}",
                fontWeight: FontWeight.bold,
                fontSize: size.sizeTextHeaderGlobal - 2.sp,
                teksColor:
                    colorFont == null ? ListColor.colorFontPageNav : colorFont!,
              ),
              ComponentTextDescription(
                "$descriptionCard",
                fontWeight: FontWeight.bold,
                fontSize: size.sizeTextDescriptionGlobal - 5.sp,
                teksColor:
                    colorFont == null ? ListColor.colorFontPageNav : colorFont!,
                textAlign: TextAlign.center,
              ),
            ],
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
