import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_go.dart';
import 'package:food_delivery_app/model/signup_model.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key, required this.onTap});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final Function() onTap;
  // final dio = Dio();

  // String endpoint = 'http://65.2.169.235:8000/user/register';

  // void request(requestData) async {
  //   var response;
  //   try {
  //     response = await dio.post(endpoint, data: requestData);
  //     // Handle the response
  //     if (response.statusCode == 200) {
  //       // Successful request
  //       print(response.data);
  //     } else {
  //       // Handle errors
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle exceptions
  //     log('Error: $error');
  //   }
  // }
  final formKey = GlobalKey<FormState>();

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
                  key: formKey,
                  child: Column(children: [
                    CustomTextfield(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          // using regular expression
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter a valid email address";
                          }

                          // the email is valid
                          return null;
                        },
                        password: false,
                        hint: 'Email',
                        controller: emailController,
                        inputType: TextInputType.emailAddress),
                    khight,
                    CustomTextfield(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Username";
                          } else if (value.length < 8) {
                            return 'minimum 8 character';
                          } else {
                            return null;
                          }
                        },
                        password: false,
                        hint: 'User Name',
                        controller: usernameController,
                        inputType: TextInputType.text),
                    khight,
                    CustomTextfield(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Mobile";
                        } else if (value.length < 10 || value.length > 10) {
                          return 'Phone should 10 character';
                        } else {
                          return null;
                        }
                      },
                      password: false,
                      hint: 'Mobile Number',
                      controller: mobileController,
                      inputType: TextInputType.number,
                    ),
                    khight,
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
                        hint: 'Password',
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword),
                    khight,
                    CustomTextfield(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Re-enter password";
                        } else if (value.length < 8) {
                          return 'Minimum 8 charecter';
                        } else {
                          return null;
                        }
                      },
                      password: true,
                      hint: 'Confirm Password',
                      controller: confirmPasswordController,
                      inputType: TextInputType.visiblePassword,
                    ),
                    khight,
                    const Text(
                        'By Clicking "sign in" you certify that you agree with our'),
                    khight,
                    GreenButton(
                        text: 'Sign up',
                        onPress: () async {
                          // if (formKey.currentState!.validate()) {
                          //   Auth().signUp(
                          //       email: emailController.text.trim(),
                          //       password: passwordController.text.trimLeft(),
                          //       context: context,
                          //       rePassword:
                          //           confirmPasswordController.text.trim(),
                          //       mobile: mobileController.text.trim(),
                          //       username: usernameController.text.trim());
                          // }

                          // Map<String, dynamic> requestData = {
                          //   "username": "userafthab1",
                          //   "email": "mohammedafthab15@gmail.com",
                          //   "password": "afthab12345",
                          //   "phone": "97419095"
                          // };

                          // print(requestData);

                          //request(requestData);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => OtpVerification(),
                          //     ));
                          final model = SignUpModel(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              username: usernameController.text.trim(),
                              phone: mobileController.text.trim());
                          if (formKey.currentState!.validate()) {
                            await AuthGo().createUser(model, context);
                          }
                        }),
                    khight,
                    const Text('Joined as before?'),
                    GestureDetector(
                      onTap: onTap,
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    )
                  ]))
            ],
          ),
        ),
      )),
    );
  }
}
