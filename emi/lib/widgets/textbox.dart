import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  late String label;
  late IconData iconData;
  late TextEditingController tc;
  late Function fn;

  setFunction(Function fn) {
    this.fn = fn;
  }

  TextBox(
      {required String label,
      required IconData iconData,
      required TextEditingController tc}) {
    this.label = label;
    this.iconData = iconData;
    this.tc = tc;
  }
  //TextBox(this.label, this.iconData, this.tc, this.fn);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          if (this.fn != null) {
            fn(int.parse(value));
          }
        },
        controller: tc,
        decoration: InputDecoration(
          
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text(
              label,
              style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
            ),
            hintText: 'Type $label'),
      ),
    );
  }
}
