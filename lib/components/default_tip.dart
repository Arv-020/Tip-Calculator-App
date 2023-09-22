import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTip extends StatelessWidget {
  const DefaultTip({super.key, required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            number.toString(),
            style: GoogleFonts.asap(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.w900),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                "%",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
