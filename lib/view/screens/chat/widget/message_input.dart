import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hirfi_home/view/screens/chat/chat_controller.dart';
import 'package:hirfi_home/view/screens/chat/widget/attachment_picker.dart';

class MessageInput extends GetView<ChatController> {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => showAttachmentPicker(),
          ),
          Expanded(
            child: TextField(
              controller: controller.messageText,
              decoration: const InputDecoration(
                hintText: 'أكتب رسالة...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: controller.sendTextMessage,
          ),
        ],
      ),
    );
  }

  void showAttachmentPicker() {
    Get.bottomSheet(AttachmentPicker());
  }
}
