import 'package:cowin/districtpage.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otppage extends StatefulWidget {
  @override
  _OtppageState createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Container(
              width: 170,
              child: Image.asset('images/logo.png'),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              // border: BoxBorder(),
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 7,
                    spreadRadius: 5,
                    // offset: Offset(15, 15),
                    color: Colors.grey.withOpacity(0.1)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'OTP Verification',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter OTP sent to 123456789",
                        style: TextStyle(
                          // fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                  child: PinCodeTextField(
                                appContext: context,
                                keyboardType: TextInputType.number,
                                //controller: otpController,
                                // autoDismissKeyboard: false,
                                autoFocus: true,
                                length: 4,
                                // obscureText: false,
                                cursorColor: Color(0xffE9E9E9),
                                // animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.underline,
                                    // borderRadius: BorderRadius.circular(5),
                                    // fieldHeight: 50,
                                    // fieldWidth: 50,
                                    activeFillColor: Color(0xffE9E9E9),
                                    activeColor: Color(0xffE9E9E9),
                                    inactiveColor: Color(0xffE9E9E9),
                                    inactiveFillColor: Color(0xffE9E9E9),
                                    selectedFillColor: Color(0xffE9E9E9),
                                    selectedColor: Color(0xffE9E9E9),
                                    disabledColor: Color(0xffE9E9E9)

                                    //       ),
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                // animationDuration:
                                //     Duration(milliseconds: 300),
                                // backgroundColor: Colors.blue,
                                //enableActiveFill: true,
                                // errorAnimationController: errorController,
                                // controller: textEditingController,
                                onCompleted: (v) {
                                  // Get.off(HomeScreen(),binding: HomeBindings());
                                },
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    // currentText = value;
                                  });
                                },
                                // beforeTextPaste: (text) {
                                //   print("Allowing to paste $text");
                                //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                //   return true;
                                // },
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height * 0.1),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Districtpg()),
                          );
                        },
                        child: Text('Resend OTP'),
                        style: TextButton.styleFrom(
                            primary: Color(0XFFfc3737),
                            backgroundColor: Color(0XFFfcd4d4),
                            padding: EdgeInsets.only(
                                top: 15, bottom: 15, left: 20, right: 20),
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
