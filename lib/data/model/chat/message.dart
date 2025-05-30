class Message {
  final String? id; // ❗️Nullable because Supabase generates it
  final String chatRoomId;
  final String senderId;
  final String content;
  final String messageType; // 'text', 'image', 'video', 'location'
  final DateTime createdAt;
  

  Message({
    this.id,
    required this.chatRoomId,
    required this.senderId,
    required this.content,
    required this.messageType,
    required this.createdAt,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      chatRoomId: map['chat_room_id'],
      senderId: map['sender_id'],
      content: map['content'],
      messageType: map['message_type'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chat_room_id': chatRoomId,
      'sender_id': senderId,
      'content': content,
      'message_type': messageType,
      'created_at': createdAt.toIso8601String(),
      // 🔥 لا نرسل id، لأن Supabase يتكفل بذلك
    };
  }
}
