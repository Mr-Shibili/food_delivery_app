import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/log_in.dart';
import 'package:food_delivery_app/presentation/pages/authentication/signup_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LogInScreen(
        onTap: togglePage,
      );
    } else {
      return SignUpScreen(
        onTap: togglePage,
      );
    }
  }
}
