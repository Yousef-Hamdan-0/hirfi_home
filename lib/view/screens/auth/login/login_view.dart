import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/main_shell_view.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/auth/login/login_controller.dart';
import 'package:hirfi_home/view/screens/home/controller/home_binding.dart';
import 'package:hirfi_home/view/widget/line/or_line.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/primary_taxt_button/primary_taxt_button.dart';
import 'package:hirfi_home/view/widget/primary_taxt_button/text_and_button.dart';
import 'package:hirfi_home/view/widget/social_auth_buttons.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:hirfi_home/view/widget/text_field.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
        key: controller.signInForm,
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
                    title: TranslationData.hiWelcomeBack.tr,
                    fontSize: Get.locale!.languageCode == "ar" ? 22 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 8),
                  BodyText2(
                    title: TranslationData.hopeYouAreDoingFine.tr,
                    fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                    color: AppColors.lightGrey,
                  ),
                  SizedBox(height: 32),
                  MainTextField(
                      controller: controller.emailController,
                      hint: TranslationData.yourEmail.tr,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          AppTools().emailValidate(controller.emailController),
                      prefixIcon: Image.asset(AppIcon.email)),
                  SizedBox(height: 20),
                  Obx(
                    () => MainTextField(
                      controller: controller.passwordController,
                      hint: TranslationData.password.tr,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) => AppTools()
                          .passwordSetValidate(controller.passwordController),
                      obscureText: controller.visibility.value,
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: AppColors.hintText,
                      ),
                      suffixIcon: InkWell(
                        onTap: () => controller.onOffVisibility(),
                        child: controller.visibility.value == true
                            ? Icon(
                                Icons.visibility_off,
                                color: AppColors.hintText,
                              )
                            : Icon(
                                Icons.visibility,
                                color: AppColors.hintText,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  PrimaryButton(
                      onTap: () => controller.login(),
                      title: TranslationData.signIn.tr),
                  SizedBox(height: 24),
                  OrLine(),
                  SizedBox(height: 24),
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
                  PrimaryTaxtButton(
                      onTap: () {
                        Get.offAll(MainShellView(),binding: HomeBinding());
                      }, title: TranslationData.forgotPassword.tr),
                  SizedBox(
                    height: 24,
                  ),
                  TextAndButton(
                      onTap: () {},
                      text1: TranslationData.doNotHaveAnAccountYet.tr,
                      text2: TranslationData.signUp.tr),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
