import 'package:flutter/material.dart';

import './Widgets/quiz.dart';
import './Screens/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var index = 0;
  var totalScore = 0;

  final questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'choice': 'Black', 'score': 10},
        {'choice': 'Red', 'score': 5},
        {'choice': 'Green', 'score': 3},
        {'choice': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'choice': 'Rabbit', 'score': 3},
        {'choice': 'Snake', 'score': 11},
        {'choice': 'Elephant', 'score': 5},
        {'choice': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'choice': 'Someone', 'score': 1},
        {'choice': 'Someone else', 'score': 4},
        {'choice': 'Another else', 'score': 6},
        {'choice': 'idk', 'score': 10},
      ],
    },
  ];

  void choiceHandler(int score) {
    totalScore += score;
    setState(() {
      index++;
    });
  }

  void resetQuiz() {
    setState(() {
      totalScore = 0;
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.android),
          title: const Text(
            'Quiz App',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(43, 222, 200, 1.0),
        ),
        body: Center(
          child: Column(children: [
            index < questions.length
                ? Quiz(
                    choiceHandler: choiceHandler,
                    index: index,
                    questions: questions,
                  )
                : Result(totalScore, resetQuiz),
            Text('Score: ${totalScore}'),
          ]),
        ),
      ),
    );
  }
}
