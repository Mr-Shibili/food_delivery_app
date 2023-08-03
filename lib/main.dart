import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/category_controller.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/profile_controller.dart';
import 'package:food_delivery_app/controller/setting_controller.dart';
import 'package:food_delivery_app/controller/validation.dart';
import 'package:food_delivery_app/firebase_options.dart';
import 'package:food_delivery_app/presentation/pages/authentication/auth_page.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ValidationController()),
    ChangeNotifierProvider(create: (context) => SettingController()),
    ChangeNotifierProvider(create: (context) => ProfileController()),
    ChangeNotifierProvider(create: (context) => LocationController()),
    ChangeNotifierProvider(create: (context) => CategoryController()),
    ChangeNotifierProvider(create: (context) => ProductController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
