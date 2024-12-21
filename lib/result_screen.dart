import 'package:flutter/material.dart';

import 'package:quiz_app/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  ResultScreen({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage score
    double percentage = (score / total) * 100;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/quiz.jpg'), // Set your image path here
            fit: BoxFit.cover, // Ensures the image covers the screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
              SizedBox(height: 20),

              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 200, 
                    height: 200,
                    child: CircularProgressIndicator(
                      value: percentage / 100, 
                      strokeWidth: 20, 
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  Text(
                    '${percentage.toStringAsFixed(1)}%', 
                    style: TextStyle(
                      fontSize: 50, 
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(
                'Score: $score / $total',
                style: TextStyle(
                  fontSize: 24, 
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),

             
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('Restart',style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.blue, 
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}