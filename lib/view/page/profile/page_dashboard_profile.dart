import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/button_small.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_sign_in.dart';

class ModelProfileMenu {
  String nameMenu;
  String routeNameDirect;
  String assetsPath;
  ModelProfileMenu(
      {required this.nameMenu,
      required this.routeNameDirect,
      required this.assetsPath});
}

class PageDashboardProfile extends StatefulWidget {
  static String? routeName = "/PageDashboardProfile";

  @override
  State<PageDashboardProfile> createState() => _PageDashboardProfileState();
}

class _PageDashboardProfileState extends State<PageDashboardProfile> {
  TextEditingController textEditingControllerFirstName =
      TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();

  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  String? lang;
  List<ModelProfileMenu> listPrrofileMenu = [
    ModelProfileMenu(
        nameMenu: tr("profile"),
        routeNameDirect: "profile",
        assetsPath: "assets/icon/profile/ic_profile.svg"),
    ModelProfileMenu(
        nameMenu: tr("language"),
        routeNameDirect: "language",
        assetsPath: "assets/icon/profile/ic_language.svg"),
    ModelProfileMenu(
        nameMenu: tr("notification"),
        routeNameDirect: "notification",
        assetsPath: "assets/icon/profile/ic_notification.svg"),
    ModelProfileMenu(
        nameMenu: tr("security"),
        routeNameDirect: "security",
        assetsPath: "assets/icon/profile/ic_security.svg"),
    ModelProfileMenu(
        nameMenu: tr("intive_student"),
        routeNameDirect: "intive_student",
        assetsPath: "assets/icon/profile/ic_invite_student.svg"),
    ModelProfileMenu(
        nameMenu: tr("help_center"),
        routeNameDirect: "help_center",
        assetsPath: "assets/icon/profile/ic_help_center.svg"),
    ModelProfileMenu(
        nameMenu: tr("terms_conditions"),
        routeNameDirect: "terms_conditions",
        assetsPath: "assets/icon/profile/ic_termscondition.svg"),
    ModelProfileMenu(
        nameMenu: tr("logout"),
        routeNameDirect: "logout",
        assetsPath: "assets/icon/profile/ic_logout.svg"),
  ];

  List<ModelProfileMenu> listProfileFinance = [
    ModelProfileMenu(
        nameMenu: tr("transaction"),
        routeNameDirect: "profile",
        assetsPath: "assets/icon/profile/ic_profile.svg"),
    ModelProfileMenu(
        nameMenu: tr("payment_options"),
        routeNameDirect: "PaymentOptions",
        assetsPath: "assets/icon/profile/ic_wallet.svg"),
    ModelProfileMenu(
        nameMenu: tr("previous_payments"),
        routeNameDirect: "PreviousPayment",
        assetsPath: "assets/icon/profile/ic_wallet.svg"),
  ];

  List<ModelProfileMenu> listQuickHelp = [
    ModelProfileMenu(
        nameMenu: tr("settings"),
        routeNameDirect: "settings",
        assetsPath: "assets/icon/profile/ic_profile.svg"),
    ModelProfileMenu(
        nameMenu: tr("previous_sessions"),
        routeNameDirect: "previous_sessions",
        assetsPath: "assets/icon/profile/ic_profile.svg"),
    ModelProfileMenu(
        nameMenu: tr("reviews"),
        routeNameDirect: "reviews",
        assetsPath: "assets/icon/profile/ic_wallet.svg"),
    ModelProfileMenu(
        nameMenu: tr("previous_payments"),
        routeNameDirect: "reviews",
        assetsPath: "assets/icon/profile/ic_wallet.svg"),
  ];

  List<ModelProfileMenu> listTutoring = [
    ModelProfileMenu(
        nameMenu: tr("previous_sessions"),
        routeNameDirect: "previous_sessions",
        assetsPath: "assets/icon/profile/ic_profile.svg"),
    ModelProfileMenu(
        nameMenu: tr("reviews"),
        routeNameDirect: "reviews",
        assetsPath: "assets/icon/profile/ic_wallet.svg"),
    ModelProfileMenu(
        nameMenu: tr("previous_payments"),
        routeNameDirect: "reviews",
        assetsPath: "assets/icon/profile/ic_wallet.svg"),
  ];

  List<ModelProfileMenu> listVideos = [
    ModelProfileMenu(
        nameMenu: tr("my_videos"),
        routeNameDirect: "my_videos",
        assetsPath: "assets/icon/profile/ic_profile.svg"),
    ModelProfileMenu(
        nameMenu: tr("upload_video"),
        routeNameDirect: "reviews",
        assetsPath: "assets/icon/profile/ic_wallet.svg"),
    ModelProfileMenu(
        nameMenu: tr("edit_profile"),
        routeNameDirect: "reviews",
        assetsPath: "assets/icon/profile/ic_pencil.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    lang = UtilLocalization.checkLocalization(context).toString();
    print("lang $lang");
    if (lang == "AR") {
      print("arab");
    } else {
      print("engl");
    }
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF08F4F9), // #08F4F9
                  Color(0xFFB988FF), // #B988FF
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.only(
                  left: size.sizePaddingLeftAndRightPage + 5,
                  right: size.sizePaddingLeftAndRightPage + 5),
              child: ListView(
                children: [
                  //profile
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                            color: ListColor
                                .backgroundContainerProfileWhite, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                            border: Border.all(
                              color: Colors
                                  .black, // Warna garis tepi (outline) hitam
                              width: 2.0, // Ketebalan garis tepi
                            ),
                            borderRadius: BorderRadius.circular(size
                                .sizeRoundedGlobal
                                .r) // Sudut melengkung sebesar 30 unit
                            ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 60.h,
                                ),
                                ComponentTextTittle("Full Name"),
                                ComponentTextTittle("username@gmail.com"),
                                ComponentTextTittle("username"),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Card(
                                  color: ListColor.backgroundColorVerified,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                      side: BorderSide(
                                          width: size.sizeBorderBlackGlobal,
                                          color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ComponentTextDescription(
                                          "Account Status: ",
                                          fontSize:
                                              size.sizeTextDescriptionGlobal,
                                          teksColor: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ComponentTextDescription(
                                          "Verified",
                                          fontSize:
                                              size.sizeTextDescriptionGlobal,
                                          teksColor: ListColor.colorVerified,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SvgPicture.asset(
                                              listPrrofileMenu[index]
                                                  .assetsPath,
                                              width: 15.w,
                                              height: 15.h,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              child: ComponentTextDescription(
                                                listPrrofileMenu[index]
                                                    .nameMenu,
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                                "assets/icon/profile/ic_arrow_rigth.svg")
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: listPrrofileMenu.length,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                )
                              ]),
                        ),
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                              child: Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: size.sizeBorderBlackGlobal,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 45 - size.sizeBorderBlackGlobal,
                                    // Replace this with your image source
                                    backgroundColor:
                                        ListColor.colorBackgroundPhotoProfile,
                                  ),
                                ),
                                Positioned(
                                  right: 1,
                                  bottom: 1,
                                  child: Card(
                                    color: ListColor.primaryClor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        "assets/icon/ic_pencil.svg",
                                        width: 15.w,
                                        height: 15.h,
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            )),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 50.h,
                  ),

                  //finance
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ListColor
                              .colorBackgroundFinance, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                Card(
                                  color: ListColor.primaryClor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                      side: BorderSide(
                                          width: size.sizeBorderBlackGlobal,
                                          color: Colors.black)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40.w, vertical: 10.h),
                                    child: Column(children: [
                                      ComponentTextDescription("650 EUR",
                                          fontSize: size.sizeTextHeaderGlobal),
                                      ComponentTextDescription(
                                        "Balance",
                                        fontSize:
                                            size.sizeTextDescriptionGlobal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ]),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SvgPicture.asset(
                                              listProfileFinance[index]
                                                  .assetsPath,
                                              width: 15.w,
                                              height: 15.h,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              child: ComponentTextDescription(
                                                listProfileFinance[index]
                                                    .nameMenu,
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                                "assets/icon/profile/ic_arrow_rigth.svg")
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: listProfileFinance.length,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                )
                              ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                                child: ButtonLongHeader(
                              nameButton: "Finance",
                              routeName: "",
                              colorButton: ListColor.backgroundColorVerified,
                              fontWeight: FontWeight.bold,
                              colorFont: Colors.white,
                            ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  //Quick HElp
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ListColor
                              .colorBackgroundQuickHelp, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
                                      color:
                                          ListColor.backgroundItemRatingYellow,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: size.sizeBorderBlackGlobal,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              size.sizeRoundedGlobal.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.h,
                                            bottom: 20.h,
                                            left: 20.w,
                                            right: 20.w),
                                        child: Column(
                                          children: [
                                            ComponentTextDescription(
                                              "4.5",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextHeaderGlobal,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ComponentTextDescription(
                                              "Rating",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color:
                                          ListColor.backgroundItemRatingGreen,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: size.sizeBorderBlackGlobal,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              size.sizeRoundedGlobal.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.h,
                                            bottom: 20.h,
                                            left: 10.w,
                                            right: 10.w),
                                        child: Column(
                                          children: [
                                            ComponentTextDescription(
                                              "28",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextHeaderGlobal,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ComponentTextDescription(
                                              "Time(min)",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color:
                                          ListColor.backgroundItemRatingGreen,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: size.sizeBorderBlackGlobal,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              size.sizeRoundedGlobal.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 12.h,
                                            bottom: 20.h,
                                            left: 20.w,
                                            right: 20.w),
                                        child: Column(
                                          children: [
                                            ComponentTextDescription(
                                              "320 \nEUR",
                                              fontWeight: FontWeight.bold,
                                              fontSize: size
                                                  .sizeTextDescriptionGlobal,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ComponentTextDescription(
                                              "Earnings",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SvgPicture.asset(
                                              listQuickHelp[index].assetsPath,
                                              width: 15.w,
                                              height: 15.h,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              child: ComponentTextDescription(
                                                listQuickHelp[index].nameMenu,
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                                "assets/icon/profile/ic_arrow_rigth.svg")
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: listQuickHelp.length,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                )
                              ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                                child: ButtonLongHeader(
                              nameButton: "Quick Help",
                              colorFont: Colors.white,
                              colorButton:
                                  ListColor.colorBackgroundQuickHelpHeader,
                              routeName: "",
                              fontWeight: FontWeight.bold,
                            ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  //Tutoring
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ListColor
                              .colorBackgroundTutoring, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
                                      color:
                                          ListColor.backgroundItemRatingYellow,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: size.sizeBorderBlackGlobal,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              size.sizeRoundedGlobal.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.h,
                                            bottom: 20.h,
                                            left: 20.w,
                                            right: 20.w),
                                        child: Column(
                                          children: [
                                            ComponentTextDescription(
                                              "4.5",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextHeaderGlobal,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ComponentTextDescription(
                                              "Rating",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color:
                                          ListColor.backgroundItemRatingGreen,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: size.sizeBorderBlackGlobal,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              size.sizeRoundedGlobal.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.h,
                                            bottom: 20.h,
                                            left: 10.w,
                                            right: 10.w),
                                        child: Column(
                                          children: [
                                            ComponentTextDescription(
                                              "18",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextHeaderGlobal,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ComponentTextDescription(
                                              "Sessions",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: ListColor.backgroundItemRatingCyan,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: size.sizeBorderBlackGlobal,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              size.sizeRoundedGlobal.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10.h,
                                            left: 20.w,
                                            right: 20.w),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: ComponentTextDescription(
                                                "340 \nEUR",
                                                fontWeight: FontWeight.bold,
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ComponentTextDescription(
                                              "Earned \nthis month",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SvgPicture.asset(
                                              listTutoring[index].assetsPath,
                                              width: 15.w,
                                              height: 15.h,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              child: ComponentTextDescription(
                                                listTutoring[index].nameMenu,
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                                "assets/icon/profile/ic_arrow_rigth.svg")
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: listTutoring.length,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                )
                              ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                                child: ButtonLongHeader(
                              nameButton: "Tutoring",
                              colorFont: Colors.white,
                              colorButton:
                                  ListColor.colorBackgroundTutoringHeader,
                              routeName: "",
                              fontWeight: FontWeight.bold,
                            ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  //Videos
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ListColor
                              .colorBackgroundVideo, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
                                      color:
                                          ListColor.backgroundItemRatingYellow,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: size.sizeBorderBlackGlobal,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              size.sizeRoundedGlobal.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.h,
                                            bottom: 20.h,
                                            left: 20.w,
                                            right: 20.w),
                                        child: Column(
                                          children: [
                                            ComponentTextDescription(
                                              "2.3 k",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextHeaderGlobal,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ComponentTextDescription(
                                              "Likes",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color:
                                          ListColor.backgroundItemRatingGreen,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: size.sizeBorderBlackGlobal,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              size.sizeRoundedGlobal.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.h,
                                            bottom: 20.h,
                                            left: 10.w,
                                            right: 10.w),
                                        child: Column(
                                          children: [
                                            ComponentTextDescription(
                                              "518",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextHeaderGlobal,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ComponentTextDescription(
                                              "Followers",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: ListColor.backgroundItemRatingCyan,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: size.sizeBorderBlackGlobal,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              size.sizeRoundedGlobal.r)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.h,
                                            bottom: 20.h,
                                            left: 20.w,
                                            right: 20.w),
                                        child: Column(
                                          children: [
                                            ComponentTextDescription(
                                              "5.2k",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextHeaderGlobal,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ComponentTextDescription(
                                              "Views",
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  size.sizeTextDescriptionGlobal -
                                                      2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SvgPicture.asset(
                                              listVideos[index].assetsPath,
                                              width: 15.w,
                                              height: 15.h,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Expanded(
                                              child: ComponentTextDescription(
                                                listVideos[index].nameMenu,
                                                fontSize: size
                                                    .sizeTextDescriptionGlobal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                                "assets/icon/profile/ic_arrow_rigth.svg")
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: listVideos.length,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                )
                              ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                                child: ButtonLongHeader(
                              nameButton: "Videos",
                              colorFont: Colors.white,
                              colorButton:
                                  ListColor.colorBackgroundVideosHeader,
                              routeName: "",
                              fontWeight: FontWeight.bold,
                            ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}

class BottomPageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 15.w,
          height: 13.h,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: size.sizeBorderBlackGlobal),
              color: ListColor.cyanColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 15.w,
          height: 13.h,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: size.sizeBorderBlackGlobal),
              color: ListColor.colorTextFieldBackground,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 40.w,
          height: 13.h,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: size.sizeBorderBlackGlobal),
              color: ListColor.colorPurple,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        )
      ],
    );
  }
}
