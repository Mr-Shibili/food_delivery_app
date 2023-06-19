import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/presentation/pages/authentication/create_a%20_new_password.dart';
import 'package:food_delivery_app/presentation/pages/authentication/log_in.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/otp_box.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  String? otp;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                khight60,
                Image(
                  image: const AssetImage(
                      'asset/images/6280dfc03bae752635c12c7c_7O2gbVXRo3mCJPGwZb7gXWQBiOFdI5M2o2SeQHMWLRGroq5lsnfXvAd9Fz0QM2IX1CBLR2vAaPzZvtY4DypkJB3co_sgUdjOsqm9wSYhfuVbzMsF9456_20dJ5iKI3iqakBl3JRBZTDn2BZ_Yw-removebg-preview.png'),
                  height: size.height / 2.5,
                ),
                khight40,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OtpBox(
                          controller: _fieldOne,
                          focus: true,
                        ),
                        OtpBox(
                          controller: _fieldTwo,
                          focus: false,
                        ),
                        OtpBox(
                          controller: _fieldThree,
                          focus: false,
                        ),
                        OtpBox(
                          controller: _fieldFour,
                          focus: false,
                        ),
                        OtpBox(
                          controller: _fieldFive,
                          focus: false,
                        ),
                        OtpBox(
                          controller: _fieldSix,
                          focus: false,
                        ),
                      ],
                    ),
                    khight40,
                    GreenButton(
                        text: 'Verify',
                        onPress: () {
                          otp = _fieldOne.text +
                              _fieldTwo.text +
                              _fieldThree.text +
                              _fieldFour.text +
                              _fieldFive.text +
                              _fieldSix.text;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogInScreen(),
                              ));
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
