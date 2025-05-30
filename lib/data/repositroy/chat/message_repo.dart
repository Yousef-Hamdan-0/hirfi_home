

import 'package:hirfi_home/data/model/chat/message.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';

class MessageRepository {
  final SupabaseFetchService _fetchService;
  final SupabaseSendService _sendService;

  MessageRepository({
    SupabaseFetchService? fetchService,
    SupabaseSendService? sendService,
  })  : _fetchService = fetchService ?? SupabaseFetchService(),
        _sendService = sendService ?? SupabaseSendService();

  Future<List<Message>> fetchMessages(String chatRoomId) async {
    final data = await _fetchService.fetchList(
      'messages',
      ['id', 'chat_room_id', 'sender_id', 'content', 'message_type', 'created_at'],
      'chat_room_id',
      chatRoomId,
      filters: {'chat_room_id': chatRoomId},
    );
    return data.map((e) => Message.fromMap(e)).toList();
  }

  Future<void> sendMessage(Message message) async {
    await _sendService.insert('messages', message.toMap());
  }

  Future<void> deleteMessage(String messageId) async {
    await _sendService.delete('messages', 'id', messageId);
  }
}
