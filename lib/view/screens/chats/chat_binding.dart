import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/chats/chat_controller.dart';

class ChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatsController>(() => ChatsController());
  }
}
