import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tip_calculato/components/custom_button.dart';
import 'package:tip_calculato/components/custom_title.dart';
import 'package:tip_calculato/components/default_tip.dart';
import 'package:tip_calculato/components/textfield.dart';
import 'package:unicons/unicons.dart';

class TipForm extends StatelessWidget {
  TipForm(
      {super.key,
      required this.billTxt,
      required this.tipTxt,
      required this.isPressed,
      required this.onChanged,
      required this.tipFunction,
      required this.tipPerson,
      required this.spiltIncrement,
      required this.spiltDecrement,
      required this.onClick,
      required this.changeIsPressed});
  final TextEditingController billTxt;
  final TextEditingController tipTxt;
  bool isPressed;
  final void Function(String value) onChanged;
  final VoidCallback tipFunction;
  final VoidCallback spiltIncrement;
  final VoidCallback spiltDecrement;
  final void Function(String value) onClick;
  final VoidCallback changeIsPressed;

  final int tipPerson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CustomTitle(title: "Enter", description: "your bill"),
            const SizedBox(
              width: 30,
            ),
            Flexible(
              child: CustomTextField(
                onChanged: onChanged,
                controller: billTxt,
                prefixIcon: UniconsLine.dollar_alt,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                CustomTitle(title: "Choose", description: "your tip "),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Flexible(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomButton(
                        height: 53,
                        function: () {
                          onClick("10");
                        },
                        width: 72,
                        borderRadius: BorderRadius.circular(8),
                        child: const DefaultTip(
                          number: 10,
                        ),
                      ),
                      CustomButton(
                        function: () {
                          onClick("15");
                        },
                        height: 53,
                        width: 72,
                        borderRadius: BorderRadius.circular(8),
                        child: const DefaultTip(
                          number: 15,
                        ),
                      ),
                      CustomButton(
                        function: () {
                          onClick("20");
                        },
                        height: 53,
                        width: 72,
                        borderRadius: BorderRadius.circular(8),
                        child: const DefaultTip(
                          number: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  isPressed
                      ? CustomTextField(
                          suffixIcon: Icons.done,
                          prefixIcon: UniconsLine.percentage,
                          controller: tipTxt,
                          function: tipFunction,
                        )
                      : CustomButton(
                          function: changeIsPressed,
                          height: 60,
                          width: double.maxFinite,
                          borderRadius: BorderRadius.circular(8),
                          child: Text(
                            "Custom tip",
                            style: GoogleFonts.asap(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1),
                          ))
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const CustomTitle(title: "Split", description: "the total"),
            const SizedBox(
              width: 30,
            ),
            CustomButton(
              function: spiltDecrement,
              height: 53,
              width: 70,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(8),
              ),
              child: const Text(
                "-",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              height: 52,
              width: MediaQuery.sizeOf(context).width * 0.22,
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Text(
                  tipPerson.toString(),
                  style: GoogleFonts.asap(
                      fontWeight: FontWeight.w900, fontSize: 25),
                ),
              ),
            ),
            CustomButton(
              height: 53,
              function: spiltIncrement,
              width: 70,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(8),
              ),
              child: const Text(
                "+",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900),
              ),
            )
          ],
        )
      ],
    );
  }
}
