import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/change_password/phone_number_for_otp/enter_phone_number_controller.dart';

class EnterPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterPhoneNumberController>(() => EnterPhoneNumberController());
  }
}
