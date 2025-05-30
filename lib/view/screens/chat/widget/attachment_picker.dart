import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hirfi_home/view/screens/chat/chat_controller.dart';

class AttachmentPicker extends GetView<ChatController> {
  const AttachmentPicker({super.key});

  Future<String?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile?.path;
  }

  Future<String?> pickVideo() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    return pickedFile?.path;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text("صورة"),
            onTap: () async {
              final path = await pickImage();
              if (path != null) {
                controller.sendMediaMessage(path, 'image');
              }
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.videocam),
            title: const Text("فيديو"),
            onTap: () async {
              final path = await pickVideo();
              if (path != null) {
                controller.sendMediaMessage(path, 'video');
              }
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
