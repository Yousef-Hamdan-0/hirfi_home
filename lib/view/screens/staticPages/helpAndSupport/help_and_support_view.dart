import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/text/headline2.dart';
import 'package:hirfi_home/view/widget/text/headline6.dart';

class HelpAndSupportView extends StatelessWidget {
  const HelpAndSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {
          Get.back();
        },
        title: TranslationData.helpAndSupport.tr,
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
                Headline2(
                  title: TranslationData.helpAndSupport.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.helpAndSupportText.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 5,
                ),
                SizedBox(height: 24),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 24),
                Headline2(
                  title: TranslationData.frequentlyAskedQuestions.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.fAQSearch.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.fAQSearchText.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.fAQContact.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.fAQContactText.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.fAQRequest.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.fAQRequestText.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.fAQQuality.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.fAQQualityText.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.fAQIssue.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.fAQIssueText.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 24),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 24),
                Headline2(
                  title: TranslationData.contactUs.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.contactAndSupportEmail.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.contactAndSupportNumber.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.contactAndSupportChat.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}