import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/api_list.dart';

import 'package:food_delivery_app/presentation/pages/authentication/auth_page.dart';
import '../presentation/pages/authentication/otp_verification.dart';

import 'package:http/http.dart' as http;

class ResetPassword {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    //'Authorization': 'Bearer your-token',
  };

  // void showError(context, String error) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.red,
  //         title: Center(
  //           child: Text(
  //             error,
  //             style: const TextStyle(color: kwhitwcolor),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Future showSuccess(context, String error) async {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.green,
  //         title: Center(
  //           child: Text(
  //             error,
  //             style: const TextStyle(color: kwhitwcolor),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

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

  showIndicator(context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future forgetPass(String email, context) async {
    Map<String, String> requestBody = {
      "email": email,
    };
    try {
      indicator(context);
      http.Response response = await http.post(
        Uri.parse(Api.forgetPassword),
        headers: headers,
        body: json.encode(requestBody),
      );
      Navigator.pop(context);

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OtpVerification(isForget: true),
            ));
      } else {
        showSnack(context: context, text: 'Invalid', error: false);
      }
    } catch (e) {
      showSnack(context: context, text: e.toString(), error: false);
    }
  }

  Future setNewPassword(String password, String email, context) async {
    Map<String, String> requestBody = {"email": email, "password": password};
    try {
      indicator(context);
      http.Response response = await http.post(
        Uri.parse(Api.createNewPassword),
        headers: headers,
        body: json.encode(requestBody),
      );
      Navigator.pop(context);
      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthPage(),
            ),
            (route) => false);
      } else {
        showSnack(context: context, text: 'Invalid', error: true);
      }
    } catch (e) {
      Navigator.pop(context);
      showSnack(context: context, text: e.toString(), error: false);
    }
  }
}
