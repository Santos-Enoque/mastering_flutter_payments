import 'package:flutter/material.dart';
import 'package:mastering_payments/services/styles.dart';

class RoundTextField extends StatelessWidget {
  final String hint;


  RoundTextField(this.hint);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: black, fontSize: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
    );
  }
}
