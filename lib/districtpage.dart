import 'dart:convert';
import 'package:cowin/model/dist.model.dart';
import 'package:cowin/model/state.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'scheme/textdetail.dart';
import 'scheme/toggle.dart';
import 'scheme/filters.dart';
import 'scheme/heading.dart';
import 'hospital.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'infopage.dart';
import 'scheme/Iconbuttons.dart';

const active = Color(0Xffdc2535);
const inactive = Color(0XFFa4a4ac);

enum States {
  district,
  pincode,
}

class Districtpg extends StatefulWidget {
  @override
  _DistrictpgState createState() => _DistrictpgState();
}

class _DistrictpgState extends State<Districtpg> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    state();
  }

  States selecttoggle = States.district;
  bool isDistrict = true;
  List<bool> isSelected = [false, false];
  List<Stateinfo> statesList = [];
  List<String> distList = [], distList2 = [];
  List<dynamic> states;
  String _myState, _myDistrict;
  int id;
  Future state() async {
    var res = await http.post(
      "http://10.0.2.2:3000/api/v1/listing/getStateList",
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    India response = India.fromJson(jsonDecode(res.body));
    statesList = response.stateinfo;
  }

  Future district() async {
    print("ID::::::::::::::::::::$id");
    setState(() {
      isLoading = true;
    });
    var res2 = await http.post(
        "http://10.0.2.2:3000/api/v1/listing/getDistrictList",
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({"stateId": id}));
    District distresponse = District.fromJson(jsonDecode(res2.body));
    distList = [];
    distresponse.distinfo.forEach((element) {
      distList.add(element.districtName);
    });
    distList2 = distList;
    print("Distlist::::::::::::::::::::$distList");
    setState(() {
      isLoading = false;
    });
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.22,
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Toggle(
                    heights: 30,
                    widths: 240,
                    onPress: () {},
                    colour: inactive,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Row(
                    children: [
                      Toggle(
                        heights: 30,
                        widths: 120,
                        onPress: () {
                          setState(() {
                            selecttoggle = States.district;
                            isDistrict = true;
                          });
                        },
                        colour:
                            selecttoggle == States.district ? active : inactive,
                        cardchild: Textdetail(
                          label: 'DISTRICT',
                          colour: Colors.white,
                        ),
                      ),
                      Toggle(
                        heights: 30,
                        widths: 120,
                        onPress: () {
                          setState(() {
                            selecttoggle = States.pincode;
                            isDistrict = false;
                          });
                        },
                        colour:
                            selecttoggle == States.pincode ? active : inactive,
                        cardchild: Textdetail(
                          label: 'PINCODE',
                          colour: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            isDistrict
                ? Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.grey[100],
                              // color: Colors.grey[100],
                            )
                          ],
                        ),
                        // height: 370,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              // color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                            value: _myState,
                                            iconSize: 30,
                                            icon: (null),
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16,
                                            ),
                                            hint: Text('Select State'),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                _myState = newValue;
                                                _myDistrict = null;
                                                statesList.forEach((element) {
                                                  if (element.stateName ==
                                                      _myState) {
                                                    id = element.stateId;
                                                  }
                                                });
                                                district();
                                                print(_myState);
                                              });
                                            },
                                            items: []
                                            // statesList
                                            //     .map<DropdownMenuItem<String>>(
                                            //         (Stateinfo value) {
                                            //   return DropdownMenuItem<String>(
                                            //     value: value.stateName,
                                            //     child: Text(value.stateName),
                                            //   );
                                            // }).toList(),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isLoading
                                ? CircularProgressIndicator(
                                    // value: 20,
                                    )
                                : Container(),
                            Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              // color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                            value: _myDistrict,
                                            iconSize: 30,
                                            icon: (null),
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16,
                                            ),
                                            hint: Text('Select District'),
                                            onChanged: (String newValue) {
                                              setState(() {
                                                _myDistrict = newValue;
                                              });
                                            },
                                            items: []
                                            // distList2
                                            //     .map<DropdownMenuItem<String>>(
                                            //         (String value) {
                                            //   return DropdownMenuItem<String>(
                                            //     value: value,
                                            //     child: Text(value),
                                            //   );
                                            // }).toList(),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Heads(
                                  labelhead: "Age",
                                ),
                                Row(
                                  children: [
                                    Filters(
                                      labels: "18+",
                                    ),
                                    Filters(
                                      labels: "45+",
                                    ),
                                  ],
                                ),
                                Heads(
                                  labelhead: "Vaccine",
                                ),
                                Row(
                                  children: [
                                    Filters(
                                      labels: "Covishield",
                                    ),
                                    Filters(
                                      labels: "Covaxin",
                                    ),
                                    Filters(
                                      labels: "Sputnik",
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Heads(
                                          labelhead: "Slot Type",
                                        ),
                                        Row(
                                          children: [
                                            Filters(
                                              labels: "Paid",
                                            ),
                                            Filters(
                                              labels: "Free",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Heads(
                                          labelhead: "Dose Selection",
                                        ),
                                        Row(
                                          children: [
                                            Filters(
                                              labels: "Dose 1",
                                            ),
                                            Filters(
                                              labels: "Dose 2",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      // style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Note :',
                                          style: TextStyle(
                                              color: Colors.red[600],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                            text:
                                                ' The Slot availability data displayed in the pincode or district search is provided by the state govt and private hospitals.\n'
                                                ' The total availability slots includes Dose-1 and Dose-2 slots. While we have near real-time data, slot availability changes rapidly as users are eagerly waiting for available slots',
                                            style: TextStyle(
                                                color: Colors.grey[900])),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.015,
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: FlatButton(
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 16),
                            ),
                            color: Colors.black,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Hospitallist()),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.grey[100],
                            )
                          ],
                        ),
                        // height: 370,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              // color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                          iconSize: 30,
                                          icon: (null),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                          hint: Text('Select Pincode'),
                                          onChanged: (String newValue) {
                                            setState(() {});
                                          },
                                          items: [],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Heads(
                                  labelhead: "Age",
                                ),
                                Row(
                                  children: [
                                    Filters(
                                      labels: "18+",
                                    ),
                                    Filters(
                                      labels: "45+",
                                    ),
                                  ],
                                ),
                                Heads(
                                  labelhead: "Vaccine",
                                ),
                                Row(
                                  children: [
                                    Filters(
                                      labels: "Covishield",
                                    ),
                                    Filters(
                                      labels: "Covaxin",
                                    ),
                                    Filters(
                                      labels: "Sputnik",
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Heads(
                                          labelhead: "Slot Type",
                                        ),
                                        Row(
                                          children: [
                                            Filters(
                                              labels: "Paid",
                                            ),
                                            Filters(
                                              labels: "Free",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Heads(
                                          labelhead: "Dose Selection",
                                        ),
                                        Row(
                                          children: [
                                            Filters(
                                              labels: "Dose 1",
                                            ),
                                            Filters(
                                              labels: "Dose 2",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      // style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Note :',
                                          style: TextStyle(
                                              color: Colors.red[600],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                            text:
                                                ' The Slot availability data displayed in the pincode or district search is provided by the state govt and private hospitals.\n'
                                                ' The total availability slots includes Dose-1 and Dose-2 slots. While we have near real-time data, slot availability changes rapidly as users are eagerly waiting for available slots',
                                            style: TextStyle(
                                                color: Colors.grey[900])),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: FlatButton(
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 16),
                            ),
                            color: Colors.black,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Hospitallist()),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
