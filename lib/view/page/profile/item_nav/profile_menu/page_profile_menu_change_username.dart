import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/button/button_arrow_back.dart';
import 'package:teacher_mobile_app/view/component/button/button_long.dart';
import 'package:teacher_mobile_app/view/component/button/button_small.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/button/widget_different_login.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/component/text_field/text_field.dart';
import 'package:teacher_mobile_app/view/component/utils/Util.dart';

class PageProfileMenuChangeUsername extends StatefulWidget {
  static String? routeName = "/PageProfileMenuChangeUsername";

  @override
  State<PageProfileMenuChangeUsername> createState() =>
      _PageProfileMenuChangeUsernameState();
}

class _PageProfileMenuChangeUsernameState
    extends State<PageProfileMenuChangeUsername> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  String lang = UtilLocalization.checkLocalization.toString();

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
              padding: EdgeInsets.symmetric(
                horizontal: size.sizePaddingLeftAndRightPage.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonBackArrow(
                    onPressed: () {
                      Navigator.of(context);
                    },
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .transparent, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
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
                              horizontal: size.sizePaddingLeftAndRightPage.h),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                Center(
                                    child: ComponentTextTittle(tr("username"))),
                                SizedBox(
                                  height: 30.h,
                                ),
                                TextFieldFormWithValidation(
                                  textEditingControllerEmail:
                                      textEditingControllerEmail,
                                  labelText: "username",
                                  hintText: "username",
                                  requestTypeValidation: "username",
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [],
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 250.h, left: 20.r, right: 20.r),
                        child: Center(
                            child: ButtonLong(
                          nameButton: "Confirm",
                          routeName: PageProfileMenuChangeUsername.routeName
                              .toString(),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 240.h,
                  ),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
