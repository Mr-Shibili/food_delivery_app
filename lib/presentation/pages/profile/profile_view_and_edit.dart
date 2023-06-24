import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/auth.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/costom_text_field.dart';
import 'package:food_delivery_app/presentation/pages/authentication/widgets/widgets.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class ProfileViewAndEdit extends StatefulWidget {
  const ProfileViewAndEdit({super.key});

  @override
  State<ProfileViewAndEdit> createState() => _ProfileViewAndEditState();
}

class _ProfileViewAndEditState extends State<ProfileViewAndEdit> {
  List<String> gender = <String>[
    'Male',
    'Female',
    'Others',
    'Prefer not to disclose'
  ];
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Auth().signOut();
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
            child: Column(
              children: [
                const CircleAvatar(
                  maxRadius: 80,
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                khight,
                const Text(
                  'Change photo',
                  style: mainHead,
                ),
                khight20,
                CustomTextfield(
                    password: false,
                    hint: 'Name',
                    inputType: TextInputType.text),
                khight20,
                Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: CustomTextfield(
                          password: false,
                          hint: 'Mobile Number',
                          inputType: TextInputType.number),
                    ),
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
                          password: false,
                          hint: 'Email Id',
                          inputType: TextInputType.text),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'CHANGE',
                          style: TextStyle(color: kredcolor),
                        ))
                  ],
                ),
                khight20,
                CustomTextfield(
                    password: false,
                    hint: 'Birthday',
                    inputType: TextInputType.datetime),
                khight20,
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
                          style: mainHead,
                        ),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        style: const TextStyle(color: Colors.deepPurple),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(
                            () {
                              dropdownValue = value!;
                            },
                          );
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
                khight20,
                GreenButton(text: "Upadate Profile", onPress: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
