import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

import '../../../auth/reset_password.dart';

class NewPassword extends StatelessWidget {
  NewPassword({super.key});
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image(
                  image: const AssetImage('asset/images/newpass.png'),
                  height: size.height / 2.5,
                ),
                const Text(
                  'Create a new password',
                  style: mainHead,
                ),
                khight40,
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
                  controller: newPasswordController,
                  password: true,
                  hint: 'New Password',
                  inputType: TextInputType.text,
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
                    controller: rePasswordController,
                    password: true,
                    hint: 'Confirm Password',
                    inputType: TextInputType.text),
                khight40,
                GreenButton(
                    text: 'Done',
                    onPress: () async {
                      if (formKey.currentState!.validate()) {
                        await ResetPassword().setNewPassword(
                            newPasswordController.text.trim(),
                            rePasswordController.text.trim(),
                            context);
                      }
                    })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
