import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/button/widget_different_login.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_select_language.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_sign_in.dart';
import 'package:teacher_mobile_app/view/page/account_page/page_sign_up.dart';


class PageSelectLogin extends StatefulWidget {
  static String? routeName = "/PageSelectLogin";

  @override
  State<PageSelectLogin> createState() => _PageSelectLoginState();
}

class _PageSelectLoginState extends State<PageSelectLogin> {
  List<String> _dropdownItems = ['English', 'Arabic'];
  String _selectedItem = 'Option 1'; // Initial selected value
  TextEditingController textEditingControllerChooseLanguage =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    textEditingControllerChooseLanguage.text = "English";
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
              padding: EdgeInsets.symmetric(
                  horizontal: size.sizePaddingLeftAndRightPage.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonBackArrow(
                    onPressed: () {
                      // Panggil fungsi atau lakukan sesuatu saat tombol diklik
                      Navigator.of(context).pop();
                      // Atau tambahkan perintah lain yang ingin Anda eksekusi
                    },
                  ),
                  ImageRounded(
                    "assets/img/img_intersection_2.png",
                    30,
                    width: double.infinity,
                    heigth: 200,
                    borderradius: BorderRadius.circular(20),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ButtonLong(
                      nameButton: "login",
                      routeName: PageSignIn.routeName.toString()),
                  SizedBox(
                    height: 15.h,
                  ),
                  ButtonLong(
                      nameButton: "create_account",
                      routeName: PageSignUp.routeName.toString()),
                  SizedBox(
                    height: 20.h,
                  ),
                  ComponentTextDescription(
                    tr("text_or_login"),
                    textAlign: TextAlign.center,
                    fontSize: size.sizeTextHeaderGlobal,
                  ),
                  WidgetDifferentLogin(),
                  SizedBox(
                    height: 70.h,
                  ),
                  BottomPageIndicator(),
                  SizedBox(
                    height: 20.h,
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
          width: 40.w,
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
          width: 15.w,
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
