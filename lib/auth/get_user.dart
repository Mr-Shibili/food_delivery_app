import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/shared_preference.dart';
import 'package:food_delivery_app/model/edit_profile_model.dart';
import 'package:food_delivery_app/model/user_model.dart';
import 'package:http/http.dart' as http;

import 'api_list.dart';

class GetUser {
  String? token;

  Future<void> showSnack({context, String? text, bool? error}) async {
    final snackBar = SnackBar(
      backgroundColor: error == true ? Colors.red : Colors.green,
      content: Text(text!),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  indicator(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<UserModel?> getUserDetails() async {
    token = await SharedPriference().getApiToken();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    print(token);

    try {
      //  indicator(context);
      final response = await http.get(
        Uri.parse(Api.getProfile),
        headers: headers,
      );
      log(response.body);
      //Navigator.pop(context);
      if (response.statusCode == 200) {
        final responseBody = response.body;
        log(response.body);
        return UserModel.fromJson(jsonDecode(responseBody));
      } else {
        // showSnack(context: context, text: 'Invalid', error: false);
        log(response.body);
        return null;
      }
    } catch (e) {
      // showSnack(context: context, text: e.toString(), error: false);
      log(e.toString());
      return null;
    }
  }

  Future editProfile(EditProfileModel model, context) async {
    token = await SharedPriference().getApiToken();
    Map<String, String> requestBody = {
      "username": model.username!,
      "dateofbirth": model.dateofbirth!,
      "gender": model.gender!
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      indicator(context);
      http.Response response = await http.put(
        Uri.parse(Api.editProfile),
        headers: headers,
        body: json.encode(requestBody),
      );

      Navigator.pop(context);
      if (response.statusCode == 200) {
        print(response.body);
        showSnack(context: context, text: 'Success', error: false);
      } else {
        showSnack(context: context, text: 'Invalid', error: true);
      }
    } catch (e) {
      Navigator.pop(context);

      showSnack(context: context, text: e.toString(), error: true);
    }
  }
}
