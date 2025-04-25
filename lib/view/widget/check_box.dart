<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';
=======
import 'package:hirfi_home/theme/app_colors.dart';
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
import 'package:hirfi_home/view/widget/text/headline3.dart';
import 'package:flutter/material.dart';

class PrimaryCheckBox extends StatelessWidget {
  const PrimaryCheckBox(
      {super.key,
<<<<<<< HEAD
      required this.value,
=======
      this.value,
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
      required this.onChanged,
      this.onTap,
      this.activeColor,
      required this.label_1,
      this.label_2,
      this.borderRadius});
<<<<<<< HEAD
  final bool value;
=======
  final bool? value;
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
  final VoidCallback? onTap;
  final ValueChanged<bool?> onChanged;
  final String label_1;
  final String? label_2;
  final Color? activeColor;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
<<<<<<< HEAD
          value: value,
=======
          value: value ?? false,
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
          fillColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey;
            }
            return AppColors.buttonsBackground;
          }),
          onChanged: onChanged,
          activeColor: activeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
<<<<<<< HEAD
=======
        SizedBox(
          width: 8,
        ),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
        label_2 == null
            ? Headline3(
                title: label_1,
                style: TextStyle(
<<<<<<< HEAD
                    fontWeight: FontWeight.w400,
                    color: AppColors.almostBlack,
                    fontFamily: Get.locale!.languageCode == "ar"
                        ? AppFonts.tajawalReg
                        : AppFonts.interReg),
=======
                  fontWeight: FontWeight.w400,
                  color: AppColors.almostBlack,
                ),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
              )
            : Row(
                children: [
                  Headline3(
                    title: label_1,
                    style: TextStyle(
<<<<<<< HEAD
                        fontSize: Get.locale!.languageCode == "ar" ? 14 : 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.almostBlack,
                        fontFamily: Get.locale!.languageCode == "ar"
                            ? AppFonts.tajawalReg
                            : AppFonts.interReg),
=======
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  InkWell(
                    onTap: onTap,
                    child: Headline3(
                      title: label_2!,
                      style: TextStyle(
<<<<<<< HEAD
                          fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonsBackground,
                          fontFamily: Get.locale!.languageCode == "ar"
                              ? AppFonts.tajawalBold
                              : AppFonts.interBold),
=======
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonsBackground,
                      ),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
                    ),
                  )
                ],
              )
      ],
    );
  }
}
