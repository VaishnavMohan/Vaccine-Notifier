import 'package:flutter/material.dart';
import 'scheme/expansiontile.dart';
import 'scheme/Iconbuttons.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Appbarcontent(),
        backgroundColor: Colors.black,
        actions: [
          Translateicon(),
          Notificationicon(),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'FAQs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Tile(
              texts: "Lorem Epsum",
              subtexts: "",
              description: "Description",
            ),
            Tile(
              texts: "Lorem Epsum",
              subtexts: "",
              description: "Description 2",
            ),
          ],
        ),
      ),
    );
  }
}
