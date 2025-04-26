import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';
import 'package:hirfi_home/view/widget/text/headline3.dart';
import 'package:flutter/material.dart';

class PrimaryCheckBox extends StatelessWidget {
  const PrimaryCheckBox(
      {super.key,
      required this.value,
      required this.onChanged,
      this.onTap,
      this.activeColor,
      this.fillColor,
      required this.label_1,
      this.label_2,
      this.borderRadius});
  final bool value;
  final VoidCallback? onTap;
  final ValueChanged<bool?> onChanged;
  final String label_1;
  final String? label_2;
  final Color? activeColor;
  final double? borderRadius;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,

          // fillColor:
          //     WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          //   if (states.contains(WidgetState.disabled)) {
          //     return Colors.grey;
          //   }
          //   return AppColors.buttonsBackground;
          // }),
          onChanged: onChanged,
          activeColor: activeColor ?? AppColors.buttonsBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        label_2 == null
            ? Headline3(
                title: label_1,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.almostBlack,
                    fontFamily: Get.locale!.languageCode == "ar"
                        ? AppFonts.tajawalReg
                        : AppFonts.interReg),
              )
            : Row(
                children: [
                  Headline3(
                    title: label_1,
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
                      title: label_2!,
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
              )
      ],
    );
  }
}
