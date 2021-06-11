import 'package:flutter/material.dart';

import 'counter.dart';

void main() {
  runApp(MyApp());
}



// void main(List<String> args) async {
//   Stream<int> stream = boatStream();
//   stream.listen((event) {
//     print("Receievied boat No.$event");
//   });
// }

// Stream<int> boatStream() async* {
//   for (int i = 1; i <= 10; i++) {
//     print("current Boat number sent  :==>>> " + i.toString());
//     await Future.delayed(Duration(seconds: 2));
//     yield i;
//   }
// }
