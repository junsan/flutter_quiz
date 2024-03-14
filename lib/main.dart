import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
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
                  child: const Text('This is where is the question text will go.',
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
              
                  },
                  child: const Text('True',
                    style: TextStyle(
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

                  },
                  child: Text('False',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

