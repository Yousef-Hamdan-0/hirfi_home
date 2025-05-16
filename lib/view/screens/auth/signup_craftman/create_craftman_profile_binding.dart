import 'package:get/get.dart';
import 'package:hirfi_home/data/repositroy/craftsman_repo.dart';
import 'package:hirfi_home/data/repositroy/user_auth_repo.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/create_craftman_profile_controller.dart';

class createCraftsmanProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupabaseFetchService());
    Get.lazyPut(() => SupabaseSendService());
    Get.lazyPut(() => AuthUserRepository());
    Get.lazyPut(() => CraftsmanRepository(
          Get.find<SupabaseFetchService>(),
          Get.find<SupabaseSendService>(),
        ));

    Get.lazyPut<createCraftsmanProfileController>(() =>
        createCraftsmanProfileController(Get.find<CraftsmanRepository>()));
  }
}
