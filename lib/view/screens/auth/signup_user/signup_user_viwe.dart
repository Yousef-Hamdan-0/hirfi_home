import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/screens/auth/signup_user/signup_user_controller.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';

class SignupUserViwe extends GetView<SignupUserController> {
  const SignupUserViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, left: 24, right: 24),
            child: PrimaryAppbar(onTap: () {}),
          ),
          
        ],
      ),
    );
  }
}
