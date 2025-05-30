import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hirfi_home/data/api/search_api.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/screens/chat/chat_view.dart';
import 'package:hirfi_home/view/screens/chats/chat_controller.dart';
import 'package:hirfi_home/view/screens/chats/widget/chat_card.dart';
import 'package:hirfi_home/view/screens/search/page/search_view.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          TranslationData.chats.tr,
          style: TextStyle(
              fontFamily: Get.locale!.languageCode == "ar"
                  ? AppFonts.tajawalBold
                  : AppFonts.interSemiBold,
              fontSize: Get.locale!.languageCode == "ar" ? 22 : 20,
              color: AppColors.almostBlack),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchChats();
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            InkWell(
              onTap: () async {
                List<String> chaletNames =
                    await SearchApp().getCraftsmanNames();
                showSearch(
                  context: context,
                  delegate: customersearch(username: chaletNames),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey.shade600),
                    const SizedBox(width: 12),
                    Text(
                      TranslationData.searchCraftsman.tr,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.chatRooms.isEmpty) {
                  return const Center(child: Text('لا توجد محادثات بعد'));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.chatRooms.length,
                  itemBuilder: (context, index) {
                    final room = controller.chatRooms[index];
                    final craftsman = controller.chatCraftsmen[
                        room.user2Id]; // ✅ استخدم البيانات المحملة مسبقًا

                    if (craftsman == null) return const SizedBox.shrink();

                    return chatCard(
                      onTap: () {
                        Get.toNamed(RoutesString.chatScreen, arguments: {
                          'chatRoomId': room.id,
                        });
                      },
                      imageUrl: craftsman.picture ?? '',
                      name: craftsman.name,
                      lastMessage: '', // يمكن إضافة لاحقًا
                      time: "",
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
