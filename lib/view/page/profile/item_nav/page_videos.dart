import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
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
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight + 30.h);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
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
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 14, 152, 184), // #08F4F9
              Color.fromARGB(255, 101, 1, 155), // #B988FF
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                pinned: true,
                expandedHeight: 310.h,
                toolbarHeight: kToolbarHeight * 1.5.h,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  collapseMode: CollapseMode.parallax,
                  centerTitle: false,
                  title: _isShrink
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 11.0, sigmaY: 11.0),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 0.w, top: 10.h, bottom: 10.h),
                            child: SafeArea(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            width:
                                                size.sizeBorderBlackGlobal.w),
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ComponentTextDescription(
                                        "@FirstName",
                                        fontSize: size.sizeTextHeaderGlobal.sp,
                                        teksColor: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ComponentTextDescription(
                                        "Welcome",
                                        fontSize:
                                            size.sizeTextDescriptionGlobal.sp,
                                        teksColor: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        margin: EdgeInsets.only(right: 10.h),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                        child: Icon(
                                          Icons.search_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : null,
                  background: SafeArea(
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
                                  horizontal:
                                      size.sizePaddingLeftAndRightPage.w),
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
                                          color: Colors.black,
                                          width: size.sizeBorderBlackGlobal.w),
                                      color: Colors.white,
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
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: size.sizePaddingLeftAndRightPage.w),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: size.sizeBorderBlackGlobal),
                        color: ListColor.colorBackgroundVideosList,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: size.sizePaddingLeftAndRightPage.w,
                              top: size.sizePaddingLeftAndRightPage.h,
                              bottom: size.sizePaddingLeftAndRightPage.h),
                          child: ComponentTextDescription(
                            "My Videos (-)",
                            fontSize: size.sizeTextHeaderGlobal.sp,
                            teksColor: ListColor.colorFontPageNav,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: List.generate(20, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? Color.fromARGB(255, 175, 255, 243)
                                        : ListColor.colorPlaceHolderVideo,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                width: MediaQuery.of(context).size.width *
                                    0.3, // 30% of the screen width
                                height: MediaQuery.of(context).size.width *
                                    0.3 *
                                    194.7 /
                                    110,
                                child: Center(
                                    child: index == 0
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ComponentTextDescription(
                                                  "New Video",
                                                  teksColor: ListColor
                                                      .colorBackgroundVideosList,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      size.sizeTextDescriptionGlobal +
                                                          0.sp),
                                              Card(
                                                color: ListColor
                                                    .colorBackgroundVideosList,
                                                shape: CircleBorder(),
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(10.0.h),
                                                  child: ComponentTextDescription(
                                                      "+",
                                                      teksColor: Color.fromARGB(
                                                          255, 175, 255, 243),
                                                      fontSize:
                                                          size.sizeTextHeaderGlobal +
                                                              4.sp),
                                                ),
                                              )
                                            ],
                                          )
                                        : Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Card(
                                                color: Color.fromARGB(
                                                    255, 157, 175, 237),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.play_arrow,
                                                      color: Color.fromARGB(
                                                          255, 133, 146, 193),
                                                    ),
                                                    ComponentTextDescription(
                                                      "4564",
                                                      fontSize: size
                                                          .sizeTextDescriptionGlobal
                                                          .sp,
                                                      teksColor: Color.fromARGB(
                                                          255, 133, 146, 193),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    )
                                                  ],
                                                )),
                                          )),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: size.sizePaddingLeftAndRightPage.w, top: 30.h),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: size.sizeBorderBlackGlobal),
                        color: ListColor.colorBackgroundVideosList,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: size.sizePaddingLeftAndRightPage.w,
                              top: size.sizePaddingLeftAndRightPage.h,
                              bottom: size.sizePaddingLeftAndRightPage.h),
                          child: ComponentTextDescription(
                            "Trending",
                            fontSize: size.sizeTextHeaderGlobal.sp,
                            teksColor: ListColor.colorFontPageNav,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: List.generate(20, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? Color.fromARGB(255, 175, 255, 243)
                                        : ListColor.colorPlaceHolderVideo,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                width: MediaQuery.of(context).size.width *
                                    0.3, // 30% of the screen width
                                height: MediaQuery.of(context).size.width *
                                    0.3 *
                                    194.7 /
                                    110,
                                child: Center(
                                    child: index == 0
                                        ? GestureDetector(
                                            onTap: () {},
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ComponentTextDescription(
                                                    "New Video",
                                                    teksColor: ListColor
                                                        .colorBackgroundVideosList,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        size.sizeTextDescriptionGlobal +
                                                            0.sp),
                                                Card(
                                                  color: ListColor
                                                      .colorBackgroundVideosList,
                                                  shape: CircleBorder(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0.h),
                                                    child: ComponentTextDescription(
                                                        "+",
                                                        teksColor:
                                                            Color.fromARGB(255,
                                                                175, 255, 243),
                                                        fontSize:
                                                            size.sizeTextHeaderGlobal +
                                                                4.sp),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Card(
                                                color: Color.fromARGB(
                                                    255, 157, 175, 237),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.play_arrow,
                                                      color: Color.fromARGB(
                                                          255, 133, 146, 193),
                                                    ),
                                                    ComponentTextDescription(
                                                      "4564",
                                                      fontSize: size
                                                          .sizeTextDescriptionGlobal
                                                          .sp,
                                                      teksColor: Color.fromARGB(
                                                          255, 133, 146, 193),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    )
                                                  ],
                                                )),
                                          )),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(
                    right: size.sizePaddingLeftAndRightPage.w,
                    top: 30.h,
                    left: size.sizePaddingLeftAndRightPage.w,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: size.sizeBorderBlackGlobal),
                      color: ListColor.colorBackgroundVideosList,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: size.sizePaddingLeftAndRightPage.w),
                        child: ComponentTextDescription(
                          "Trending Search",
                          fontSize: size.sizeTextHeaderGlobal.sp,
                          teksColor: ListColor.colorFontPageNav,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          spacing: 4.0.w,
                          runSpacing: 4.0.h,
                          children: keywords.map((keyword) {
                            return Chip(
                              label: ComponentTextDescription(
                                keyword,
                                fontSize: size.sizeTextDescriptionGlobal.sp,
                              ),
                              backgroundColor:
                                  ListColor.colorBackgroundChipPurple,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardButtonLong(
                            nameButton: "Show More",
                            routeName: "",
                            colorButton: ListColor.colorPurple,
                            fontWeight: FontWeight.bold,
                            borderShape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.black,
                                    width: size.sizeBorderBlackGlobal),
                                borderRadius: BorderRadius.circular(10.r)),
                            colorFont: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(
                    right: size.sizePaddingLeftAndRightPage.w,
                    top: 30.h,
                    left: size.sizePaddingLeftAndRightPage.w,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: size.sizeBorderBlackGlobal),
                      color: ListColor.colorBackgroundVideosList,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showFollowing = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: ListColor.backgroundItemRatingGreen,
                                border: Border.all(
                                  color: Colors.black,
                                  width: size.sizeBorderBlackGlobal,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(30.0.h),
                                child: Center(
                                  child: ComponentTextDescription(
                                    "For You",
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.sizeTextDescriptionGlobal.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showFollowing = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: ListColor.backgroundItemRatingCyan,
                                border: Border.all(
                                  color: Colors.black,
                                  width: size.sizeBorderBlackGlobal,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(30.0.h),
                                child: Center(
                                  child: ComponentTextDescription(
                                    "Following",
                                    fontSize: size.sizeTextDescriptionGlobal.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              showFollowing == true
                  ? SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 20.h,
                            left: size.sizePaddingLeftAndRightPage.h,
                            right: size.sizePaddingLeftAndRightPage.h),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 25.h),
                              decoration: BoxDecoration(
                                color: ListColor
                                    .colorCardPageVideo, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                                        size.sizePaddingLeftAndRightPage.w,
                                    vertical:
                                        size.sizePaddingLeftAndRightPage.h),
                                child: Container(
                                  height: 300.h,
                                  child: RawScrollbar(
                                    thumbColor: ListColor.colorHeaderCard,
                                    thickness: 10,
                                    trackColor:
                                        ListColor.colorBackgroundScrollBar,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    trackVisibility: true,
                                    thumbVisibility: true,
                                    padding: EdgeInsets.only(left: 0.w),
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 40.h,
                                            ),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Center(
                                      child: ButtonLongHeader(
                                    nameButton: "For You",
                                    colorFont: Colors.white,
                                    colorButton: ListColor.colorHeaderCard,
                                    routeName: "",
                                    fontWeight: FontWeight.bold,
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 20.h,
                            left: size.sizePaddingLeftAndRightPage.h,
                            right: size.sizePaddingLeftAndRightPage.h),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 25.h),
                              decoration: BoxDecoration(
                                color: ListColor
                                    .colorCardPageVideo, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                                        size.sizePaddingLeftAndRightPage.w,
                                    vertical:
                                        size.sizePaddingLeftAndRightPage.h),
                                child: Container(
                                  height: 300.h,
                                  child: RawScrollbar(
                                    thumbColor: ListColor.colorHeaderCard,
                                    thickness: 10,
                                    trackColor:
                                        ListColor.colorBackgroundScrollBar,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    trackVisibility: true,
                                    thumbVisibility: true,
                                    padding: EdgeInsets.only(left: 0.w),
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 40.h,
                                            ),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            WidgetFollowing(),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Center(
                                      child: ButtonLongHeader(
                                    nameButton: "Following",
                                    colorFont: Colors.white,
                                    colorButton: ListColor.colorHeaderCard,
                                    routeName: "",
                                    fontWeight: FontWeight.bold,
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 30.h,
                ),
              )
            ],
          ),
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
