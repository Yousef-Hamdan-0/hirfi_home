import 'package:get/get.dart';
import 'package:hirfi_home/data/repositroy/user_auth_repo.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/view/screens/auth/signup_user/signup_user_controller.dart';

class SignupUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupUserController>(() => SignupUserController());
    Get.put(AuthUserRepository());
    Get.lazyPut(() =>
        UserProfileRepository(SupabaseFetchService(), SupabaseSendService()));
  }
}
