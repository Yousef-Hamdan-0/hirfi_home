class CraftsmanRating {
  final String id;
  final String userId;
  final String craftsmanId;
  final int rating;
  final DateTime createdAt;

  CraftsmanRating({
    required this.id,
    required this.userId,
    required this.craftsmanId,
    required this.rating,
    required this.createdAt,
  });

  factory CraftsmanRating.fromJson(Map<String, dynamic> json) {
    return CraftsmanRating(
      id: json['id'],
      userId: json['user_id'],
      craftsmanId: json['craftsman_id'],
      rating: json['rating'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'craftsman_id': craftsmanId,
      'rating': rating,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
