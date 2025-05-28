import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatController extends GetxController {
  final String chatRoomId;
  ChatController(this.chatRoomId);

  var messages = [].obs;
  final messageController = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMessages();
    _subscribeToMessages();
  }

  Future<void> fetchMessages() async {
    final data = await Supabase.instance.client
        .from('messages')
        .select()
        .eq('chat_room_id', chatRoomId)
        .order('created_at', ascending: true);
    messages.value = data;
  }

  void _subscribeToMessages() {
    Supabase.instance.client
        .channel('public:messages')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'messages',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'chat_room_id',
            value: chatRoomId,
          ),
          callback: (payload) {
            messages.add(payload.newRecord);
          },
        )
        .subscribe();
  }

  Future<void> sendMessage(String content) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null || content.trim().isEmpty) return;

    await Supabase.instance.client.from('messages').insert({
      'chat_room_id': chatRoomId,
      'sender_id': userId,
      'content': content.trim(),
      'message_type': 'text',
      'created_at': DateTime.now().toIso8601String(),
    });

    messageController.value = '';
  }
}
