import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/chat/chat_controller.dart';


class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
