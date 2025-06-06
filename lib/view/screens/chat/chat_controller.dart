import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hirfi_home/data/repositroy/chat/message_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hirfi_home/data/model/chat/message.dart';

import 'package:geolocator/geolocator.dart'; // لمشاركة الموقع

class ChatController extends GetxController {
  final messages = <Message>[].obs;
  final messageText = TextEditingController();
  RxString craftsmanPhoneNumber = ''.obs;
  late String chatRoomId;
  late String senderId;

  final _repo = MessageRepository();

  @override
  void onInit() {
    super.onInit();
    chatRoomId = Get.arguments['chatRoomId'];
    senderId = Supabase.instance.client.auth.currentUser!.id;
    fetchMessages();
    fetchCraftsmanPhoneNumber(
      chatRoomId: Get.arguments['chatRoomId'],
      currentUserId: Supabase.instance.client.auth.currentUser!.id,
    );
  }

  Future<void> fetchMessages() async {
    final fetched = await _repo.fetchMessages(chatRoomId);
    messages.assignAll(fetched);
  }

  Future<void> sendTextMessage() async {
    final content = messageText.text.trim();
    if (content.isEmpty) return;

    final message = Message(
      chatRoomId: chatRoomId,
      senderId: senderId,
      content: content,
      messageType: 'text',
      createdAt: DateTime.now(),
    );

    await _repo.sendMessage(message);
    messages.add(message);
    messageText.clear();
  }

  Future<void> sendMediaMessage(String filePath, String type) async {
    final url = await uploadFile(filePath, type);
    final message = Message(
      chatRoomId: chatRoomId,
      senderId: senderId,
      content: url,
      messageType: type, // 'image' or 'video'
      createdAt: DateTime.now(),
    );

    await _repo.sendMessage(message);
    messages.add(message);
  }

  Future<void> sendLocationMessage(Position position) async {
    final message = Message(
      chatRoomId: chatRoomId,
      senderId: senderId,
      content: '${position.latitude},${position.longitude}',
      messageType: 'location',
      createdAt: DateTime.now(),
    );

    await _repo.sendMessage(message);
    messages.add(message);
  }

  Future<String> uploadFile(String filePath, String type) async {
    final file = File(filePath);
    final fileName = file.uri.pathSegments.last;
    final bucket = 'chat-media';

    await Supabase.instance.client.storage.from(bucket).upload(
          'media/$fileName',
          file,
          fileOptions: const FileOptions(upsert: true), // ✅ السماح بالاستبدال
        );

    final publicUrl = Supabase.instance.client.storage
        .from(bucket)
        .getPublicUrl('media/$fileName');

    return publicUrl;
  }

  Future<void> fetchCraftsmanPhoneNumber({
    required String chatRoomId,
    required String currentUserId,
  }) async {
    try {
      final room = await Supabase.instance.client
          .from('chat_rooms')
          .select('user1_id, user2_id')
          .eq('id', chatRoomId)
          .maybeSingle();

      if (room == null) return;

      final user1Id = room['user1_id'];
      final user2Id = room['user2_id'];

      final otherId = user1Id == currentUserId ? user2Id : user1Id;

      final craftsman = await Supabase.instance.client
          .from('craftsman')
          .select('phone_number')
          .eq('id', otherId)
          .maybeSingle();

      if (craftsman != null && craftsman['phone_number'] != null) {
        craftsmanPhoneNumber.value = craftsman['phone_number'];
        print('📞 رقم الحرفي: ${craftsmanPhoneNumber.value}');
      }
    } catch (e) {
      print('❌ خطأ أثناء جلب رقم الهاتف: $e');
    }
  }
}
