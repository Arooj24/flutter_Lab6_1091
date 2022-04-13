import 'Question.dart';

class QuizBrain {
  // ignore: non_constant_identifier_names
  //ecan
  int _QuestionNumber = 0;
  //
  final List<Questions> _questionBank = [
    Questions('Do camels have three sets of eyelids?', true),
    Questions('It is possible to sneeze while sleeping?', false),
    Questions('Australia is a country as well as a continent?', true),
    Questions('The cell nucleus was discovered by Robert Brown?', true),
    Questions('The capital of France is Washington DC?', false),
    Questions('Butterflies are not birds?', true),
    Questions('The human body consists of 150 bones?', false),
    Questions('Jupiter is the smallest planet in the solar system?', false),
    Questions('The Sahara desert is the biggest desert in the world?', true),
    Questions('Seeds of cotton get dispersed by water?', false),
  ];

  //ignore:
  void nextQuestions() {
    if (_QuestionNumber < _questionBank.length - 1) {
      _QuestionNumber++;
    }
  }

  // ignore: non_constant_identifier_names
  String GetQuestions() {
    return _questionBank[_QuestionNumber].QuestionString;
  }

  // ignore: non_constant_identifier_names
  bool CorrectAnswer() {
    return _questionBank[_QuestionNumber].AnswerText;
  }

  bool isFinished() {
    if (_QuestionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _QuestionNumber = 0;
  }
}
