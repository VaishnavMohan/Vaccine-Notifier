import 'package:flutter/material.dart';

class Textdetail extends StatelessWidget {
  Textdetail({this.label, this.colour, this.sizes});
  final String label;
  final Color colour;
  final double sizes;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: colour, fontSize: sizes),
    );
  }
}
