import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hirfi_home/util/fonts.dart';

class PrimaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppbar({
    super.key,
    required this.onTap,
    this.backgroundColor,
    this.widgetTitle,
    this.icon,
    this.imageIcon,
    this.child,
    this.title,
    this.centerTitle,
    this.iconColor,
    this.actions,
  });
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Widget? widgetTitle;
  final Widget? child;
  final String? title;
  final bool? centerTitle;
  final IconData? icon;
  final Image? imageIcon;
  final Color? iconColor;
  final List<Widget>? actions;
  @override
  Size get preferredSize => const Size.fromHeight(40);
  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: AppBar(
            backgroundColor: backgroundColor ?? AppColors.white,
            title: widgetTitle ??
                Text(
                  title ?? "",
                  style: TextStyle(
                      fontFamily: Get.locale!.languageCode == "ar"
                          ? AppFonts.tajawalBold
                          : AppFonts.interSemiBold,
                      fontSize: Get.locale!.languageCode == "ar" ? 22 : 20,
                      color: AppColors.almostBlack),
                ),
            centerTitle: centerTitle ?? true,
            leading: child ??
                InkWell(
                  onTap: onTap,
                  child: icon != null
                  ? Icon(
                    icon ?? Icons.arrow_back,
                    color: iconColor ?? AppColors.almostBlack,
                    size: 24,
                  ):imageIcon,
                ),
            actions: actions,
          ),
        ),
      );
}
