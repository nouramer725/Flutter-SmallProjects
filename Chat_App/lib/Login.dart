import 'package:chat/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Register.dart';

var PrimaryColor = HexColor("2B475E");

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = 'loginPage';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;
  String? password;
  bool isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/images/scholar.png")),
                  Text(
                    "Scholar Chat",
                    style: GoogleFonts.pacifico(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Sign in",
                        style: GoogleFonts.pacifico(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Email Field
                  TextFormField(
                    controller: emailController,
                    onChanged: (data) {
                      email = data;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]").hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Colors.white30),
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Password Field
                  TextFormField(
                    controller: passwordController,
                    onChanged: (data) {
                      password = data;
                    },
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(color: Colors.white30),
                      prefixIcon: Icon(Icons.lock),
                      prefixIconColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Sign In Button
                  GestureDetector(
                    onTap: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          var auth = FirebaseAuth.instance;
                          UserCredential user = await auth.signInWithEmailAndPassword(
                              email: email!, password: password!);

                          // Navigate to Home page upon successful login
                          Navigator.pushReplacementNamed(context,'HomePage',arguments: email );
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('There was an error: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }

                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: double.infinity,
                      height: 45,
                      child: isLoading
                          ? Center(child: CircularProgressIndicator())
                          : const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Sign In Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context,Register.id);
                        },
                        child: const Text(
                          "   Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
