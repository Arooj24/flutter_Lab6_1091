import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuestionBank.dart';

import 'package:flutter/src/material/theme.dart';
import 'Question.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Theme(
        // Create a unique theme with `ThemeData`
        data: ThemeData(
          splashColor: Colors.green,
        ),
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 81, 204, 241),
          appBar: AppBar(
            title: Text('Quizz App'),
            backgroundColor: Color.fromARGB(255, 6, 76, 133),
          ),
          body: SafeArea(
            child: MyQuiz(),
          ),
        ),
      ),
    );
  }
}

class MyQuiz extends StatefulWidget {
  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  //make clas objects with class data type
  QuizBrain obj = QuizBrain();
  List<Widget> scorkeeper = [];

  void compareAnswer(bool answer) {
    bool corretAnswer = obj.CorrectAnswer();
    if (obj.isFinished() == true) {
      obj.reset();
      scorkeeper = [];
    } else {
      if (corretAnswer == answer) {
        scorkeeper.add(
          Icon(Icons.check, color: Color.fromARGB(255, 5, 99, 9)),
        );
      } else {
        scorkeeper.add(
          Icon(Icons.close, color: Color.fromARGB(255, 214, 20, 7)),
        );
      }
      setState(() {
        obj.nextQuestions();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                obj.GetQuestions(),
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 18, 4, 80),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                shape: StadiumBorder(),
                onPressed: () {
                  compareAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                color: Color.fromARGB(255, 241, 11, 138),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                shape: StadiumBorder(),
                color: Color.fromARGB(255, 236, 18, 127),
                onPressed: () {
                  compareAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: scorkeeper,
          )
        ],
      ),
    );
  }
}
