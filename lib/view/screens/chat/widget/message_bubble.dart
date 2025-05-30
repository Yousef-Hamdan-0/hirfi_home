import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/data/model/chat/message.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';
import 'package:hirfi_home/view/screens/search/widget/video_player_widget.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMine;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    // مثال بسيط لتلوين الفقاعة
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMine ? AppColors.darkBlue : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: _buildMessageContent(),
    );
  }

  Widget _buildMessageContent() {
    switch (message.messageType) {
      case 'image':
        return Image.network(message.content);
      case 'video':
        return VideoPlayerWidget(url: message.content);
      case 'location':
        final coords = message.content.split(',');
        return Text(
          '📍 الموقع: https://maps.google.com/?q=${coords[0]},${coords[1]}',
          style: const TextStyle(decoration: TextDecoration.underline),
        );
      case 'text':
      default:
        return Text(message.content,
            style: TextStyle(
                color: AppColors.white,
                fontFamily: Get.locale!.languageCode == 'ar'
                    ? AppFonts.tajawalReg
                    : AppFonts.interSemiBold,
                fontSize: Get.locale!.languageCode == 'ar' ? 16 : 14));
    }
  }
}
