import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/auth/signup_user/signup_user_controller.dart';

class SignupUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupUserController>(() => SignupUserController());
  }
}
