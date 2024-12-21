import 'package:flutter/material.dart';

import 'package:quiz_app/login_page.dart';
import 'package:quiz_app/quiz_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home'),
        automaticallyImplyLeading: false, 
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
        
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
      
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/quiz.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              
              shape: CircleBorder(),
              padding: EdgeInsets.all(50),
              backgroundColor:Colors.blue 
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizScreen()),
              );
            },
            child: Text(
              "Start",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}