import 'package:flutter/material.dart';
import 'scheme/textdetail.dart';
import 'scheme/toggle.dart';
import 'scheme/expansiontile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'scheme/days.dart';
import 'scheme/Iconbuttons.dart';

const active = Colors.white;
const inactive = Color(0XFFe4e4e4);

enum Days { today, tommarow, week }

class Hospitallist extends StatefulWidget {
  @override
  _HospitallistState createState() => _HospitallistState();
}

class _HospitallistState extends State<Hospitallist> {
  Days selecttoggle = Days.today;

  Widget condition() {
    if (selecttoggle == Days.today) {
      return Today();
    } else if (selecttoggle == Days.tommarow) {
      return Tommarow();
    } else if (selecttoggle == Days.week) {
      return Thisweek();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Appbarcontent(),
        backgroundColor: Colors.black,
        actions: [
          Infoicon(),
          Translateicon(),
          Notificationicon(),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.09,
                        vertical: MediaQuery.of(context).size.height * 0.042,
                      ),
                      child: Toggle(
                        heights: 40,
                        // widths: MediaQuery.of(context).size.width,
                        onPress: () {},
                        colour: inactive,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                    horizontal: MediaQuery.of(context).size.width * 0.11,
                  ),
                  child: Row(
                    children: [
                      Toggle(
                        // heights: 30,
                        // widths: 70,
                        onPress: () {
                          setState(() {
                            selecttoggle = Days.today;
                          });
                        },
                        colour: selecttoggle == Days.today ? active : inactive,
                        cardchild: Textdetail(
                          label: 'Today',
                          colour: Color(0XFF1a3f79),
                          sizes: 10,
                        ),
                      ),
                      Toggle(
                        heights: 30,
                        // widths: 100,
                        onPress: () {
                          setState(() {
                            selecttoggle = Days.tommarow;
                          });
                        },
                        colour:
                            selecttoggle == Days.tommarow ? active : inactive,
                        cardchild: Textdetail(
                          label: 'Tommarow',
                          sizes: 10,
                          colour: Color(0XFF1a3f79),
                        ),
                      ),
                      Toggle(
                        heights: 30,
                        // widths: 100,
                        onPress: () {
                          setState(() {
                            selecttoggle = Days.week;
                          });
                        },
                        colour: selecttoggle == Days.week ? active : inactive,
                        cardchild: Textdetail(
                          label: 'This Week',
                          sizes: 10,
                          colour: Color(0XFF1a3f79),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            condition()
          ],
        ),
      ),
    );
  }
}
