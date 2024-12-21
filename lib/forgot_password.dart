import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _sendPasswordResetEmail() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      setState(() {
        _isLoading = false;
      });
      
      _showDialog('Password reset email sent! Please check your inbox.');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
      });
      
      _showDialog(e.message ?? 'An error occurred');
    }
  }


  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Notification'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
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
      title: Text("Forgot Password"),
    ),
    body: Stack(
      children: [
        // Background Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/quiz.jpg'), // Your image asset
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Main Content
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'example@example.com',
                  hintStyle: TextStyle(color: Colors.white),
                  errorText: _errorMessage,
                ),
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _sendPasswordResetEmail,
                      
                      child: Text('Reset Password'),
                    ),
            ],
          ),
        ),
      ],
    ),
  );
}
}