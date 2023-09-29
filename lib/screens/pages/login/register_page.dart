// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    try {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());

        //add user details
        addUserDetails(
            _firstNameController.text.trim(),
            _lastNameController.text.trim(),
            _emailController.text.trim(),
            int.parse(_ageController.text.trim()));
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future addUserDetails(
      String firstName, String lastName, String email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // Icon(
                  //   Icons.computer,
                  //   size: 100,
                  // ),

                  // // ignore: prefer_const_constructors
                  // SizedBox(
                  //   height: 30,
                  // ),

                  //E-Learning

                  Text('Sign Up', style: GoogleFonts.bebasNeue(fontSize: 52)),

                  SizedBox(height: 10),

                  Text(
                    'Register Below',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 50),

                  //first name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //last name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //age name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: _ageController,
                          decoration: InputDecoration(
                            hintText: 'Age',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //email textfield

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //password textfield

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value!.length < 6
                              ? 'Enter min 6 characters'
                              : null,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //confirm password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //signin button

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: signUp,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.green[900],
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  //register button

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Have an Account?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
