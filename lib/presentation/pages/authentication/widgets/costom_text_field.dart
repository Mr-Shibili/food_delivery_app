import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hint,
    this.controller,
    required this.inputType,
  });
  final String? hint;
  final TextEditingController? controller;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          hintText: hint,
          contentPadding: const EdgeInsets.all(9),
          hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 14),
          filled: true,
          fillColor: Colors.green[50]),
    );
  }
}
