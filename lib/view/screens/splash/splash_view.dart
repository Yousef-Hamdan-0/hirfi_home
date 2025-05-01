import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/view/screens/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.almostBlack,
        body: Obx(
          () => Stack(
            children: [
              // التحكم بحركة حرف "H"
              AnimatedPositioned(
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                top: screenH / 2 - 60,
                left: controller.moveH.value
                    ? screenW / 2 - 78 // ← يتحرك لليسار قليلاً
                    : screenW / 2 - 35, // ← منتصف الشاشة بدقة
                child: Image.asset(
                  ImagesAssets.hInLogo,
                  width: 70,
                ),
              ),

              // Control the "irfi" part
              Positioned(
                top: screenH / 2 - 16,
                left: screenW / 2 - 48 + 22,
                child: ClipRect(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    width: 100,
                    height: 60,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          left: controller.showIrfi.value ? 0 : -130,
                          top: 0,
                          child: Image.asset(
                            ImagesAssets.irfiInLogo,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Control the "home" part
              Positioned(
                top: screenH / 2 + 30,
                left: screenW / 2 - 16,
                child: ClipRect(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 800),
                    width: 100,
                    height: 60,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 1200),
                          curve: Curves.easeInOut,
                          top: controller.moveHomeDown.value ? 0 : -60,
                          left: 0,
                          child: Image.asset(
                            ImagesAssets.homeInLogo,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
