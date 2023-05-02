import 'package:flutter/material.dart';

class textDisplay extends StatelessWidget {
  final String text;
  const textDisplay({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,

      ),
    );
  }
}
