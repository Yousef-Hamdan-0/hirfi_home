class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String profilePicture;
  final DateTime dateOfBirth;
  final String gender;
  final bool acceptedTerms;
  final DateTime createdAt;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.dateOfBirth,
    required this.gender,
    required this.acceptedTerms,
    required this.createdAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      profilePicture: json['profile_picture'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      gender: json['gender'] as String,
      acceptedTerms: json['accepted_terms'] as bool,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'profile_picture': profilePicture,
      "date_of_birth": dateOfBirth.toIso8601String(),
      "gender": gender,
      'accepted_terms': acceptedTerms,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
