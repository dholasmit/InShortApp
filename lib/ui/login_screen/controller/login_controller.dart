import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _checkValue = false;

  bool get checkValue => _checkValue;

  set checkValue(bool value) {
    _checkValue = value;
    update();
  }
}
