import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/settings/change_password/change_password_controller.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:hirfi_home/view/widget/text_field.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

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
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 8, right: 24, left: 24),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 1,
          shrinkWrap: false,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 61),
                Headline4(
                  title: TranslationData.createNewPassword.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 22 : 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 8),
                BodyText2(
                  title: TranslationData.yourNewPassword.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  color: AppColors.lightGrey,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                MainTextField(
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
                ),
                SizedBox(height: 20),
                MainTextField(
                  controller: controller.confirmPasswordController,
                  hint: TranslationData.confirmPassword.tr,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: (value) => AppTools().passwordSetValidate(
                      controller.confirmPasswordController),
                  obscureText: controller.visibility.value,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.hintText,
                  ),
                ),
                SizedBox(height: 32),
                PrimaryButton(
                    onTap: () {}, title: TranslationData.changePassword.tr),
              ],
            );
          },
        ),
      ),
    );
  }
}
