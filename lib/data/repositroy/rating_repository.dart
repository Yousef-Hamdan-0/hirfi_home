abstract class RatingRepository {
  Future<void> submitRating({
    required String userId,
    required String craftsmanId,
    required int rating,
  });
}
