import 'package:get/get.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/view/screens/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
        () => ProfileController(Get.find<UserProfileRepository>()));
  }
}
