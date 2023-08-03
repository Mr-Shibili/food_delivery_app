import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/api_list.dart';
import 'package:food_delivery_app/auth/shared_preference.dart';
import 'package:food_delivery_app/presentation/pages/authentication/auth_page.dart';
import 'package:food_delivery_app/presentation/pages/authentication/otp_verification.dart';
import 'package:http/http.dart' as http;

import '../model/signup_model.dart';

import '../presentation/pages/home/widgets/custom_bottom_navigation.dart';

class AuthGo {
  // Replace with your API endpoint URL

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    //'Authorization': 'Bearer your-token',
  };
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

  // Future showIndicator(context) async {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const Center(child: CircularProgressIndicator());
  //     },
  //   );
  // }

  Future createUser(SignUpModel model, context) async {
    Map<String, String> requestBody = {
      "username": model.username!,
      "email": model.email!,
      "password": model.password!,
      "phone": model.phone!
    };

    try {
      indicator(context);
      http.Response response = await http.post(
        Uri.parse(Api.register),
        headers: headers,
        body: json.encode(requestBody),
      );
      Navigator.pop(context);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpVerification(isForget: false),
            ));
      } else {
        showSnack(context: context, text: 'Invalid', error: false);
      }
    } catch (e) {
      showSnack(context: context, text: e.toString(), error: true);
    }
  }

  Future postOtp(String otp, context) async {
    Map<String, String> requestBody = {
      "otp": otp,
    };
    try {
      indicator(context);
      http.Response response = await http.post(
        Uri.parse(Api.otpEmail),
        headers: headers,
        body: json.encode(requestBody),
      );
      Navigator.pop(context);
      if (response.statusCode == 200) {
        // showSnack(context: context, text: 'Success', error: false);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthPage(),
            ));
      } else {
        showSnack(context: context, text: 'Invalid', error: false);
      }
    } catch (e) {
      showSnack(context: context, text: e.toString(), error: false);
      // Exception occurred during request
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    Map<String, String> requestBody = {
      "username": email,
      "password": password,
    };

    try {
      indicator(context);
      http.Response response = await http.post(
        Uri.parse(Api.signIn),
        headers: headers,
        body: json.encode(requestBody),
      );
      final data = jsonDecode(response.body);
      print(response.body);
      if (context.mounted) {
        Navigator.pop(context);
      }
      if (response.statusCode == 200) {
        // log(data['err']);

        final String token = data['data']['accesstoken'];
        await SharedPriference().setApiToken(token);
        // Request successful
        //await SharedPriference().getApiToken();

        if (context.mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomBottomnavigation(),
              ));
        }
      } else {
        if (context.mounted) {
          showSnack(context: context, text: data['err'], error: true);
        }
      }
    } catch (e) {
      // Navigator.pop(context);
      showSnack(context: context, text: e.toString(), error: true);
    }
  }

  Future<void> signOut() async {
    await SharedPriference().deleteToken();
  }
}
