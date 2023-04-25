import 'package:flutter/material.dart';

class ForGotPasswordScreen extends StatefulWidget {
  static const String routeName = "/ForGotPasswordScreen";

  const ForGotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForGotPasswordScreen> createState() => _ForGotPasswordScreenState();
}

class _ForGotPasswordScreenState extends State<ForGotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("FORGOTPASSWORD SCREEN"),
    );
  }
}
