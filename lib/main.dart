import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_forgot_password.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_reset_password.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_select_language.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_select_login.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_sign_in.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_sign_up.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_sign_up_fill_username.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/page_nav_profile.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/page_nav_profile_select_picture.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_about.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_description.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_education.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_experience.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_add_videos.dart';
import 'package:teacher_mobile_app/view/page/profile/item_nav/profile_menu/page_profile_menu_select_language.dart';
import 'package:teacher_mobile_app/view/page/profile/nav/base_nav_account.dart';

import 'package:teacher_mobile_app/view/page/profile/page_dashboard_profile.dart';

import 'view/page/profile/item_nav/profile_menu/page_profile_menu_add_phone_number.dart';
import 'view/page/profile/item_nav/profile_menu/page_profile_menu_change_username.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    // You can customize the error message and appearance here
    return Center(
      child: Text(
        "${errorDetails.exception}",
        style: TextStyle(fontSize: 18),
      ),
    );
  };

  runApp(
    EasyLocalization(
        saveLocale: true,
        useFallbackTranslations: true,
        fallbackLocale: Locale('en', 'US'),
        child: MainApp(),
        supportedLocales: [Locale("en", "US"), Locale("ar", "AR")],
        path: "assets/lang"),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Color.fromARGB(255, 114, 87, 216),
          systemNavigationBarIconBrightness: Brightness.light));
    }
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: pageNavBar.routeName.toString(),
      defaultTransition: Transition.circularReveal,
      getPages: [
        GetPage(
            name: PageSelectLanguage.routeName.toString(),
            page: () => PageSelectLanguage()),
        GetPage(
            name: PageSelectLogin.routeName.toString(),
            page: () => PageSelectLogin()),
        GetPage(
            name: PageSignIn.routeName.toString(), page: () => PageSignIn()),
        GetPage(
            name: PageSignUp.routeName.toString(), page: () => PageSignUp()),
        GetPage(
            name: PageSignUpFillUsername.routeName.toString(),
            page: () => PageSignUpFillUsername()),
        GetPage(
            name: PageForgotPassword.routeName.toString(),
            page: () => PageForgotPassword()),
        GetPage(
            name: PageResetPassword.routeName.toString(),
            page: () => PageResetPassword()),
        GetPage(
            name: PageDashboardProfile.routeName.toString(),
            page: () => PageDashboardProfile()),
        GetPage(
            name: PageNavProfileSelectPicture.routeName.toString(),
            page: () => PageNavProfileSelectPicture()),
        GetPage(
            name: PageNavProfile.routeName.toString(),
            page: () => PageNavProfile()),
        GetPage(
            name: PageProfileMenuChangeUsername.routeName.toString(),
            page: () => PageProfileMenuChangeUsername()),
        GetPage(
            name: PageProfileMenuAbout.routeName.toString(),
            page: () => PageProfileMenuAbout()),
        GetPage(
            name: PageProfileMenuSelectLanguage.routeName.toString(),
            page: () => PageProfileMenuSelectLanguage()),
        GetPage(
            name: PageProfileMenuAddEducation.routeName.toString(),
            page: () => PageProfileMenuAddEducation()),
        GetPage(
            name: PageProfileMenuAddDescription.routeName.toString(),
            page: () => PageProfileMenuAddDescription()),
        GetPage(
            name: PageProfileMenuAddVideos.routeName.toString(),
            page: () => PageProfileMenuAddVideos()),
        GetPage(
            name: PageProfileMenuAddExperience.routeName.toString(),
            page: () => PageProfileMenuAddExperience()),
        GetPage(
          name: PageProfileMenuAddPhoneNumber.routeName.toString(),
          page: () => PageProfileMenuAddPhoneNumber(),
        ),
        GetPage(name: pageNavBar.routeName.toString(), page: () => pageNavBar())
      ],
      theme: _buildTheme(Brightness.light),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.nunitoTextTheme(baseTheme.textTheme),
    );
  }
}
