import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth_go.dart';
import 'package:food_delivery_app/controller/profile_controller.dart';
import 'package:food_delivery_app/model/edit_profile_model.dart';
import 'package:food_delivery_app/model/user_model.dart';
import 'package:food_delivery_app/presentation/pages/authentication/auth_page.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileViewAndEdit extends StatelessWidget {
  ProfileViewAndEdit({super.key});

  final List<String> gender = <String>[
    'Male',
    'Female',
    'Others',
    'Prefer not to disclose'
  ];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          'Edit Profile',
          style: mainHead.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white10,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                AuthGo().signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                    (route) => false);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Consumer<ProfileController>(builder: (context, provider, _) {
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    provider.user!.profile != null
                        ? CircleAvatar(
                            maxRadius: 80,
                            backgroundImage:
                                NetworkImage(provider.user!.profile!))
                        : const CircleAvatar(
                            maxRadius: 80,
                            child: Icon(
                              Icons.person,
                              size: 60,
                            ),
                          ),
                    khight,
                    const Text(
                      'Change photo',
                      style: mediumHead,
                    ),
                    khight20,
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
                        controller: provider.name,
                        password: false,
                        hint: 'Name',
                        inputType: TextInputType.text),
                    khight20,
                    Row(
                      children: [
                        SizedBox(
                          width: 250,
                          child: CustomTextfield(
                              enable: false,
                              controller: provider.mobile,
                              password: false,
                              hint: 'Mobile Number',
                              inputType: TextInputType.number),
                        ),
                        kwidth,
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'CHANGE',
                              style: TextStyle(color: kredcolor),
                            ))
                      ],
                    ),
                    khight20,
                    Row(
                      children: [
                        SizedBox(
                          width: 250,
                          child: CustomTextfield(
                              enable: false,
                              controller: provider.email,
                              password: false,
                              hint: 'Email Id',
                              inputType: TextInputType.text),
                        ),
                        kwidth,
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'CHANGE',
                              style: TextStyle(color: kredcolor),
                            ))
                      ],
                    ),
                    khight20,
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: CustomTextfield(
                              controller: provider.birthday,
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2000),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2010));
                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  provider.birthday.text = formattedDate;
                                  print(formattedDate);
                                } else {
                                  print('errorsss');
                                }
                              },
                              password: false,
                              hint: 'Birthday',
                              inputType: TextInputType.datetime),
                        ),
                        const Spacer(),
                        DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                padding: const EdgeInsets.all(0),
                                elevation: 0,
                                hint: const Text(
                                  'Gender',
                                  style: mediumHead,
                                ),
                                value: provider.selectedVal,
                                icon: const Icon(Icons.arrow_drop_down),
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  provider.dropDown(value);
                                },
                                items: gender.map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    khight20,
                    GreenButton(
                        text: "Upadate Profile",
                        onPress: () {
                          final data = EditProfileModel(
                              username: provider.name.text,
                              dateofbirth: provider.birthday.text,
                              gender: provider.selectedVal);

                          if (formKey.currentState!.validate()) {
                            provider.edit(context);

                            //  GetUser().editProfile(data, context);
                          }
                        })
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
