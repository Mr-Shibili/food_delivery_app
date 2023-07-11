import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/reset_password.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image(
                image: const AssetImage('asset/images/Forgot password-bro.png'),
                height: size.height / 2.5,
              ),
            ),
            khight,
            const Text(
              "Forget Password?",
              style: mainHead,
            ),
            khight,
            const Text(
              'Enter your email address and we will send you a reset instructions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            khight40,
            Form(
              key: formKey,
              child: CustomTextfield(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return null;
                    } else {
                      return "enter valid email";
                    }
                  },
                  password: false,
                  hint: 'Enter email',
                  inputType: TextInputType.emailAddress),
            ),
            khight40,
            GreenButton(
                text: "Send Email",
                onPress: () async {
                  if (formKey.currentState!.validate()) {
                    await ResetPassword()
                        .forgetPass(emailController.text, context);
                  }
                }),
            khight40
          ],
        ),
      )),
    );
  }
}
