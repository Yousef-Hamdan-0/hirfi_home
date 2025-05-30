import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/chat/chat_controller.dart';
import 'package:hirfi_home/view/screens/chat/widget/message_bubble.dart';
import 'package:hirfi_home/view/screens/chat/widget/message_input.dart';
import 'package:hirfi_home/view/widget/line/line.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/setting_widgets/logout_widget.dart';
import 'package:hirfi_home/view/widget/text/body_text1.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المحادثة"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                appTools.showCustomBottomSheet(
                  context,
                  LogoutWidget(
                    child: Center(
                      child: Column(
                        children: [
                          Headline4(
                            title: TranslationData.phoneNumber.tr,
                            fontSize:
                                Get.locale!.languageCode == 'ar' ? 22 : 20,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Line(),
                          const SizedBox(
                            height: 8,
                          ),
                          BodyText1(
                            title: "هل تريد الإتصال بالحرفي؟",
                            fontSize:
                                Get.locale!.languageCode == 'ar' ? 16 : 18,
                            color: AppColors.lightGrey,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Obx(() => PrimaryButton(
                                onTap: () {},
                                title: controller.craftsmanPhoneNumber.value,
                                backgroundColor: AppColors.buttonsBackground,
                              )),
                        ],
                      ),
                    ),
                  ),
                  true,
                );
              },
              icon: Icon(
                Icons.phone,
                color: AppColors.darkGrey,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final messages = controller.messages;

              if (messages.isEmpty) {
                return const Center(child: Text("لا توجد رسائل بعد."));
              }

              return ListView.builder(
                reverse: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages.reversed.toList()[index];
                  final isMine = msg.senderId == controller.senderId;

                  return Align(
                    alignment:
                        isMine ? Alignment.centerRight : Alignment.centerLeft,
                    child: MessageBubble(message: msg, isMine: isMine),
                  );
                },
              );
            }),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}
