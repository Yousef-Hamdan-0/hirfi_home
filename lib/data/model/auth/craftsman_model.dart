class Craftsman {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? picture;
  final String? occupationType;
  final String? aboutMe;
  final int? costumerCount;
  final int? experienceYears;
  final double? rating;
  final int? reviewsCount;
  final String? address;
  final String? createdAt;
  final bool? isApproved;

  Craftsman({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.picture,
    this.occupationType,
    this.aboutMe,
    this.costumerCount,
    this.experienceYears,
    this.rating,
    this.reviewsCount,
    this.address,
    this.createdAt,
    this.isApproved,
  });

  factory Craftsman.fromMap(Map<String, dynamic> map) {
    return Craftsman(
      id: map['craftman_id'].toString(),
      name: map['name'].toString(),
      email: map['email'].toString(),
      phoneNumber: map['phone_number'].toString(),
      picture: map['picture']?.toString(),
      occupationType: map['occupation_type']?.toString(),
      aboutMe: map['about_me']?.toString(),
      costumerCount: map['costumer_count'] != null
          ? int.tryParse(map['costumer_count'].toString())
          : null,
      experienceYears: map['experience_years'] != null
          ? int.tryParse(map['experience_years'].toString())
          : null,
      rating: map['rating'] != null
          ? double.tryParse(map['rating'].toString())
          : null,
      reviewsCount: map['reviews_count'] != null
          ? int.tryParse(map['reviews_count'].toString())
          : null,
      address: map['address']?.toString(),
      createdAt: map['created_at']?.toString(),
      isApproved: map['is_approved'] == true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'craftman_id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'picture': picture,
      'occupation_type': occupationType,
      'about_me': aboutMe,
      'costumer_count': costumerCount,
      'experience_years': experienceYears,
      'rating': rating,
      'reviews_count': reviewsCount,
      'address': address,
      'created_at': createdAt,
      'is_approved': isApproved,
    };
  }

  static List<String> get columns => [
        'craftman_id',
        'name',
        'email',
        'phone_number',
        'picture',
        'occupation_type',
        'about_me',
        'costumer_count',
        'experience_years',
        'rating',
        'reviews_count',
        'address',
        'created_at',
        'is_approved',
      ];
}
