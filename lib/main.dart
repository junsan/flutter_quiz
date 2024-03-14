import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'question.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green'
  ];

  int questionNumber = 0;

  List<Question> questionsList = [
    Question(paraQuestion: 'You can lead a cow down stairs but not up stairs.', paraAnswer: false),
    Question(paraQuestion: 'Approximately one quarter of human bones are in the feet.', paraAnswer: true),
    Question(paraQuestion: 'A slug\'s blood is green.', paraAnswer: true),
  ];

  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Text(questionsList[questionNumber].question,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: TextButton(
                  onPressed: () {
                    setState(() {

                      if (questionsList[questionNumber].answer == true) {
                        print('Correct answer!');
                      } else {
                        print('Wrong answer!');
                      }

                      questionNumber++;
                      scoreKeeper.add(
                        const Icon(
                          Icons.check,
                          color: Colors.green
                        )
                      );
                    });
                  },
                  child: const Text('True',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: TextButton(
                  onPressed: () {
                    if (questionsList[questionNumber].answer == false) {
                      print('Correct answer!');
                    } else {
                      print('Wrong answer!');
                    }
                    questionNumber++;
                  },
                  child: const Text('False',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            ),
          ],
        )
      ),
    );
  }
}

