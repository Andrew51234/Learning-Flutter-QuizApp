import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int index;
  final Function choiceHandler;

  Quiz({
    required this.questions,
    required this.index,
    required this.choiceHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[index]['questionText'] as String),
      ...(questions[index]['answers'] as List<Map<String, Object>>)
          .map((answer) {
        return Answer(() => choiceHandler(answer['score']),
            answer['choice'] as String, index);
      }).toList()
    ]);
  }
}
