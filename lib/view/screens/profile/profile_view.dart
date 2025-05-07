import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/screens/profile/profile_controller.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: Image.asset(AppIcon.setting)),
      ),
    );
  }
}
