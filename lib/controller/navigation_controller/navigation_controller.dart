
import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/chat/chat_view.dart';
import 'package:hirfi_home/view/screens/home/page/home_view.dart';
import 'package:hirfi_home/view/screens/profile/profile_view.dart';

import '../../view/screens/map/maps_view.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  final pages = [
    HomeView(),
    MapsView(),
    ChatView(),
    ProfileView()
  ];
}
