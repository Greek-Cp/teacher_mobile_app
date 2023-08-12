import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
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

class PageNavProfileSelectPicture extends StatefulWidget {
  static String? routeName = "/PageNavProfileSelectPicture";

  @override
  State<PageNavProfileSelectPicture> createState() =>
      _PageNavProfileSelectPictureState();
}

class ModelPhotoRequirements {
  String? photoRequirements;
  bool? statusRequirement = false;
  ModelPhotoRequirements({this.photoRequirements, this.statusRequirement});
}

class _PageNavProfileSelectPictureState
    extends State<PageNavProfileSelectPicture> {
  TextEditingController textEditingControllerFirstName =
      TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  List<ModelPhotoRequirements> listRequirementPhotoProfile = [
    ModelPhotoRequirements(
        photoRequirements: "- Clear and Sharp", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Good lighting", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Properly Framed", statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- Appropriate Background",
        statusRequirement: false),
    ModelPhotoRequirements(
        photoRequirements: "- High Resolution", statusRequirement: false),
  ];

  String? lang;
  File? selectedImage;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image from the gallery
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Crop the selected image
      ImageCropper imageCropper = ImageCropper();
      CroppedFile? croppedImage = await imageCropper.cropImage(
          sourcePath: image.path,
          cropStyle: CropStyle.circle,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Color.fromARGB(255, 32, 36, 47),
                activeControlsWidgetColor: Color.fromARGB(255, 114, 87, 215),
                toolbarWidgetColor: Colors.white,
                backgroundColor: Colors.black,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
          ]);

      setState(() {
        selectedImage =
            File(croppedImage!.path); // Set the selected and cropped image
      });
    } else {
      // User canceled the selection
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    lang = UtilLocalization.checkLocalization(context).toString();

    return Scaffold(
      appBar: AppBarGlobal(),
      extendBodyBehindAppBar: true,
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
        child: Padding(
          padding: EdgeInsets.only(
              left: size.sizePaddingLeftAndRightPage,
              right: size.sizePaddingLeftAndRightPage),
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 90),
                    decoration: BoxDecoration(
                      color: ListColor
                          .backgroundContainerProfileWhite, // Jangan gunakan warna latar belakang untuk membuat outline terlihat
                      border: Border.all(
                        color: Colors.black, // Warna garis tepi (outline) hitam
                        width: 2.0, // Ketebalan garis tepi
                      ),
                      borderRadius: BorderRadius.circular(size.sizeRoundedGlobal
                          .r), // Sudut melengkung sebesar 30 unit
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            InkWell(
                              onTap: () {
                                pickImage();
                              },
                              child: CardButtonLong(
                                nameButton: "select_your_profile_picture",
                                routeName: "profile_picture",
                                fontWeight: FontWeight.bold,
                                colorButton: ListColor.cyanColor,
                                colorFont: Colors.black,
                                borderShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(
                                    width: size.sizeBorderBlackGlobal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            ComponentTextDescription(
                              "Photo Requirements: ",
                              fontSize: size.sizeTextDescriptionGlobal + 5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            for (int i = 0;
                                i < listRequirementPhotoProfile.length;
                                i++)
                              ComponentTextDescription(
                                listRequirementPhotoProfile[i]
                                    .photoRequirements,
                                fontSize: size.sizeTextDescriptionGlobal.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Card(
                      margin: EdgeInsets.only(top: 30.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360.r),
                          side: BorderSide(
                              width: size.sizeBorderBlackGlobal,
                              color: Colors.black)),
                      child: Container(
                        width: 120.h,
                        height: 120.h,
                        child: selectedImage == null
                            ? Container()
                            : CircleAvatar(
                                backgroundImage: FileImage(selectedImage!),
                              ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 335.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: CardButtonLong(
                      nameButton: "set_picture",
                      routeName: "profile_picture",
                      fontWeight: FontWeight.bold,
                      colorButton: ListColor.backgroundItemRatingGreen,
                      colorFont: Colors.black,
                      borderShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        side: BorderSide(
                          width: size.sizeBorderBlackGlobal,
                          color: Colors.black,
                        ),
                      ),
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
