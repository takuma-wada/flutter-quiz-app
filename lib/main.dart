import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  static const _questions = [
    {
      'questionText': '好きな色は？',
      'answers': [
        {
          'text': '赤',
          'score': 10,
        },
        {
          'text': '青',
          'score': 5,
        },
        {
          'text': '黄',
          'score': 1,
        },
      ],
    },
    {
      'questionText': '好きな動物は？',
      'answers': [
        {'text': '犬', 'score': 10},
        {'text': '猫', 'score': 5},
        {'text': '熊', 'score': 1},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('quiz app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answeQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
