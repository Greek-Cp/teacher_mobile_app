import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

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
    'Keyword 1',
    'Keyword 2',
    'Keyword 3',
    'Keyword 4',
    'Keyword 5',
    'Keyword 6',
    'Keyword 7',
    'Keyword 8',
    'Keyword 9',
    'Keyword 10',
  ];
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
                expandedHeight: 350.h,
                toolbarHeight: kToolbarHeight + 30.h,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: _isShrink
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 11.0, sigmaY: 11.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0, right: 12),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Flipkart",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "flipkart.com",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    color: Colors.red,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : null,
                  background: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
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
                              left: size.sizePaddingLeftAndRightPage.w),
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
                                width: 100.w,
                                height: 150.h,
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
                              left: size.sizePaddingLeftAndRightPage.w),
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
                                width: 100.w,
                                height: 150.h,
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
                      Container(
                        margin: EdgeInsets.only(
                            left: size.sizePaddingLeftAndRightPage.w),
                        child: ComponentTextDescription(
                          "My Videos (-)",
                          fontSize: size.sizeTextHeaderGlobal.sp,
                          teksColor: ListColor.colorFontPageNav,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: keywords.map((keyword) {
                            return Chip(
                              label: Text(
                                keyword,
                                style: TextStyle(color: Colors.white),
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItemPageVideos extends StatelessWidget {
  Color? colorCardItem;
  String? valueCard;
  String? descriptionCard;
  CardItemPageVideos(
      {super.key,
      required this.colorCardItem,
      required this.valueCard,
      required this.descriptionCard});

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
          height: 70.h,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ComponentTextDescription(
                "${valueCard}",
                fontWeight: FontWeight.bold,
                fontSize: size.sizeTextHeaderGlobal - 2.sp,
                teksColor: ListColor.colorFontPageNav,
              ),
              ComponentTextDescription(
                "$descriptionCard",
                fontWeight: FontWeight.bold,
                fontSize: size.sizeTextDescriptionGlobal - 5.sp,
                teksColor: ListColor.colorFontPageNav,
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
