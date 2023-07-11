import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/shared_preference.dart';

class ValidationController with ChangeNotifier {
  String? token;
  Future<void> verifyToken() async {
    token = await SharedPriference().getApiToken();
    notifyListeners();
  }
}
