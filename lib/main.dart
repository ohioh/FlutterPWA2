import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

// TODO: implement MongoDB and MongoDB_internal
// TODO: html convert to flutter
// TODO: host pwa on github/heroku

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Was ist deine Lieblingsfarbe?',
        'answers': ['Schwarz', 'Rot', 'Blaus']
      },
      {
        'questionText': 'Was ist dein Lieblingstier?',
        'answers': ['Elefant', 'Giraffe', 'Nasenbär']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meine erste  Flutter App'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
