import 'package:flutter/material.dart';
import 'package:mastering_payments/services/styles.dart';

class RectTextInput extends StatelessWidget {
  final String hitText;
  final IconData icon;

  RectTextInput({this.icon, this.hitText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: grey)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: TextField(
          decoration: InputDecoration(
            hintText: hitText,
            icon: Icon(icon),
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}
