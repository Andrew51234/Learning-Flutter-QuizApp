import 'dart:ffi';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;

  Result(this.score, this.resetHandler);

  String get resultMessage {
    String resultText;
    if (score <= 4) {
      resultText = 'Meh';
    } else if (score <= 10) {
      resultText = 'GG EZ';
    } else if (score <= 30) {
      resultText = 'Well done!';
    } else {
      resultText = 'Try again :)';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultMessage,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
            onPressed: resetHandler)
      ],
    ));
  }
}
