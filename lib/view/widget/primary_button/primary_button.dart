import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';
import 'package:flutter/material.dart';

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
  final Image? image;
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
          child: image != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image ?? Image.asset(AppIcon.apple),
                    SizedBox(
                      width: 6,
                    ),
                    Headline5(
                      title: title,
                      fontSize: Get.locale!.languageCode == 'ar' ? 18 : 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    )
                  ],
                )
              : Center(
                  child: Headline5(
                    title: title,
                    fontSize: Get.locale!.languageCode == 'ar' ? 18 : 16,
                    color: color ?? AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
