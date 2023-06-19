import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/create_a%20_new_password.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

import 'otp_verification.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: const AssetImage('asset/images/Forgot password-bro.png'),
                height: size.height / 3.5,
              ),
              const Text(
                'Sign up',
                style: mainHead,
              ),
              khight,
              Form(
                  child: Column(children: [
                CustomTextfield(
                    hint: 'Email',
                    controller: emailController,
                    inputType: TextInputType.emailAddress),
                khight,
                CustomTextfield(
                    hint: 'User Name',
                    controller: usernameController,
                    inputType: TextInputType.text),
                khight,
                CustomTextfield(
                  hint: 'Mobile',
                  controller: mobileController,
                  inputType: TextInputType.number,
                ),
                khight,
                CustomTextfield(
                    hint: 'Password',
                    controller: passwordController,
                    inputType: TextInputType.visiblePassword),
                khight,
                CustomTextfield(
                  hint: 'Confirm Password',
                  controller: confirmPasswordController,
                  inputType: TextInputType.visiblePassword,
                ),
                khight,
                Text(
                    'By Clicking "sign in" you certify that you agree with our'),
                khight,
                GreenButton(
                    text: 'Sign up',
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpVerification(),
                          ));
                    }),
                khight,
                Text('Joined as before?')
              ]))
            ],
          ),
        ),
      )),
    );
  }
}
