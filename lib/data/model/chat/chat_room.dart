class ChatRoom {
  final String? id; // ✅ اجعل id اختياري
  final String user1Id;
  final String user2Id;
  final DateTime createdAt;

  ChatRoom({
    this.id,
    required this.user1Id,
    required this.user2Id,
    required this.createdAt,
  });

  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    return ChatRoom(
      id: map['id'],
      user1Id: map['user1_id'],
      user2Id: map['user2_id'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user1_id': user1Id,
      'user2_id': user2Id,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
