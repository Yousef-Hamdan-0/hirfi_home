import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/auth/signup_user/signup_user_controller.dart';
import 'package:hirfi_home/view/widget/check_box.dart';
import 'package:hirfi_home/view/widget/or_line.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/primary_taxt_button/text_and_button.dart';
import 'package:hirfi_home/view/widget/social_auth_buttons.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:hirfi_home/view/widget/text_field.dart';

class SignupUserViwe extends GetView<SignupUserController> {
  const SignupUserViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.white,
      body: Form(
        key: controller.signUpForm,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(ImagesAssets.lightModeLogo)],
                    ),
                    SizedBox(height: 8),
                    Headline4(
                      title: TranslationData.createAccount.tr,
                      fontSize: Get.locale!.languageCode == "ar" ? 22 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 8),
                    BodyText2(
                      title: TranslationData.weAreHereToHelpYou.tr,
                      fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                    ),
                    SizedBox(height: 32),
                    MainTextField(
                      controller: controller.nameController,
                      hint: TranslationData.yourName.tr,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          AppTools().nameValidate(controller.nameController),
                      title: "",
                      prefixIcon:
                          Icon(Icons.person_outline, color: AppColors.hintText),
                    ),
                    SizedBox(height: 20),
                    MainTextField(
                      controller: controller.emailController,
                      hint: TranslationData.yourEmail.tr,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          AppTools().emailValidate(controller.emailController),
                      title: "",
                      prefixIcon:
                          Icon(Icons.email_outlined, color: AppColors.hintText),
                    ),
                    SizedBox(height: 20),
                    MainTextField(
                      controller: controller.phoneNumberController,
                      hint: TranslationData.phoneNumber.tr,
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: (value) => AppTools().phoneNumberValidate(
                        controller.phoneNumberController,
                      ),
                      title: "",
                      prefixIcon:
                          Icon(Icons.phone_outlined, color: AppColors.hintText),
                    ),
                    SizedBox(height: 20),
                    MainTextField(
                      controller: controller.passwordController,
                      hint: TranslationData.password.tr,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) => AppTools().passwordValidate(
                        controller.passwordController,
                      ),
                      title: "",
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: AppColors.hintText,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => PrimaryCheckBox(
                            value: controller.isChecked.value,
                            onChanged: (value) => controller.onChecked(),
                            label_1: TranslationData.iAgreeWith.tr,
                            label_2: TranslationData.termsCondition.tr,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    PrimaryButton(
                      onTap: () {
                        bool validateIsFalse =
                            !controller.signUpForm.currentState!.validate();
                        if (validateIsFalse) {
                          return;
                        }
                        controller.sendOtp();
                      },
                      title: TranslationData.createAccount.tr,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    OrLine(),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SocialAuthButtons(
                          onTab: () {},
                          image: Image.asset(AppIcon.google),
                        ),
                        SocialAuthButtons(
                          onTab: () {},
                          image: Image.asset(AppIcon.facebook),
                        ),
                        SocialAuthButtons(
                          onTab: () {},
                          image: Image.asset(AppIcon.apple),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextAndButton(
                        onTap: () {},
                        text1: TranslationData.doYouHaveAnAccount.tr,
                        text2: TranslationData.signIn.tr)
                  ],
                );
              }),
        ),
      ),
    );
  }
}
