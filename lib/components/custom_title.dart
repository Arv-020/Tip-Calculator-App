import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle(
      {super.key, required this.title, required this.description});
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.asap(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 19, letterSpacing: 0.5),
        ),
      ],
    );
  }
}
