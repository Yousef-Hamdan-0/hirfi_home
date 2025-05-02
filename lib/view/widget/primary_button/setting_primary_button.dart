import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/images.dart';

class SettingPrimaryButton extends StatelessWidget {
  const SettingPrimaryButton({
    super.key,
      required this.onTap,
      required this.title,
      this.fontSize,
      this.color,
      this.backgroundColor,
      this.icon,
      this.iconSize,
      this.image
  });
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
    return ListTile(
      leading: image,
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: color ?? AppColors.lightGrey,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: color ?? AppColors.almostBlack),
      onTap: () {
        onTap;
      },
    );
  }
}