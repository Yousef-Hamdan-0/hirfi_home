import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/text/headline2.dart';
import 'package:hirfi_home/view/widget/text/headline6.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {
          Get.back();
        },
        title: TranslationData.termsCondition.tr,
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
                  title: TranslationData.termsCondition.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.termsAndConditionsText.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 5,
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                Headline2(
                  title: TranslationData.definitions.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.definitionsUser.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.definitionsTradesperson.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.definitionsApp.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                Headline2(
                  title: TranslationData.termsOfUse.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.termsOfUseOlder.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.termsOfUseIllegal.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.termsOfUseInformation.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.termsOfUseDelete.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                Headline2(
                  title: TranslationData.bookingAndPayment.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.bookingAndPaymentTradesperson.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.bookingAndPaymentDisputes.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.bookingAndPaymentRecommended.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                Headline2(
                  title: TranslationData.disclaimer.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.disclaimerMediator.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.disclaimerDamages.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.disclaimerResponsible.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                Headline2(
                  title: TranslationData.privacyAndSecurity.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.privacyAndSecurityPrivacyPolicy.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.privacyAndSecurityProhibited.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                Headline2(
                  title: TranslationData.changesToTerms.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.changesToTermsModify.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.changesToTermsContinuing.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.line)),
                ),
                SizedBox(height: 12),
                Headline2(
                  title: TranslationData.contactAndSupport.tr,
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
                SizedBox(height: 24),
                Headline6(
                  title: TranslationData.contactAndSupportThank.tr,
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
