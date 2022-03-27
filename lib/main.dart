import 'package:cowin/Homepg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cowin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepg(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class ABC extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ListTile(
//             title: Text('A'),
//           ),
//           ListTile(
//             title: Text('B'),
//           ),
//           ListTile(
//             title: Text('C'),
//           )
//         ],
//       ),
//     );
//   }
// }
