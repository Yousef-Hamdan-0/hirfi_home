// import 'package:get/get.dart';
// import 'package:hirfi_home/data/model/chat/message.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class ChatRomeController extends GetxController {
//   final String chatRoomId;

//   ChatRomeController(this.chatRoomId);

//   final SupabaseClient _client = Supabase.instance.client;

//   final messages = <Message>[].obs;
//   final isLoading = false.obs;

//   late RealtimeChannel _subscription;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchMessages();
//     subscribeToMessages();
//   }

//   void fetchMessages() async {
//     try {
//       isLoading.value = true;

//       final response = await _client
//           .from('messages')
//           .select()
//           .eq('chat_room_id', chatRoomId)
//           .order('created_at', ascending: true);

//       messages.value = (response as List)
//           .map((e) => Message.fromMap(e as Map<String, dynamic>))
//           .toList();
//     } catch (e) {
//       print('❌ Error loading messages: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void subscribeToMessages() {
//     _subscription = _client
//         .channel('public:messages')
//         .onPostgresChanges(
//           event: PostgresChangeEvent.insert,
//           schema: 'public',
//           table: 'messages',
//           callback: (payload) {
//             final newMessage = Message.fromMap(payload.newRecord);
//             if (newMessage.chatRoomId == chatRoomId) {
//               messages.add(newMessage);
//             }
//           },
//         )
//         .subscribe();
//   }

//   void sendMessage(String content) async {
//     final userId = _client.auth.currentUser!.id;

//     await _client.from('messages').insert({
//       'chat_room_id': chatRoomId,
//       'sender_id': userId,
//       'content': content,
//       'message_type': 'text',
//     });
//   }

//   @override
//   void onClose() {
//     _client.removeChannel(_subscription);
//     super.onClose();
//   }
// }
