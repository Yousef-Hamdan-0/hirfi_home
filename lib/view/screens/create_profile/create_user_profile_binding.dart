import 'package:get/get.dart';
import 'package:hirfi_home/data/repositroy/user_auth_repo.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/view/screens/create_profile/create_user_profile_controller.dart';

class CreateUserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupabaseFetchService());
    Get.lazyPut(() => SupabaseSendService());
    Get.lazyPut(() => AuthUserRepository());
    Get.lazyPut(() => UserProfileRepository(
          Get.find<SupabaseFetchService>(),
          Get.find<SupabaseSendService>(),
        ));

    // ثانيًا: تمرير الـ UserProfileRepository إلى CreateProfileController
    Get.lazyPut<CreateUserProfileController>(
        () => CreateUserProfileController(Get.find<UserProfileRepository>()));
  }
}
