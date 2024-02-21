// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Text(
            'Welcom to home page',
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'Poppins',
              fontSize: 23,
            ), textAlign: TextAlign.center,
          ),
        )
      ]),
    );
  }
}
