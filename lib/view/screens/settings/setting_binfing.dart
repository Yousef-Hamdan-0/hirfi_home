import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/settings/settings_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
