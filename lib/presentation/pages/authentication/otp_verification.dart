import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_go.dart';
import 'package:food_delivery_app/presentation/pages/authentication/auth_page.dart';
import 'package:food_delivery_app/presentation/pages/authentication/create_a%20_new_password.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/otp_box.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:iconsax/iconsax.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key, required this.isForget});
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  String? otp;
  final bool isForget;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Iconsax.back_square,
            color: kggreencolor,
          ),
        ),
        title: Text(
          'Otp verification',
          style: mainHead.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
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
                        onPress: () async {
                          otp = _fieldOne.text +
                              _fieldTwo.text +
                              _fieldThree.text +
                              _fieldFour.text +
                              _fieldFive.text +
                              _fieldSix.text;
                          if (isForget == true) {
                            await AuthGo().postOtp(otp!, context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewPassword()));
                          } else if (isForget == false) {
                            await AuthGo().postOtp(otp!, context);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AuthPage()));
                          }
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
