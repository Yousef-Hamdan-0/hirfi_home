import 'package:hirfi_home/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton(
      {super.key,
      required this.onTap,
      this.color,
      this.backgroundColor,
      this.icon,
      this.iconSize,
      this.image});
  final VoidCallback onTap;
  final Color? color;
  final Color? backgroundColor;
  final IconData? icon;
  final SvgPicture? image;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      splashFactory: InkSplash.splashFactory,
      
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 33,
        height: 33,
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.white.withOpacity(0.1),
            shape: BoxShape.circle),
        child: Center(
          child: Icon(
            icon ?? Icons.language,
            size: iconSize ?? 16,
            color: color ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
