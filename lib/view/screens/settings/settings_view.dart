import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/setting_primary_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {
          Get.back();
        },
        title: TranslationData.settings.tr,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                SettingPrimaryButton(
                  onTap: (){},
                  title: TranslationData.personalDetails.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                  image: Image.asset(AppIcon.personalDetails),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                SettingPrimaryButton(
                  onTap: (){},
                  title: TranslationData.changePassword.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                  image: Image.asset(AppIcon.changePassword),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                SettingPrimaryButton(
                  onTap: (){},
                  title: TranslationData.notification.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                  image: Image.asset(AppIcon.notification),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                SettingPrimaryButton(
                  onTap: (){},
                  title: TranslationData.darkMode.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                  image: Image.asset(AppIcon.darkMode),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                SettingPrimaryButton(
                  onTap: (){},
                  title: TranslationData.languages.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                  image: Image.asset(AppIcon.languages),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                SettingPrimaryButton(
                  onTap: (){},
                  title: TranslationData.rateApp.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                  image: Image.asset(AppIcon.rateApp),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                SettingPrimaryButton(
                  onTap: (){},
                  title: TranslationData.feedback.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                  image: Image.asset(AppIcon.feedback),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                SettingPrimaryButton(
                  onTap: (){},
                  title: TranslationData.logout.tr,
                  color: AppColors.red,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                  image: Image.asset(AppIcon.logout),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}