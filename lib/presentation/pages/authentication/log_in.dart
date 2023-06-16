import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Image(
                  image: const AssetImage('asset/Mobile login-bro.png'),
                  height: size.height / 2.5,
                ),
              ),
              const CustomTextfield(
                hint: "Email ID",
              ),
              khight,
              const CustomTextfield(
                hint: "Password",
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(color: Colors.amber),
                  )),
              khight,
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: const Text('Log In'))),
              khight,
              const Center(child: Text('Or, Sign in with')),
              Row(
                children: [Text('data')],
              )
            ],
          ),
        ),
      )),
    );
  }
}
