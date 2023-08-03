import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_go.dart';
import 'package:food_delivery_app/presentation/pages/authentication/forget_password.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

import '../../../auth/auth_services.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key, required this.onTap});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Function() onTap;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('asset/images/Mobile login-bro.png'),
                  height: size.height / 3.5,
                ),
                const Text(
                  "Log In",
                  style: mainHead,
                ),
                khight20,
                CustomTextfield(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Username";
                    } else if (value.length < 8) {
                      return 'Minimum 8 character';
                    } else {
                      return null;
                    }
                  },
                  password: false,
                  hint: "User Name",
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                ),
                khight20,
                CustomTextfield(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    } else if (value.length < 8) {
                      return 'Minimum 8 charecter';
                    } else {
                      return null;
                    }
                  },
                  password: true,
                  hint: "Password",
                  controller: passwordController,
                  inputType: TextInputType.text,
                ),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPassword(),
                              ));
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.orange),
                        )),
                  ],
                ),
                khight,
                GreenButton(
                  text: 'Log In',
                  onPress: () async {
                    // Auth().signInWithEmailAndPassword(
                    //     email: emailController.text,
                    //     password: passwordController.text,
                    //     context: context);
                    if (formKey.currentState!.validate()) {
                      await AuthGo().signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          context: context);
                    }
                  },
                ),
                khight20,
                const Text('Or, Sign in with'),
                khight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Squaretile(
                      path:
                          'asset/images/24683-2-facebook-logo-photos_400x400.png',
                    ),
                    // Squaretile(
                    //     path:
                    //         "asset/images/apple-logo-png-dallas-shootings-don-add-are-speech-zones-used-4.png"),
                    GestureDetector(
                        onTap: () {
                          AuthServices().signInWithGoogle();
                        },
                        child: const Squaretile(
                            path: "asset/images/GOOG-0ed88f7c.png")),
                    const Squaretile(path: "asset/images/sms-icon-5461.png")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New to here!'),
                    TextButton(
                        onPressed: onTap,
                        child: GestureDetector(
                          onTap: onTap,
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.orange),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
