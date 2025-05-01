import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';

class VerifyOtpWidget extends StatelessWidget {
  const VerifyOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).height * 0.4,
      padding: EdgeInsets.only(top: 32, right: 42.5, left: 42.5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(48),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 131,
            height: 131,
            decoration:
                BoxDecoration(color: Color(0xffA4CFC3), shape: BoxShape.circle),
            child: Center(
              child: Image.asset(AppIcon.shieldTick),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Headline4(
            title: TranslationData.congratulations.tr,
            fontSize: Get.locale!.languageCode == 'ar' ? 22 : 20,
          ),
          SizedBox(
            height: 8,
          ),
          BodyText2(
            title: TranslationData.congratulationsExplanation.tr,
            fontSize: Get.locale!.languageCode == 'ar' ? 16 : 14,
          ),
          
        ],
      ),
    );
  }
}
