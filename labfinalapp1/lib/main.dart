import 'package:flutter/material.dart';
import 'package:labfinalapp1/login_screen.dart';
import 'package:labfinalapp1/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      title: 'Nigreira Liga',
    );
  }
}







