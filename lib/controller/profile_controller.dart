import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/get_user.dart';
import 'package:food_delivery_app/model/edit_profile_model.dart';
import 'package:food_delivery_app/model/user_model.dart';

class ProfileController with ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController birthday = TextEditingController();
  String? image;
  UserModel? user;
  // ProfileController() {
  //   getUser();
  // }
  List<String> gender = ['Male', "Female", 'Others'];
  String? selectedVal;
  void dropDown(value) {
    selectedVal = value;
    notifyListeners();
  }

  Future<void> getUser() async {
    user = await GetUser().getUserDetails();
    if (user == null) {
      log('usernull');
    } else {
      name.text = user!.username!;
      mobile.text = user!.phone!;
      email.text = user!.email!;
      image = user!.profile;
      birthday.text = user!.dateofbirth ?? '';
      selectedVal = user!.gender;
    }

    notifyListeners();
  }

  Future<void> edit(context) async {
    final data = EditProfileModel(
        username: name.text, dateofbirth: birthday.text, gender: selectedVal);
    await GetUser().editProfile(data, context);
    notifyListeners();
  }
}
