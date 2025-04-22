import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/onbording/onbording_controller.dart';

class OnbordingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnbordingController>(() => OnbordingController());
  }
}
