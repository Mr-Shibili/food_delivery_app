import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

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
                image: const AssetImage('asset/images/newpass.png'),
                height: size.height / 2.5,
              ),
              Text(
                'Create a new password',
                style: mainHead,
              ),
              khight40,
              const CustomTextfield(
                hint: 'New Password',
                inputType: TextInputType.visiblePassword,
              ),
              khight20,
              const CustomTextfield(
                  hint: 'Confirm Password',
                  inputType: TextInputType.visiblePassword),
              khight40,
              GreenButton(text: 'Done', onPress: () {})
            ],
          ),
        ),
      )),
    );
  }
}