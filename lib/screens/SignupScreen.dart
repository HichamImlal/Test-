import 'dart:convert';
import 'package:hicham/screens/User.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPasswordVisible = true;
  User user = User("", "");
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signupUser() async {
    var url = Uri.parse("http://192.168.1.116:8080/register");
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': user.email,
        'password': user.password,
      }),
    );

    if (response.statusCode == 200) {
      // Signup successful
      print('Signup successful');
    } else {
      // Signup failed
      print('Signup failed');
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
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.16),
                color: Colors.white,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                      child: const Image(image: AssetImage('images/logo.png'),width: 120,)),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.03),
                      child: TextFormField(
                        controller: usernameController,
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
                            Icons.person,
                            color: Colors.black,
                          ),
                          labelText: 'Username',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins_Light',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.03),
                      child: TextFormField(
                        controller: TextEditingController(text: user.email),
                        onChanged: (val) {
                          user.email = val;
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'email is Empty';
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
                          hintText: 'example@gmail.com',
                          hintStyle: const TextStyle(
                            fontFamily: 'Poppins_Light',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.03),
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
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins_Light',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        obscureText: isPasswordVisible,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75),
                      child: GestureDetector(
                        onTap: () {
                          signupUser;
                          print("taped");
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
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
                        SizedBox(width: MediaQuery.of(context).size.height * 0.015),
                        const Image(
                          image: AssetImage('images/google.png'),
                          width: 25,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.height * 0.015),
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
                          'Do have an Account ?',
                          style: TextStyle(
                            fontFamily: 'Poppins_light',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.height * 0.01),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, 'LoginScreen');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
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
