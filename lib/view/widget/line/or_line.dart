import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.35,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.line)),
        ),
        Headline5(
          title: TranslationData.or.tr,
          fontSize: Get.locale!.languageCode == "ar" ? 18 : 16,
          fontWeight: FontWeight.w600,
          color: AppColors.lightGrey,
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.35,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.line)),
        ),
      ],
    );
  }
}
