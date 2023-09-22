import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.width,
      required this.child,
      required this.borderRadius,
      required this.function,
      required this.height});
  final double width;
  final double height;
  final Widget child;
  final BorderRadius borderRadius;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: function,
        style: OutlinedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 1, 199, 186),
            fixedSize: Size(width, height),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
              side: BorderSide.none,
            ),
            side: BorderSide.none),
        child: Center(
          child: child,
        ));
  }
}
