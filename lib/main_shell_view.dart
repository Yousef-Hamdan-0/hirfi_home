import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/chat/chat_view.dart';
import 'package:hirfi_home/view/screens/home/page/home_view.dart';
import 'package:hirfi_home/view/screens/home/widget/customBottomNavigator.dart';
import 'package:hirfi_home/view/screens/map/maps_view.dart';
import 'package:hirfi_home/view/screens/profile/profile_view.dart';


class MainShellView extends StatelessWidget {
  final RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    HomeView(),
    ChatView(),
    MapsView(),
    ProfileView(),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Obx(() => Scaffold(
          body: IndexedStack(
            index: currentIndex.value,
            children: pages,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            onTap: (index) {
              currentIndex.value = index;
            },
          ),
        )));
  }
}
