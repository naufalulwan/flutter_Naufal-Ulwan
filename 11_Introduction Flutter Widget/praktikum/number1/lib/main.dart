import 'package:flutter/material.dart';
import 'package:number1/page_1/my_app.dart';

void main() => runApp(MyApp());

// Task No.1

// void main() => runApp(MyHome());

// class MyHome extends StatefulWidget {
//   const MyHome({Key? key}) : super(key: key);

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   var time = 'Clock';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Widget Flutter"),
//           backgroundColor: Colors.purple,
//         ),
//         body: Center(
//           child: Text(
//             time,
//             style: const TextStyle(fontSize: 42),
//           ),
//         ),
//       ),
//     );
//   }

//   void startTime() {
//     Timer.periodic(const Duration(seconds: 1), (_) {
//       var now = DateTime.now();
//       var formatedTime =
//           "${now.hour.toString()}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
//       setState(() {
//         time = formatedTime;
//       });
//     });
//   }

//   @override
//   void initState() => startTime();
// }