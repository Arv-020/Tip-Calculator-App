import 'package:flutter/material.dart';
import 'package:tip_calculato/components/custom_button.dart';
import 'package:tip_calculato/widgets/card.dart';
import 'package:tip_calculato/widgets/form.dart';
import 'package:tip_calculato/widgets/logo.dart';
import 'package:tip_calculato/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final billTxt = TextEditingController();
  final tipTxt = TextEditingController();
  String billAmount = "000";
  String totalBill = "000";
  String totalTip = "000";
  String splitAmount = "000";

  bool isPressed = false;
  double tip = 0;
  int tipPerson = 1;

  void onChanged(value) {
    billAmount = value;
    if (value.toString().trim().isEmpty) {
      totalBill = "000";
      totalTip = "000";
      splitAmount = "000";
      tip = 0;
      tipPerson = 1;
      // showPopUp(title: "Blank Bill", content: "Bill amount can'be null");
      setState(() {});
    } else {
      calculate();
    }
  }

  void calculate() {
    if (billTxt.text.toString().trim().isNotEmpty) {
      double bill = double.parse(billTxt.text.toString());

      totalBill = (bill + (bill * (tip / 100))).toString();
      totalTip = (bill * (tip / 100)).toString();
      double tBill = double.parse(totalBill.toString());
      splitAmount = (tBill / tipPerson).toStringAsFixed(2);
      setState(() {});
    }
  }

  void showPopUp({required String title, required String content}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: Text(content, textAlign: TextAlign.center),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.all(5),
          actions: [
            CustomButton(
              width: 50,
              height: 10,
              function: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(5),
              child: const Text(
                "Ok",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      },
    );
  }

  void tipFunction() {
    if (tipTxt.text.trim().isEmpty) {
      showPopUp(title: "Blank Tip", content: "Tip can't be blank");
    } else {
      tip = double.parse(tipTxt.text.toString().trim());
      if (tip < 0) {
        showPopUp(title: "Invalid Tip", content: "Tip can't be less than 0");
      } else {
        if (billTxt.text.toString().trim().isEmpty) {
          showPopUp(title: "Blank Bill", content: "Bill Can't be null");
        } else {
          calculate();
          tipTxt.text = "";
          isPressed = !isPressed;
          setState(() {});
        }
      }
    }
  }

  void splitProcess() {
    if (tipPerson == 1) {
      showPopUp(title: "Invalid Split", content: "Split can't be less than 1");
    } else {
      tipPerson--;
      calculate();
      setState(() {});
    }
  }

  void splitIncrement() {
    tipPerson++;
    calculate();
    setState(() {});
  }

  void removeTextField() {
    isPressed = false;
    setState(() {});
  }

  void click(String tempTip) {
    if (billTxt.text.toString().trim().isEmpty) {
      showPopUp(title: "Blank Bill", content: "Bill can't be Blank");
    } else {
      tip = double.parse(tempTip.toString());
      isPressed = false;
      calculate();
    }
  }

  void changeIsPressed() {
    isPressed = !isPressed;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Logo(),
                const SizedBox(
                  height: 25,
                ),
                TipCard(
                  totalBill: totalBill,
                  totalTip: totalTip,
                  splitAmount: splitAmount,
                ),
                const SizedBox(
                  height: 50,
                ),
                TipForm(
                  onChanged: onChanged,
                  isPressed: isPressed,
                  tipFunction: tipFunction,
                  billTxt: billTxt,
                  tipTxt: tipTxt,
                  tipPerson: tipPerson,
                  spiltIncrement: splitIncrement,
                  spiltDecrement: splitProcess,
                  onClick: click,
                  changeIsPressed: changeIsPressed,
                ),
                // Row(
                //   children: [
                //     Text(tip.toString()),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text(totalBill.toString()),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text(totalTip.toString()),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
