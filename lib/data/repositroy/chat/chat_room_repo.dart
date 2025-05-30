import 'package:hirfi_home/data/model/chat/chat_room.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';

class ChatRoomRepository {
  final SupabaseFetchService _fetchService;
  final SupabaseSendService _sendService;

  String get currentUserId => _fetchService.userIdOrThrow;

  ChatRoomRepository({
    SupabaseFetchService? fetchService,
    SupabaseSendService? sendService,
  })  : _fetchService = fetchService ?? SupabaseFetchService(),
        _sendService = sendService ?? SupabaseSendService();

  Future<List<ChatRoom>> fetchChatRoomsForUser(String userId) async {
    final data = await _fetchService.client
        .from('chat_rooms')
        .select()
        .or('user1_id.eq.$userId,user2_id.eq.$userId')
        .order('created_at');

    // 🧠 إزالة التكرارات حسب id
    final unique = <String, ChatRoom>{};
    for (var e in data) {
      final room = ChatRoom.fromMap(e);
      if (room.id != null) {
        unique[room.id!] = room;
      }
    }

    return unique.values.toList();
  }

  Future<ChatRoom> createOrGetChatRoom(
      String userId, String craftsmanId) async {
    // تحقق من وجود محادثة بالفعل
    final existingList = await _fetchService.client
        .from('chat_rooms')
        .select()
        .eq('user1_id', userId)
        .eq('user2_id', craftsmanId);

    if (existingList.isNotEmpty) {
      return ChatRoom.fromMap(existingList.first);
    }

    // أنشئ محادثة جديدة
    await _sendService.insert('chat_rooms', {
      'user1_id': userId,
      'user2_id': craftsmanId,
      'created_at': DateTime.now().toIso8601String(),
    });

    final inserted = await _fetchService.client
        .from('chat_rooms')
        .select()
        .eq('user1_id', userId)
        .eq('user2_id', craftsmanId)
        .maybeSingle();

    return ChatRoom.fromMap(inserted!);
  }
}
