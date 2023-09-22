import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.prefixIcon,
      this.suffixIcon,
      this.function,
      required this.controller,
      this.onChanged});

  final TextEditingController controller;
  final IconData prefixIcon;

  IconData? suffixIcon;
  VoidCallback? function;
  void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        constraints: const BoxConstraints(
          maxHeight: 60,
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black,
        ),
        suffixIcon: GestureDetector(
          onTap: function,
          child: Icon(
            suffixIcon,
            color: Colors.black,
          ),
        ),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
      ),
      onTapOutside: ((event) {
        FocusManager.instance.primaryFocus?.unfocus();
      }),
    );
  }
}
