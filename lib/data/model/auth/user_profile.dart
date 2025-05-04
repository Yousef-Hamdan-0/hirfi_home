class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? profilePicture;
  final String? dateOfBirth; // يمكن تحويله لـ DateTime إذا لزم الأمر
  final String? gender;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.profilePicture,
    this.dateOfBirth,
    this.gender,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    // تحقق من الحقول المطلوبة
    if (map['id'] == null || map['name'] == null || map['email'] == null || map['phone_number'] == null) {
      throw ArgumentError('Required fields are missing in UserProfile map');
    }

    return UserProfile(
      id: map['id'].toString(),
      name: map['name'].toString(),
      email: map['email'].toString(),
      phoneNumber: map['phone_number'].toString(),
      profilePicture: map['profile_picture']?.toString(),
      dateOfBirth: map['date_of_birth']?.toString(),
      gender: map['gender']?.toString(),
    );
  }

  static List<String> get columns => [
    'id',
    'name',
    'email',
    'phone_number',
    'profile_picture',
    'date_of_birth',
    'gender',
  ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'profile_picture': profilePicture,
      'date_of_birth': dateOfBirth,
      'gender': gender,
    };
  }

  // دالة مساعدة لإنشاء نسخة معدلة من البروفايل
  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? profilePicture,
    String? dateOfBirth,
    String? gender,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
    );
  }

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, email: $email, phone: $phoneNumber)';
  }
}