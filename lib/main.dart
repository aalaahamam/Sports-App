import 'dart:math';

import 'package:flutter/material.dart';
import 'package:last/screens/Homepage.dart';
import 'package:last/screens/login.dart';
import 'package:last/screens/onBoarding.dart';
import 'package:last/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

  
      home: Homepage(),
    );
  }
}

