import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/forgot_password.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
     
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'LOG IN',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Stack(
        children: [
        
          Positioned.fill(
            child: Image.asset(
              'assets/images/quiz.jpg', 
              fit: BoxFit.cover,
            ),
          ),
         
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      filled: true,
                    fillColor: Colors.blue,
                      
                      ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      filled: true,
                    fillColor: Colors.blue,
                      ),
                ),
              ),
              SizedBox(height: 55),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    
                  ),
                  onPressed: _signIn,
                  child: Text('Log in', style: TextStyle(fontSize: 18,color: Colors.black)),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(fontSize: 18, color:Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signup())); 
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}