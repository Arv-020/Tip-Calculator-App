import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 61,
          child: Image.asset("assets/images/hat.png"),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 50,
          width: 90,
          child: Stack(
            children: [
              Positioned(
                  top: 12,
                  child: Text(
                    "Mr",
                    style: GoogleFonts.asap(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  left: 23,
                  child: Text(
                    "TIP",
                    style: GoogleFonts.asap(
                        fontSize: 30, fontWeight: FontWeight.w900),
                  )),
              Positioned(
                  top: 28,
                  child: Text(
                    "Calculator",
                    style: GoogleFonts.asap(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
