import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hicham/screens/User.dart';

// ignore: camel_case_types
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// ignore: camel_case_types
class _LoginScreenState extends State<LoginScreen> {
  bool ispasswordvisible = true;
  final _formKey = GlobalKey<FormState>();
   User user = User("", "");
  String url = "http://192.168.1.7:8080/login"; // Adjust the URL as per your Spring Boot backend

  Future<void> loginUser() async {
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': user.email, 'password': user.password}),
    );
    if (response.statusCode == 200) {
      // Successfully logged in
      // You can handle the response here, e.g., navigate to the next screen
      print('Login successful');
  
      // Navigate to the next screen
      // Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Login failed
      print('Login failed');
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed. Please try again.'),
        duration: Duration(seconds: 3),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.175),
                color: Colors.white,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: const Image(
                          image: AssetImage('images/logo.png'),
                          width: 120,
                        )),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.height * 0.03),
                      child: TextFormField(
                        controller: TextEditingController(text: user.email),
                        onChanged: (val) {
                          user.email = val;
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Email is Empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins_Light',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            hintText: 'example@gamil.com',
                            hintStyle: const TextStyle(
                              fontFamily: 'Poppins_Light',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            )),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.height * 0.03),
                      child: TextFormField(
                        controller: TextEditingController(text: user.password),
                        onChanged: (val) {
                          user.password = val;
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Password is Empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                                icon:
                                    // ignore: dead_code
                                    ispasswordvisible
                                        ? const Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          )
                                        // ignore: dead_code
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          ),
                                onPressed: () => setState(
                                      () => ispasswordvisible =
                                          !ispasswordvisible,
                                    )),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins_Light',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            )),
                        obscureText: ispasswordvisible,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            loginUser();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('images/facebook.png'),
                          width: 25,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.height * 0.015),
                        const Image(
                          image: AssetImage('images/google.png'),
                          width: 25,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.height * 0.015),
                        const Image(
                          image: AssetImage('images/linkedin.png'),
                          width: 25,
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'I don\'t have an Account ?',
                          style: TextStyle(
                              fontFamily: 'Poppins_light',
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'SignupScreen');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
