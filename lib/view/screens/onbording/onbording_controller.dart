import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnbordingController extends GetxController {
  final PageController pageController = PageController();
  RxBool onLastPage = false.obs;
}
