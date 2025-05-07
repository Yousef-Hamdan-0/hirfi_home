import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hirfi_home/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          children: [
            if (leading != null && title != null)
            
              Expanded(
                child: Text(
                  title!,
                  style: TextStyle(
                    color: AppColors.almostBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (actions != null) ...actions!,
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
