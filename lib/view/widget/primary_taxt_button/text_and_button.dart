import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';
import 'package:hirfi_home/view/widget/text/headline3.dart';

class TextAndButton extends StatelessWidget {
  const TextAndButton({
    super.key,
    required this.onTap,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Headline3(
          title: text1,
          style: TextStyle(
              fontSize: Get.locale!.languageCode == "ar" ? 14 : 12,
              fontWeight: FontWeight.w400,
              color: AppColors.almostBlack,
              fontFamily: Get.locale!.languageCode == "ar"
                  ? AppFonts.tajawalReg
                  : AppFonts.interReg),
        ),
        SizedBox(
          width: 2,
        ),
        InkWell(
          onTap: onTap,
          child: Headline3(
            title: text2,
            style: TextStyle(
                fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonsBackground,
                fontFamily: Get.locale!.languageCode == "ar"
                    ? AppFonts.tajawalBold
                    : AppFonts.interBold),
          ),
        )
      ],
    );
  }
}
