import 'package:back_button_interceptor/back_button_interceptor.dart';
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
import 'package:teacher_mobile_app/view/component/appbar/app_bar.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/button_small.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_sign_in.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_about.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_description.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_education.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_experience.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_phone_number.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_change_username.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_select_language.dart';
import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

import 'profile_menu/page_profile_menu_add_videos.dart';

class PageNavProfile extends StatefulWidget {
  static const String? routeName = "/PageNavProfile";

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
        nameMenu: tr("username"),
        routeNameDirect: PageProfileMenuChangeUsername.routeName.toString(),
        assetsPath: "assets/icon/profile/ic_profile.svg",
        page: PageProfileMenuChangeUsername()),
    ModelProfileMenu(
      nameMenu: tr("about"),
      routeNameDirect: PageProfileMenuAbout.routeName.toString(),
      assetsPath: "assets/icon/profile/ic_profile.svg",
      page: PageProfileMenuAbout(),
    ),
    ModelProfileMenu(
      nameMenu: tr("phone"),
      routeNameDirect: PageProfileMenuAddPhoneNumber.routeName.toString(),
      assetsPath: "assets/icon/profile/ic_profile.svg",
      page: PageProfileMenuAddPhoneNumber(),
    ),
    ModelProfileMenu(
      nameMenu: tr("language"),
      routeNameDirect: PageProfileMenuSelectLanguage.routeName.toString(),
      assetsPath: "assets/icon/profile/ic_language.svg",
      page: PageProfileMenuSelectLanguage(),
    ),
    ModelProfileMenu(
      nameMenu: tr("experience"),
      routeNameDirect: PageProfileMenuAddExperience.routeName.toString(),
      assetsPath: "assets/icon/profile/ic_notification.svg",
      page: PageProfileMenuAddExperience(),
    ),
    ModelProfileMenu(
      nameMenu: tr("education"),
      routeNameDirect: PageProfileMenuAddEducation.routeName.toString(),
      assetsPath: "assets/icon/profile/ic_wallet.svg",
      page: PageProfileMenuAddEducation(),
    ),
    ModelProfileMenu(
        nameMenu: tr("descriptions"),
        routeNameDirect: PageProfileMenuAddDescription.routeName.toString(),
        assetsPath: "assets/icon/profile/ic_security.svg",
        page: PageProfileMenuAddDescription()),
    ModelProfileMenu(
        nameMenu: tr("videos"),
        routeNameDirect: PageProfileMenuAddVideos.routeName.toString(),
        assetsPath: "assets/icon/profile/ic_security.svg",
        page: PageProfileMenuAddVideos()),
  ];
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.of(context).pop();
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    lang = UtilLocalization.checkLocalization(context).toString();

    return Scaffold(
      appBar: AppBarGlobal(),
      extendBodyBehindAppBar: true,
      body: WillPopScope(
        onWillPop: () async {
          // Perform any cleanup or custom actions here
          // and then pop the current route
          Navigator.of(context).pop(true);
          return true; // Return true to allow the pop
        },
        child: Container(
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
            child: ListView(
              children: [
                SizedBox(height: 30),

                Column(
                  children: [
                    Container(
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
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    listPrrofileMenu[index]
                                                        .page!));
                                        // Get.toNamed(listPrrofileMenu[index]
                                        //     .routeNameDirect);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.h, bottom: 10.h),
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
