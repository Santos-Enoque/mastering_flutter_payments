import 'package:flutter/material.dart';
import 'package:mastering_payments/services/styles.dart';

import 'custom_text.dart';

class RoundBtn extends StatelessWidget {
  final String msg;
  final Function function;


  RoundBtn({this.function, this.msg,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:20, bottom: 20),
              child: CustomText(msg: msg, color: white,),
            )
          ],
        ),
      ),
    );
  }
}
