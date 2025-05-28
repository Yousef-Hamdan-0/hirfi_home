import 'package:get/get.dart';
import 'package:hirfi_home/data/repositroy/rating_repository.dart';
import 'package:hirfi_home/data/repositroy/rating_repositoryImpl.dart';
import 'package:hirfi_home/view/screens/craftsman_detail/craftsman_detail_controller.dart';
import 'package:hirfi_home/view/screens/craftsman_detail/ext/submit_craftsman_rating.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CraftsmanDetailBinding extends Bindings {
  @override
  void dependencies() {
    final supabase = Supabase.instance.client;
    Get.lazyPut<RatingRepository>(
        () => RatingRepositoryImpl(supabase: supabase));
    Get.lazyPut<SubmitCraftsmanRating>(
        () => SubmitCraftsmanRating(repository: Get.find()));
    Get.lazyPut<CraftsmanDetailController>(
        () => CraftsmanDetailController(submitRatingUseCase: Get.find()));
  }
}
