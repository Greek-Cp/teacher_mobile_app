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
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

class PageNavProfile extends StatefulWidget {
  static String? routeName = "/PageNavProfile";

  @override
  State<PageNavProfile> createState() => _PageNavProfileState();
}

class _PageNavProfileState extends State<PageNavProfile> {
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
        nameMenu: tr("about"),
        routeNameDirect: "about",
        assetsPath: "assets/icon/profile/ic_profile.svg"),
    ModelProfileMenu(
        nameMenu: tr("phone"),
        routeNameDirect: "phone",
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    lang = UtilLocalization.checkLocalization(context).toString();

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
                  left: size.sizePaddingLeftAndRightPage,
                  right: size.sizePaddingLeftAndRightPage),
              child: ListView(
                children: [
                  ButtonBackArrow(
                    onPressed: () {
                      Navigator.of(context);
                    },
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
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
                                  height: 30.h,
                                ),
                                ComponentTextTittle("profile"),
                                SizedBox(
                                  height: 30.h,
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
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  //Tutoring
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
