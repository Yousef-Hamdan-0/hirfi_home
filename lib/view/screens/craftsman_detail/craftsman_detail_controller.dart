import 'package:get/get.dart';
import 'package:hirfi_home/data/model/chat/chat_room.dart';
import 'package:hirfi_home/data/repositroy/chat/chat_room_repo.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/view/screens/craftsman_detail/ext/submit_craftsman_rating.dart';

class CraftsmanDetailController extends GetxController {
  final SubmitCraftsmanRating submitRatingUseCase;

  CraftsmanDetailController({required this.submitRatingUseCase});

  RxInt userRating = 0.obs;

  final _repo = ChatRoomRepository();

  Future<ChatRoom> createOrGetChatRoom(String userId, String craftsmanId) {
    return _repo.createOrGetChatRoom(userId, craftsmanId);
  }

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
