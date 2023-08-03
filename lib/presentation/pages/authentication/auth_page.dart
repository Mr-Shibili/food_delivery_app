import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/shared_preference.dart';
import 'package:food_delivery_app/presentation/pages/authentication/login_or_register_page.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/custom_bottom_navigation.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SharedPriference().getApiToken(),
        builder: (context, snapshot) {
          //log in

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else if (snapshot.hasData) {
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
