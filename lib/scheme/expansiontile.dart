import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  Tile({this.texts, this.subtexts, this.description});
  final String texts, subtexts, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.grey[300],
          )
        ],
      ),
      child: ExpansionTile(
        title: Text(
          texts,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Color(0XFF1a3f79),
          ),
        ),
        subtitle: Text(
          subtexts,
          style: TextStyle(color: Colors.grey),
        ),
        children: <Widget>[
          ListTile(
            title: Text(description),
          )
        ],
      ),
    );
  }
}
