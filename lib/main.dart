
import 'package:flutter/material.dart';
import 'package:hicham/screens/HomeScreen.dart';
import 'package:hicham/screens/LoginScreen.dart';
import 'package:hicham/screens/SignupScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginScreen',
      routes: {
        'LoginScreen':(context) => const LoginScreen(),
        'SignupScreen':(context) => const SignupScreen(),
        'HomeScreen':(context) => const HomeScreen(),
      },
    );
  }
}