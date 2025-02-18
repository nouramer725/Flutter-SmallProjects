import 'package:chat/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

var PrimaryColor = HexColor("2B475E");

class Register extends StatefulWidget {
  Register({super.key});
  static String id = 'registerPage';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  String? phone;

  bool isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
                        style: GoogleFonts.pacifico(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Enter your Name",
                      hintStyle: TextStyle(color: Colors.white30),
                      prefixIcon: Icon(Icons.person),
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
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Enter your Phone Number",
                      hintStyle: TextStyle(color: Colors.white30),
                      prefixIcon: Icon(Icons.phone),
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
                  TextFormField(
                    controller: passwordController,
                    onChanged: (data) {
                      password = data;
                    },
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
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
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: confirmPasswordController,
                    onChanged: (data) {
                      confirmPassword = data;
                    },
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Confirm your Password",
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
                  GestureDetector(
                    onTap: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          var auth = FirebaseAuth.instance;
                          UserCredential user = await auth.createUserWithEmailAndPassword(
                              email: email!, password: password!);

                          await user.user?.updateDisplayName(name);

                          // Show successful registration SnackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Registration Successful'),
                              backgroundColor: Colors.green,
                            ),
                          );

                          // Navigate to Login page
                          Navigator.pushReplacementNamed(context, 'LoginPage');
                        } catch (e) {
                          print(e); // Log error
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
                          "Sign Up",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
