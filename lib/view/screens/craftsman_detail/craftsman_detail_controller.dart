import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/craftsman_detail/ext/submit_craftsman_rating.dart';


class CraftsmanDetailController extends GetxController {
  final SubmitCraftsmanRating submitRatingUseCase;

  CraftsmanDetailController({required this.submitRatingUseCase});

  RxInt userRating = 0.obs;

  void updateRating(int rating) {
    userRating.value = rating;
  }

  Future<void> submitRating({
    required String userId,
    required String craftsmanId,
  }) async {
    await submitRatingUseCase.call(
      userId: userId,
      craftsmanId: craftsmanId,
      rating: userRating.value,
    );
  }
}




