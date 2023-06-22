import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth.dart';
import 'package:food_delivery_app/presentation/pages/authentication/forget_password.dart';
import 'package:food_delivery_app/presentation/pages/authentication/signup_screen.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/home_page.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/custom_bottom_navigation.dart';
import 'package:dio/dio.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
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
                hint: "Email ID/User Name",
                controller: emailController,
                inputType: TextInputType.emailAddress,
              ),
              khight20,
              CustomTextfield(
                hint: "Password",
                controller: passwordController,
                inputType: TextInputType.visiblePassword,
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPassword(),
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
                onPress: () {
                  Auth().signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context);

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => CustomBottomnavigation(),
                  //     ));
                },
              ),
              khight20,
              const Text('Or, Sign in with'),
              khight,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Squaretile(
                    path:
                        'asset/images/24683-2-facebook-logo-photos_400x400.png',
                  ),
                  Squaretile(
                      path:
                          "asset/images/apple-logo-png-dallas-shootings-don-add-are-speech-zones-used-4.png"),
                  Squaretile(path: "asset/images/GOOG-0ed88f7c.png"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New to here!'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.orange),
                      )),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
