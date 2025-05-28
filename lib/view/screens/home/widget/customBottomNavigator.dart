// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/screens/home/controller/home_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFF3F3F3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 12,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.changeBanner(index);
              onTap(index);
            },
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.buttonsBackground,
            unselectedItemColor: Colors.grey.shade400,
            iconSize: 28,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: List.generate(4, (index) {
              IconData filledIcon;
              IconData outlinedIcon;

              switch (index) {
                case 0:
                  filledIcon = Icons.home;
                  outlinedIcon = Icons.home_outlined;
                  break;
                case 1:
                  filledIcon = Icons.chat;
                  outlinedIcon = Icons.chat_outlined;
                  break;
                case 2:
                  filledIcon = Icons.location_on;
                  outlinedIcon = Icons.location_on_outlined;
                  break;
                case 3:
                default:
                  filledIcon = Icons.person;
                  outlinedIcon = Icons.person_outline;
              }

              bool isSelected = controller.currentIndex.value == index;

              return BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.buttonsBackground.withValues(alpha: 0.15)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(isSelected ? filledIcon : outlinedIcon,
                      color: AppColors.buttonsBackground),
                ),
                label: '',
              );
            }),
          ),
        ),
      ),
    );
  }
}
