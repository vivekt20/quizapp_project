
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/login_page.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          
          if (snapshot.hasData) {
            return HomeScreen();  
          }
          else{
            return LoginPage();
          }

        }
        return CircularProgressIndicator();  
      },
    );
  }
}