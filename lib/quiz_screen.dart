import 'package:flutter/material.dart';
import 'package:quiz_app/result_screen.dart';



class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedOption; 
  bool _answered = false; 

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is Flutter?',
      'options': ['A programming language', 'A framework', 'A database', 'An OS'],
      'answer': 1,
    },
    {
      'question': 'What is pubspec.yaml used for?',
      'options': ['To manage project settings', 'To define app metadata and dependencies ', 'To store user data', 'To define routese'],
      'answer': 1,
    },
    {
      'question': 'What language does Flutter use?',
      'options': ['Java', 'Dart', 'Kotlin', 'Swift'],
      'answer': 1,
    },
    {
      'question': 'What is the purpose of StatefulWidget?',
      'options': ['To manage state within the widget ', 'To display static data', 'To manage API calls', 'To debug the application'],
      'answer': 0,
    },
    {
      'question': 'What is the role of a Scaffold widget?',
      'options': ['State management', 'Provides app structure', 'Navigation', 'Animation'],
      'answer': 1,
    },
    {
      'question': 'What does the hot reload feature do?',
      'options': [
        'Restart the app',
        'Update code without losing state',
        'Clear app cache',
        'Debug the app'
      ],
      'answer': 1,
    },
    {
      'question': 'Which widget is used for displaying images in Flutter?',
      'options': ['Text','image','container','column'],
      'answer': 1,
    },
    {
      'question': 'What is a State in Flutter?',
      'options': [
        'Manages app data that changes over time',
        'Defines app routes',
        'Describes app UI',
        'Handles animations'
      ],
      'answer': 0,
    },
    {
      'question': 'What is setState used for in Flutter?',
      'options': [
        'To fetch data from the API',
        'To modify the state of a StatefulWidget and trigger a rebuild ',
        'To navigate between screens',
        'To handle user input'
      ],
      'answer': 1,
    },
    {
      'question': 'How do you add padding to a widget?',
      'options': [' Using the Padding widget ', 'Using the Container widget', ' Using the AppBar widgetr', 'Using the Scaffold widget'],
      'answer': 0,
    },
  ];

  
  void _selectOption(int selectedOption) {
    setState(() {
      _selectedOption = selectedOption;
      _answered = true; 
    });

    
    if (_selectedOption == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }
  }

  
  void _nextQuestion() {
    setState(() {
      _answered = false; 
      _selectedOption = null; 
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex == _questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: _score, total: _questions.length),
        ),
      );
    }
  }

  @override
Widget build(BuildContext context) {
  bool isLastQuestion = _currentQuestionIndex == _questions.length - 1;

  return Scaffold(
    appBar: AppBar(
      title: Text('Flutter Quiz'),
      backgroundColor: Colors.blue,
    ),
    body: Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            'assets/images/quiz.jpg', // Replace with the path to your image
            fit: BoxFit.cover,
          ),
        ),

        // Quiz content
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _questions[_currentQuestionIndex]['question'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
              SizedBox(height: 20),

              ..._questions[_currentQuestionIndex]['options']
                  .asMap()
                  .entries
                  .map(
                    (entry) {
                      int index = entry.key;
                      String option = entry.value;

                      bool isCorrect = index == _questions[_currentQuestionIndex]['answer'];
                      bool isSelected = index == _selectedOption;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          
                          style: ElevatedButton.styleFrom(
                            
                            backgroundColor: isSelected
                                ? (isCorrect ? Colors.green : const Color.fromARGB(255, 97, 179, 226))
                                : Colors.blue,
                            foregroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: _answered
                              ? null
                              : () => _selectOption(index),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isSelected)
                                Icon(
                                  isCorrect ? Icons.check : Icons.close,
                                  color: isCorrect ? Colors.green : const Color.fromARGB(255, 228, 27, 13),
                                ),
                              SizedBox(width: 10),
                              Text(
                                option,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                  .toList(),

              Spacer(),

              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 97, 179, 226),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    side: BorderSide(color: Colors.white),
                  ),
                  onPressed: _selectedOption == null ? null : _nextQuestion,
                  child: Text(
                    isLastQuestion ? 'Finish' : 'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}