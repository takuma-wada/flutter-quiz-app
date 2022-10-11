import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  String get resultPhrase {
    String resultText;
    if (resultScore <= 5) {
      resultText = 'あと少し';
    } else if (resultScore <= 10) {
      resultText = '優秀！';
    } else {
      resultText = 'やり直そう';
    }
    return resultText;
  }

  Result(this.resultScore, this.resetHandler);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () => resetHandler(),
            child: const Text(
              '最初に戻る',
            ),
          )
        ],
      ),
    );
  }
}
