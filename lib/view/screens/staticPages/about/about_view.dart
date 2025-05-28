import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/setting_primary_button.dart';
import 'package:hirfi_home/view/widget/text/headline2.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:hirfi_home/view/widget/text/headline6.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {
          Get.back();
        },
        title: TranslationData.about.tr,
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
                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(ImagesAssets.lightModeLogo)],
                    ),
                    SizedBox(height: 8),
                    Headline4(
                      title: TranslationData.version.tr,
                      fontSize: Get.locale!.languageCode == "ar" ? 22 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Headline2(
                  title: TranslationData.about.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 24),
                Headline6(
                  title: TranslationData.aboutText.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 10,
                ),
                SizedBox(height: 24),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 112),
                SettingPrimaryButton(
                  onTap: () {},
                  title: TranslationData.termsCondition.tr,
                  image: Image.asset(AppIcon.termsAndConfitions),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                SettingPrimaryButton(
                  onTap: () {},
                  title: TranslationData.cookiesPolicy.tr,
                  image: Image.asset(AppIcon.cookiesPolicy),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
