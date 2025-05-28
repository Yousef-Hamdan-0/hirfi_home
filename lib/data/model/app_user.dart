class AppUser {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? picture;
  final String role;
  final DateTime createdAt;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.picture,
    required this.role,
    required this.createdAt,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'].toString(),
      name: map['name'].toString(),
      email: map['email'].toString(),
      phoneNumber: map['phone_number'].toString(),
      picture: map['picture']?.toString(),
      role: map['role'].toString(),
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'picture': picture,
      'role': role,
      'created_at': createdAt.toIso8601String(),
    };
  }

  static List<String> get columns => [
        'id',
        'name',
        'email',
        'phone_number',
        'picture',
        'role',
        'created_at',
      ];

  @override
  String toString() =>
      'AppUser(id: $id, name: $name, email: $email, role: $role)';
}
