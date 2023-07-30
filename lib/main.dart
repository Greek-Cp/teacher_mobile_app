import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/page/page_login.dart';
import 'package:teacher_mobile_app/view/page/page_login_user.dart';
import 'package:teacher_mobile_app/view/page/page_select_login.dart';
import 'package:teacher_mobile_app/view/page/page_sign_up.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    saveLocale: true,
    useFallbackTranslations: true,
    fallbackLocale: Locale('en','US'),
      child: MainApp(),
      supportedLocales: [Locale("en", "US"),Locale("ar", "AR")],
      path: "assets/lang"),
      );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: PageSelectLogin.routeName,
      defaultTransition: Transition.rightToLeft,
      getPages: [
        GetPage(
            name: PageSelectLogin.routeName.toString(),
            page: () => PageSelectLogin()),
        GetPage(name: PageLogin.routeName.toString(), page: () => PageLogin()),
        GetPage(
            name: PageLoginArea.routeName.toString(),
            page: () => PageLoginArea()),
        GetPage(name: PageSignUp.routeName.toString(), page: () => PageSignUp())
      ],
    );
  }
}
