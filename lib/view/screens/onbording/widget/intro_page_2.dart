import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/view/widget/text/body_text1.dart';
import 'package:hirfi_home/view/widget/text/headline3.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 524,
            child: Image.asset(
              ImagesAssets.aiImage2,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 64,
          ),
          Headline3(
            title: TranslationData.connectWithSpecialists.tr,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.headLineText,
              fontSize: Get.locale!.languageCode == 'ar' ? 20 : 18,
              fontFamily: Get.locale!.languageCode == 'ar'
                  ? AppFonts.tajawalReg
                  : AppFonts.interReg,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: BodyText1(
              title: TranslationData.connectWithSpecialistsExplanation.tr,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                height: 1,
                color: AppColors.darkGrey,
                fontSize: Get.locale!.languageCode == 'ar' ? 16 : 14,
                fontFamily: Get.locale!.languageCode == 'ar'
                    ? AppFonts.tajawalReg
                    : AppFonts.interReg,
              ),
            ),
          )
        ],
      ),
    );
  }
}
