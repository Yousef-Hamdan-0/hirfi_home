import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/theme/text_themes.dart';
import 'package:hirfi_home/util/fonts.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:flutter/material.dart';

class PrimaryTaxtButton extends StatelessWidget {
  const PrimaryTaxtButton(
      {super.key,
      required this.onTap,
      this.child,
      required this.title,
      this.color,
      this.fontSize,
      this.fontWeight});
  final VoidCallback onTap;
  final Widget? child;
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: child ??
          BodyText2(
            title: title,
            style: TextThemeStyle().bodyText2.copyWith(
                  fontSize: fontSize ?? 13,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: color ?? AppColors.textButton,
                  fontFamily: Get.locale!.languageCode == 'ar'
                      ? AppFonts.tajawalReg
                      : AppFonts.interReg,
                ),
          ),
    );
  }
}
