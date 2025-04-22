import 'package:hirfi_home/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChangeLanguageIconButton extends StatelessWidget {
  const ChangeLanguageIconButton({
    super.key,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    // required this.icon,
    // this.iconData,
    // required this.title
  });
  // final double? width;
  // final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  // final IconData icon;
  // final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: onTap,
              focusColor: AppColors.white.withValues(alpha: 0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.1,
                height: MediaQuery.sizeOf(context).width * 0.1,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff000000).withValues(alpha: 0.1)),
                child: Center(
                    child: Icon(
                  Icons.language,
                  color: iconColor ?? AppColors.white,
                  size: MediaQuery.sizeOf(context).width * 0.09,
                )),
              ),
            )
          ],
        ));
  }
}
