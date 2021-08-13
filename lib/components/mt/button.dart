import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double width;

  MyButton({
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
    );
  }
}
