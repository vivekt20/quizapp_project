import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/firebase_options.dart';
import 'package:quiz_app/forgot_password.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/login_page.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/sign_up.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup()
    );
  }
}