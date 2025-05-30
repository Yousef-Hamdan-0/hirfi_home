import 'package:get/get.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/data/model/chat/chat_room.dart';
import 'package:hirfi_home/data/model/app_user.dart'; // تأكد من استيراد AppUser
import 'package:hirfi_home/data/model/chat/message.dart';
import 'package:hirfi_home/data/repositroy/chat/chat_room_repo.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatsController extends GetxController {
  final chatRooms = <ChatRoom>[].obs;
  final isLoading = false.obs;

  final _repo = ChatRoomRepository();
  final _fetchService = SupabaseFetchService();

  late String userId;

  // 🆕 نضيف Map لتخزين الحرفيين المرتبطين بكل محادثة
  final Map<String, Craftsman> chatCraftsmen = {};

  @override
  void onInit() {
    super.onInit();
    userId = _repo.currentUserId;
    fetchChats();
  }

  Future<void> fetchChats() async {
    isLoading.value = true;
    try {
      final rooms = await _repo.fetchChatRoomsForUser(userId);
      chatRooms.value = rooms;

      // 🆕 بعد جلب المحادثات، نجلب كل بيانات الحرفيين دفعة واحدة
      for (final room in rooms) {
        final craftsmanId = room.user2Id;

        // تأكد ما يكون تم تحميل نفس الحرفي من قبل
        if (!chatCraftsmen.containsKey(craftsmanId)) {
          final data = await _fetchService.fetchSingle(
            'craftsman',
            Craftsman.columns,
            'craftman_id',
            craftsmanId,
          );

          if (data != null) {
            chatCraftsmen[craftsmanId] =
                Craftsman.fromMap({...data, 'craftman_id': craftsmanId});
          }
        }
      }
    } finally {
      isLoading.value = false;
    }
  }

  final Map<String, Message> lastMessages = {};
  Future<void> fetchLastMessagesForAllChatRooms() async {
    final supabase = Supabase.instance.client;

    final data = await supabase
        .from('messages')
        .select()
        .order('created_at', ascending: false);

    for (final item in data) {
      final message = Message.fromMap(item);

      if (!lastMessages.containsKey(message.chatRoomId)) {
        lastMessages[message.chatRoomId] = message;
      }
    }

    update(); // تحديث GetX
  }
  

  // 🛑 لم نعد بحاجة لـ getCraftsmanFromChat()
}
