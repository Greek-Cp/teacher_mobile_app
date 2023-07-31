import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_mobile_app/res/colors/list_color.dart';
import 'package:teacher_mobile_app/res/dimension/size.dart';
import 'package:teacher_mobile_app/res/localization/locale.dart';
import 'package:teacher_mobile_app/view/component/button/text_description.dart';
import 'package:teacher_mobile_app/view/component/dropdown/drop_down.dart';
import 'package:teacher_mobile_app/view/page/page_select_language.dart';
import 'package:teacher_mobile_app/view/page/page_sign_in.dart';

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
                child: Padding(   padding: EdgeInsets.symmetric(
                    horizontal: size.sizePaddingLeftAndRightPage.h),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.h,bottom: 15.h
                            ),
                            child: Image.asset(
                              "assets/icon/ic_back.png",
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                        ),
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
                      ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStatePropertyAll(Size.fromHeight(55.h)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                      side: BorderSide(
                                          width: 1, color: Colors.black))),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 63, 254, 202))),
                          onPressed: () {
                            Get.toNamed(PageSignIn.routeName.toString());
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 30.h,
                                  right: 30.h,
                                  top: 10.h,
                                  bottom: 10.h),
                              child: ComponentTextDescription(tr("login"),fontSize: size.textButton,))),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStatePropertyAll(Size.fromHeight(55.h)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                      side: BorderSide(
                                          width: 1, color: Colors.black))),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 63, 254, 202))),
                          onPressed: () {},
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 30.h,
                                  right: 30.h,
                                  top: 10.h,
                                  bottom: 10.h),
                              child: ComponentTextDescription(
                                  tr("create_account"),fontSize: size.sizeTextDescriptionGlobal,))),
                      SizedBox(
                        height: 20.h,
                      ),
                      ComponentTextDescription(
                        tr("text_or_login"),
                        textAlign: TextAlign.center,
                        fontSize: size.sizeTextDescriptionGlobal,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(30.r)),
                            child: Padding(
                              padding: EdgeInsets.all(18.0.h),
                              child: Image.asset(
                                "assets/icon/facebook.png",
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(30.r)),
                            child: Padding(
                              padding: EdgeInsets.all(18.0.h),
                              child: Image.asset(
                                "assets/icon/search.png",
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(30.r)),
                            child: Padding(
                              padding: EdgeInsets.all(18.0.h),
                              child: Image.asset(
                                "assets/icon/apple.png",
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                    BottomPageIndicator()
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
class BottomPageIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 15.w,
          height: 13.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: size.sizeBorderBlackGlobal),
              color: ListColor.cyanColor,
              borderRadius: BorderRadius.all(Radius.circular(20))
          )
          ,),
        SizedBox(width: 10.w,),
        Container(width: 40.w,
          height: 13.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: size.sizeBorderBlackGlobal),
              color: ListColor.colorTextFieldBackground,
              borderRadius: BorderRadius.all(Radius.circular(20))
          )
          ,)
        ,
        SizedBox(width: 10.w,), Container(width: 15.w,
          height: 13.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: size.sizeBorderBlackGlobal),
              color: ListColor.colorPurple,
              borderRadius: BorderRadius.all(Radius.circular(20))
          )
          ,)

      ],);
  }

}