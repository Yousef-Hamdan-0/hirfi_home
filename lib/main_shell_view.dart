import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/controller/navigation_controller/navigation_controller.dart';
import 'package:hirfi_home/util/app_icon.dart';

class MainShellView extends GetView<NavigationController> {
  const MainShellView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.pages[controller.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: IconNavigationBar(
                    value: 0,
                    iconWithOn: Image.asset(AppIcon.homeOn),
                    iconWithOff: Image.asset(AppIcon.homeOff),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: IconNavigationBar(
                      value: 1,
                      iconWithOn: Image.asset(AppIcon.mapsIconOn),
                      iconWithOff: Image.asset(AppIcon.mapsIconOff)),
                  label: ''),
              BottomNavigationBarItem(
                  icon: IconNavigationBar(
                    value: 2,
                    iconWithOn: Image.asset(AppIcon.chatIconOn),
                    iconWithOff: Image.asset(AppIcon.chatIconOff),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: IconNavigationBar(
                    value: 3,
                    iconWithOn: Image.asset(AppIcon.profileIconOn),
                    iconWithOff: Image.asset(AppIcon.profileIconOff),
                  ),
                  label: ''),
            ],
          ),
        ));
  }
}

class IconNavigationBar extends GetView<NavigationController> {
  const IconNavigationBar({
    super.key,
    required this.value,
    required this.iconWithOn,
    required this.iconWithOff,
  });
  final int value;
  final Image iconWithOn;
  final Image iconWithOff;

  @override
  Widget build(BuildContext context) {
    return controller.selectedIndex.value == value
        ? Container(
            width: MediaQuery.sizeOf(context).width * 0.12,
            height: MediaQuery.sizeOf(context).width * 0.12,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff000000).withOpacity(0.1)),
            child: Center(
              child: iconWithOn,
            ),
          )
        : iconWithOff;
  }
}
