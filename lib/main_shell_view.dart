import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/controller/navigation_controller/navigation_controller.dart';

import 'package:hirfi_home/view/screens/home/widget/customBottomNavigator.dart';


class MainShellView extends GetView<NavigationController> {
  final RxInt currentIndex = 0.obs;

  MainShellView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Obx(() => Scaffold(
              body: IndexedStack(
                index: controller.selectedIndex.value,
                children: controller.pages,
              ),
              bottomNavigationBar: CustomBottomNavigationBar(
                onTap: (index) => controller.changePage(index),
              ),
            )));
  }
}
