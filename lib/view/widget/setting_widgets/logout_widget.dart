import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/screens/settings/settings_controller.dart';

class LogoutWidget extends GetView<SettingsController> {
  const LogoutWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: child);
  }
}
