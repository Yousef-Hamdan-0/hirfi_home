import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
