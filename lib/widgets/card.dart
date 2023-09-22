import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipCard extends StatelessWidget {
  const TipCard(
      {super.key,
      required this.totalBill,
      required this.totalTip,
      required this.splitAmount});
  final String totalBill;
  final String totalTip;
  final String splitAmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.symmetric(
          //     vertical: BorderSide.none, horizontal: BorderSide.none),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Total p/person",
              style:
                  GoogleFonts.asap(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$",
                  style: GoogleFonts.asap(
                      fontSize: 30, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  width: 1,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    splitAmount.toString(),
                    style: GoogleFonts.asap(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.black,
              // height: 1,
              thickness: 0.2,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Total bill",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\$",
                              style: GoogleFonts.asap(
                                  color: const Color.fromARGB(255, 1, 199, 186),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            Text(
                              totalBill,
                              style: GoogleFonts.asap(
                                color: const Color.fromARGB(255, 1, 199, 186),
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // totalBill.length < 6
                //     ? SizedBox(
                //         width: 130,
                //       )
                //     : SizedBox(
                //         width: 50,
                //       ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Total tip",
                            style: TextStyle(fontSize: 15),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "\$",
                                style: GoogleFonts.asap(
                                    color:
                                        const Color.fromARGB(255, 1, 199, 186),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(
                                width: 1,
                              ),
                              Text(
                                totalTip,
                                style: GoogleFonts.asap(
                                  color: const Color.fromARGB(255, 1, 199, 186),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
