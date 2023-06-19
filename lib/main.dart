import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/forget_password.dart';
import 'package:food_delivery_app/presentation/pages/authentication/log_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}
