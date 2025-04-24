import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Headline4(
                title: TranslationData.changeLanguage.tr,
                fontSize: Get.locale!.languageCode == 'ar' ? 22 : 20,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: AppColors.line),
                borderRadius: BorderRadius.circular(100)),
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            title: const Headline5(title: 'English'),
            trailing: CircleAvatar(
              radius: 8,
              backgroundColor: Get.locale!.languageCode == 'en'
                  ? AppColors.primary
                  : AppColors.grey,
            ),
            onTap: () {
              Get.updateLocale(const Locale('en'));
              Get.back();
            },
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: AppColors.line),
                borderRadius: BorderRadius.circular(100)),
          ),
          SizedBox(
            height: 6,
          ),
          ListTile(
            title: const Headline5(title: 'العربية'),
            trailing: CircleAvatar(
              radius: 8,
              backgroundColor: Get.locale!.languageCode == 'ar'
                  ? AppColors.primary
                  : AppColors.grey,
            ),
            onTap: () {
              Get.updateLocale(const Locale('ar'));
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
