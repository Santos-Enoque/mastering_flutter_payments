import 'package:flutter/material.dart';

void changeScreen(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
}

void changeScreenReplacement(BuildContext context, Widget widget){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => widget));
}