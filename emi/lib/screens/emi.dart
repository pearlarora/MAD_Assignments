import 'package:emi/widgets/chart.dart';
import 'package:emi/widgets/slider.dart';

import '../widgets/textbox.dart';
import 'package:flutter/material.dart';

class Emi extends StatefulWidget {
  const Emi({Key? key}) : super(key: key);

  @override
  _EmiState createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  int _value = 1; // with in dart file
  double total_interest = 0;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  double emi = 0.0;
  int loanAmount = 0;
  double total = 0;

  takeSliderValue(int value) {
    _value = value; // Scope Increase
    t3.text = _value.toString();
    setState(() {});
  }

  _compute() {
    loanAmount = int.parse(t1.text);
    int roi = int.parse(t2.text);
    int tenure = int.parse(t3.text);
    total_interest =
        double.parse((loanAmount * roi * tenure / 100).toStringAsFixed(2));
    total = loanAmount.toDouble() + total_interest.toDouble();

    emi = double.parse((total / (12 * tenure)).toStringAsFixed(2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextBox tb =
        TextBox(label: 'Tenure', iconData: Icons.timer_rounded, tc: t3);
    tb.setFunction(takeSliderValue);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextBox(label: 'Loan Amount', iconData: Icons.money, tc: t1),
            TextBox(label: 'ROI', iconData: Icons.monetization_on, tc: t2),
            tb,
            MySlider(takeSliderValue, _value),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrangeAccent)),
                onPressed: () {
                  _compute();
                },
                child: Text(
                  'Compute',
                  style: TextStyle(fontSize: 30),
                )),
            Text(
              'EMI \u{20B9} $emi',
              style: TextStyle(fontSize: 30),
            ),
            Chart(a: loanAmount, b: total_interest.toInt()),
            SizedBox(
              height: 10,
            ),
            Text(
              'Loan EMI = \u{20B9} $emi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text('Total Interest Payable = \u{20B9} $total_interest',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Total Amount Payable = \u{20B9} $total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            // Pass Fn as an Argument to the Constructor
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Emi Calculator'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
