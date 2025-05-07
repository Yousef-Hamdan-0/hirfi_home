import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hirfi_home/theme/app_colors.dart';

class SettingPrimaryButton extends StatelessWidget {
  const SettingPrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.image,
    this.fontSize,
    this.color,
    this.backgroundColor,
    this.icon,
    this.iconSize,
  });
  final VoidCallback onTap;
  final String title;
  final double? fontSize;
  final Color? color;
  final Color? backgroundColor;
  final IconData? icon;
  final Image image;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: image,
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: color ?? AppColors.lightGrey,
        ),
      ),
      trailing:
          Icon(Icons.chevron_right, color: color ?? AppColors.almostBlack),
      onTap: () {
        onTap;
      },
    );
  }
}
