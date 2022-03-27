import 'package:flutter/material.dart';

class Heads extends StatelessWidget {
  Heads({this.labelhead});
  final String labelhead;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Text(
        labelhead,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey[700]),
      ),
    );
  }
}
