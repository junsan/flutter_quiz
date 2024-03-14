import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'quiz_questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizQuestion quizQuestion = QuizQuestion();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(userAnswer) {
    setState(() {
      if (quizQuestion.getCurrentQuestionNumber() >=
          quizQuestion.getQuestionLength() - 1) {
        quizQuestion.resetQuestion();
      } else if (quizQuestion.getCorrectAnswer() == userAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        quizQuestion.nextQuestion();
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        quizQuestion.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [DefaultMaterialLocalizations.delegate],
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: Builder(
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        quizQuestion.getQuestion(),
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
                        if (quizQuestion.getCurrentQuestionNumber() >=
                            quizQuestion.getQuestionLength() - 1) {
                          Alert(
                                  context: context,
                                  title: "Question",
                                  desc:
                                      "No more question. Question will reset now")
                              .show();
                        }
                        checkAnswer(true);
                      },
                      child: const Text(
                        'True',
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
                        if (quizQuestion.getCurrentQuestionNumber() >=
                            quizQuestion.getQuestionLength() - 1) {
                          Alert(
                              context: context,
                              title: "Question",
                              desc:
                              "No more question. Question will reset now")
                              .show();
                        }
                        checkAnswer(false);
                      },
                      child: const Text(
                        'False',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: scoreKeeper,
                ),
              ],
            ),
          )),
    );
  }
}
