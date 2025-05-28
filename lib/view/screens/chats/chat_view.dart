import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/screens/chats/chat_binding.dart';
import 'package:hirfi_home/view/screens/chats/chat_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
    );
  }
}
