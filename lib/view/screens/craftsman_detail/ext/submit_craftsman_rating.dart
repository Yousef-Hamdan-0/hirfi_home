import 'package:hirfi_home/data/repositroy/rating_repository.dart';


class SubmitCraftsmanRating {
  final RatingRepository  repository;

  SubmitCraftsmanRating({required this.repository});

  Future<void> call({
    required String userId,
    required String craftsmanId,
    required int rating,
  }) async {
    await repository.submitRating(
      userId: userId,
      craftsmanId: craftsmanId,
      rating: rating,
    );
  }
}