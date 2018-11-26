import 'question.dart';

class Quizz {
  List<Question> _questions;

  int _currentQuestionIndex = -1;
  int _score = 0;

  Quizz(){
    _questions = [
      new Question("Flutter ça fonctionne bien ?", true),
      new Question("C'est vrai", true),
      new Question("C'est faux", false),
      new Question("Va créer tes propres questions maintenant", true)
    ];
    _questions.shuffle();
  }

  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get score => _score;
  int get questionNumber => _currentQuestionIndex + 1;

  Question get nextQuestion{
    _currentQuestionIndex ++;
    if(_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect){
    if(isCorrect) _score ++;
  }

}