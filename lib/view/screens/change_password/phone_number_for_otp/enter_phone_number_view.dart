import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/change_password/phone_number_for_otp/enter_phone_number_controller.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:hirfi_home/view/widget/text_field.dart';

class EnterPhoneNumberView extends GetView<EnterPhoneNumberController> {
  const EnterPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {
          Get.back();
        },
        icon: Icons.arrow_back,
        title: TranslationData.changePassword.tr,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, right: 24, left: 24),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1,
            shrinkWrap: false,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(ImagesAssets.lightModeLogo),
                  ),
                  SizedBox(height: 8),
                  Headline4(
                    title: TranslationData.forgotPassword.tr,
                    fontSize: Get.locale!.languageCode == "ar" ? 22 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 8),
                  BodyText2(
                    title: TranslationData
                        .enterYourPhoneNumberWeWillSendYouAVerificationCode.tr,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  ),
                  SizedBox(height: 32),
                  MainTextField(
                    controller: controller.phoneNumberController,
                    hint: TranslationData.phoneNumber.tr,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: (value) => AppTools().phoneNumberValidate2(
                      controller.phoneNumberController,
                    ),
                    title: "",
                    prefixIcon:
                        Icon(Icons.phone_outlined, color: AppColors.hintText),
                  ),
                  SizedBox(height: 32),
                  PrimaryButton(onTap: () {}, title: TranslationData.send.tr)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
