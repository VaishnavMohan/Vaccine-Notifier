import 'package:flutter/material.dart';

class Toggle extends StatelessWidget {
  Toggle(
      {this.cardchild, this.colour, this.onPress, this.widths, this.heights});
  final Color colour;
  final Widget cardchild;
  final Function onPress;
  final double widths;
  final double heights;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: heights,
        width: widths,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.07),
            child: cardchild),
      ),
    );
  }
}
