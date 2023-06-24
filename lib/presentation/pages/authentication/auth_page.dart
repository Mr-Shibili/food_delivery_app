import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/login_or_register_page.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/custom_bottom_navigation.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //log in
          if (snapshot.hasData) {
            return const CustomBottomnavigation();
          }

          //not log in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
