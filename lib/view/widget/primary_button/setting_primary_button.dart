import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';

class SettingPrimaryButton extends StatelessWidget {
  const SettingPrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.leading,
    this.titleColor,
    this.color,
    this.backgroundColor,
    this.iconSize,
  });

  final VoidCallback onTap;
  final String title;
  final Color? titleColor;
  final Color? color;
  final Color? backgroundColor;
  final Widget? leading;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return ListTile(
      leading: leading,
      contentPadding: const EdgeInsetsDirectional.only(start: 0, end: 0),
      title: Headline5(
        title: title,
        fontSize: Get.locale!.languageCode == "ar" ? 20 : 18,
        color: titleColor ?? const Color(0xff6B7280),
      ),
      trailing: Icon(Icons.chevron_right, color: color ?? AppColors.appBarIcon),
      onTap: onTap,
    );
  }
}
