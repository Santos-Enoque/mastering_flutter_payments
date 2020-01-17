import 'package:flutter/material.dart';
import 'package:mastering_payments/services/styles.dart';

import 'custom_text.dart';

class RoundBtnGradient extends StatelessWidget {
  final String msg;
  final Function function;
  final Color colorOne;
  final Color colorTwo;
  final double size;



  RoundBtnGradient({this.function, this.msg, this.colorOne, this.colorTwo, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  colorOne,
                  colorTwo
                ])
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:10, bottom: 10),
              child: CustomText(msg: msg, color: white, size: size ?? 24, weight: FontWeight.bold,),
            )
          ],
        ),
      ),
    );
  }
}
