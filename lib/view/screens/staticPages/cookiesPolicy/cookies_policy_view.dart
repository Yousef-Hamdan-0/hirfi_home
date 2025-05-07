import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/text/headline2.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:hirfi_home/view/widget/text/headline6.dart';

class CookiesPolicyView extends StatelessWidget {
  const CookiesPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {
          Get.back();
        },
        title: TranslationData.cookiesPolicy.tr,
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
                  title: TranslationData.cookiesPolicy.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                ),
                SizedBox(height: 16),
                Headline4(
                  title: TranslationData.cookiesPolicyLastUpdated.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 5,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.cookiesPolicyText.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 5,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.cookiesPolicyDefinition.tr,
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
                  title: TranslationData.howHirfiHomeUsesCookies.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
                  maxLines: 2,
                ),
                SizedBox(height: 16),
                Headline4(
                  title: TranslationData.essentialCookies.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.essentialCookiesSecurely.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.essentialCookiesServices.tr,
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
                Headline4(
                  title: TranslationData.functionalCookies.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.functionalCookiesLanguage.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.functionalCookiesEfficient.tr,
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
                Headline4(
                  title: TranslationData.performanceAndAnalyticsCookies.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.performanceAndAnalyticsCookiesAnonymous.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.performanceAndAnalyticsCookiesQuality.tr,
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
                Headline4(
                  title: TranslationData.marketingAndAdvertisingCookies.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.marketingAndAdvertisingCookiesTargeted.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.marketingAndAdvertisingCookiesMeasure.tr,
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
                Headline4(
                  title: TranslationData.privacyAndSecurityCookies.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.privacyAndSecurityCookiesPolicy.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.privacyAndSecurityCookiesSharing.tr,
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
                Headline4(
                  title: TranslationData.changesToTermsCookies.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                SizedBox(height: 16),
                Headline6(
                  title: TranslationData.changesToTermsCookiesUpdate.tr,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  maxLines: 2,
                ),
                Headline6(
                  title: TranslationData.changesToTermsCookiesContinuing.tr,
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