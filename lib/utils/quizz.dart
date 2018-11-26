import 'question.dart';

class Quizz {
  List<Question> _questions;

  int _currentQuestionIndex = -1;
  int _score = 0;

  Quizz(){
    _questions = [
      new Question("Vas tu valider if26 ?", false),
      new Question("Vas tu Finir SDF ?", false),
      new Question("Flutter ça fonctionne bien ?", true),
      new Question("César est beau ?", true),
      new Question("Mathieu a une belle moustache ?", true),
      new Question("Où est Michel ?", false),
      new Question("Mais t'es où ?", true),
      new Question("Le gras c'est la vie.", false),
      new Question("C'est pas faux", true)
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