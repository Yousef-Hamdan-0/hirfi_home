class PlaceModel {
  final int placeId;
  final String baseImage;
  final String placeName;
  final double rating;
  final int price;
  final int reviews;
  final String category;
  final String city;

  PlaceModel({
    required this.placeId,
    required this.baseImage,
    required this.placeName,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.category,
    required this.city,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeId: json['placeId'] as int,
      baseImage: json['baseImage'] as String,
      placeName: json['placeName'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'] as int,
      category: json['category'] as String,
      city: json['city'] as String,
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placeId': placeId,
      'baseImage': baseImage,
      'placeName': placeName,
      'rating': rating,
      'reviews': reviews,
      'category': category,
      'city': city,
      'price':price
    };
  }
}
