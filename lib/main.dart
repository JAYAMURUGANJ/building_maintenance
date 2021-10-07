import 'package:flutter/material.dart';
import './view/screen/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timeline',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFf7f7f7)),
      home: const Dashboard(),
    );
  }
}
