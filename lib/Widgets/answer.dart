import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final int index;
  final VoidCallback choiceHandler;

  Answer(this.choiceHandler, this.answer, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: index % 2 == 0 ? Colors.blue : Colors.red,
          onPrimary: Colors.white,
        ),
        child: Text(answer),
        onPressed: choiceHandler,
      ),
    );
  }
}
