import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.fontSize,
      this.color,
      this.backgroundColor,
      this.icon,
      this.iconSize,
      this.image});
  final VoidCallback onTap;
  final String title;
  final double? fontSize;
  final Color? color;
  final Color? backgroundColor;
  final IconData? icon;
  final SvgPicture? image;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.black54,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 48,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.buttonsBackground,
            borderRadius: BorderRadius.circular(100),
          ),
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: iconSize,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Headline5(
                      title: title,
                      fontSize: fontSize ?? 14,
                      fontWeight: FontWeight.w500,
                      color: color,
                    )
                  ],
                )
              : Center(
                  child: Headline5(
                    title: title,
                    fontSize: Get.locale!.languageCode == 'ar' ? 18 : 16,
                    color: color ?? AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
