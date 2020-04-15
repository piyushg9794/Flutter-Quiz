import 'Question.dart';

class Quiz {
  List<Question> _questions;
  int _currindex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionNumber => _currindex+1;
  int get score => _score;

  Question get nextQuestion {
    _currindex++;
    if(_currindex >= _questions.length) return null;
    return _questions[_currindex];

  }



  void answer(bool isCorrect) {
    //todo
    if (isCorrect) _score++;
  }

}
