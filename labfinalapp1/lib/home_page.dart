import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text('Hello, $user!'),
      ),
    );
  }
}