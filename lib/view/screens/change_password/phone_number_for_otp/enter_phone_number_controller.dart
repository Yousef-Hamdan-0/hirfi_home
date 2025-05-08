import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterPhoneNumberController extends GetxController{
  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
}