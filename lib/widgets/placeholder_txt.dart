import 'package:flutter/material.dart';

class PlaceHolderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("  attributed to an unknown typesetter in \nthe 15th century who is thought to have scrambled parts ", textAlign: TextAlign.center,)
      ],
    );
  }
}
