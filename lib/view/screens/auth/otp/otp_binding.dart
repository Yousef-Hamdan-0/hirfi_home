import 'package:get/get.dart';
import 'package:hirfi_home/data/repositroy/user_auth_repo.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController(Get.find(), Get.find()));
    Get.lazyPut(() => AuthUserRepository());
    
    Get.lazyPut(() =>
        UserProfileRepository(SupabaseFetchService(), SupabaseSendService()));
  }
}
