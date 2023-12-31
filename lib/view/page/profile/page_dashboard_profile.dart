import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/controller/account_user_controller.dart';
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
import 'package:teacher_mobile_app/view/page/profile/item_nav/page_nav_profile.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/page_nav_profile_select_picture.dart';

class ModelProfileMenu {
  String nameMenu;
  String routeNameDirect;
  String assetsPath;
  Widget? page;
  ModelProfileMenu(
      {required this.nameMenu,
      required this.routeNameDirect,
      required this.assetsPath,
      this.page});
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
  //AccountUserController accountController = Get.find<AccountUserController>();

  List<ModelProfileMenu> listPrrofileMenu = [
    ModelProfileMenu(
        nameMenu: tr("profile"),
        routeNameDirect: PageNavProfile.routeName.toString(),
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
        assetsPath: "assets/icon/ic_pencil.svg"),
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
          padding: EdgeInsets.symmetric(
              horizontal: size.sizePaddingLeftAndRightPage),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //profile
                SizedBox(height: 50.h),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.marginTopPageGlobal.h),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: size.sizePaddingLeftAndRightPage.h),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              ComponentTextTittle("FirstName"),
                              ComponentTextTittle("email@gmail.com"),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    PageNavProfile()));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
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
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 110.w,
                        height: 100.h,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                              child: Stack(children: [
                                Container(
                                  width: 90.w,
                                  height: 90.h,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 216, 216, 216),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: size.sizeBorderBlackGlobal,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ClipOval(
                                      // Replace this with your image source

                                      child: SvgPicture.asset(
                                        "assets/icon/profile/ic_avatar_profile.svg",
                                        width: 50, // adjust the size as needed
                                        height: 90,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 60.w, top: 45.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  PageNavProfileSelectPicture()));
                                    },
                                    child: Card(
                                      color: ListColor.primaryClor,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.black,
                                              width:
                                                  size.sizeBorderBlackGlobal),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          "assets/icon/ic_pencil.svg",
                                          width: 15.w,
                                          height: 15.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            )),
                      ),
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
                      margin: EdgeInsets.only(top: 25.h),
                      decoration: BoxDecoration(
                        color: ListColor
                            .colorBackgroundFinance, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                                    ComponentTextDescription("0 EUR",
                                        fontSize: size.sizeTextHeaderGlobal),
                                    ComponentTextDescription(
                                      "Balance",
                                      fontSize: size.sizeTextDescriptionGlobal,
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
                      margin: EdgeInsets.only(top: 25.h),
                      decoration: BoxDecoration(
                        color: ListColor
                            .colorBackgroundQuickHelp, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                                mainAxisSize: MainAxisSize
                                    .max, // Ensures minimum required space
                                children: [
                                  CardItemBoxNoFormat(
                                      colorCardItem:
                                          ListColor.backgroundItemRatingYellow,
                                      valueCard: "-",
                                      descriptionCard: "Rating"),
                                  CardItemBoxNoFormat(
                                      colorCardItem:
                                          ListColor.backgroundItemRatingGreen,
                                      valueCard: "28",
                                      descriptionCard: "Time(min)"),
                                  CardItemBoxWithFormat(
                                      colorCardItem:
                                          ListColor.backgroundItemRatingCyan,
                                      valueCard: "0",
                                      formatData: "EUR",
                                      descriptionCard: "Earnings"),
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
                      margin: EdgeInsets.only(top: 25.h),
                      decoration: BoxDecoration(
                        color: ListColor
                            .colorBackgroundTutoring, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                                mainAxisSize: MainAxisSize
                                    .min, // Ensures minimum required space

                                children: [
                                  CardItemBoxNoFormat(
                                      colorCardItem:
                                          ListColor.backgroundItemRatingYellow,
                                      valueCard: "-",
                                      descriptionCard: "Rating"),
                                  CardItemBoxNoFormat(
                                      colorCardItem:
                                          ListColor.backgroundItemRatingGreen,
                                      valueCard: "0",
                                      descriptionCard: "Sessions"),
                                  CardItemBoxWithFormat(
                                      colorCardItem:
                                          ListColor.backgroundItemRatingCyan,
                                      valueCard: "0",
                                      formatData: "EUR",
                                      descriptionCard: "Earned this month"),
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
                      margin: EdgeInsets.only(top: 25.h),
                      decoration: BoxDecoration(
                        color: ListColor
                            .colorBackgroundVideo, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                                  CardItemBoxNoFormat(
                                      colorCardItem:
                                          ListColor.backgroundItemRatingYellow,
                                      valueCard: "0",
                                      descriptionCard: "Likes"),
                                  CardItemBoxNoFormat(
                                      colorCardItem:
                                          ListColor.backgroundItemRatingGreen,
                                      valueCard: "0",
                                      descriptionCard: "Followers)"),
                                  CardItemBoxNoFormat(
                                      colorCardItem:
                                          ListColor.backgroundItemRatingCyan,
                                      valueCard: "0",
                                      descriptionCard: "Views"),
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
                            colorButton: ListColor.colorBackgroundVideosHeader,
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
          ),
        )),
      ),
    );
  }
}

class CardItemBoxNoFormat extends StatelessWidget {
  Color? colorCardItem;
  String? valueCard;
  String? descriptionCard;
  CardItemBoxNoFormat(
      {super.key,
      required this.colorCardItem,
      required this.valueCard,
      required this.descriptionCard});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: colorCardItem,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: size.sizeBorderBlackGlobal,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(size.sizeRoundedGlobal),
        ),
        child: Container(
          height: 120.h,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ComponentTextDescription(
                "${valueCard}",
                fontWeight: FontWeight.bold,
                fontSize: size.sizeTextHeaderGlobal,
              ),
              SizedBox(height: 20),
              ComponentTextDescription(
                "$descriptionCard",
                fontWeight: FontWeight.bold,
                fontSize: size.sizeTextDescriptionGlobal - 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItemBoxWithFormat extends StatelessWidget {
  Color? colorCardItem;
  String? valueCard;
  String? descriptionCard;
  String? formatData;
  CardItemBoxWithFormat(
      {super.key,
      required this.colorCardItem,
      required this.valueCard,
      required this.descriptionCard,
      required this.formatData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: colorCardItem,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: size.sizeBorderBlackGlobal,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(size.sizeRoundedGlobal.r),
        ),
        child: Container(
          height: 120.h,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ComponentTextDescription(
                "${valueCard}",
                fontWeight: FontWeight.bold,
                fontSize: size.sizeTextHeaderGlobal,
              ),
              ComponentTextDescription(
                "$formatData",
                fontWeight: FontWeight.bold,
                fontSize: size.sizeTextDescriptionGlobal - 2,
              ),
              SizedBox(height: 10),
              ComponentTextDescription(
                "$descriptionCard",
                fontWeight: FontWeight.bold,
                fontSize: size.sizeTextDescriptionGlobal - 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
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
