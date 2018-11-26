import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quizz.dart';
import '../UI/answerButton.dart';
import '../UI/questionText.dart';
import '../UI/correctWrong_overlay.dart';
import '../pages/scorePage.dart';

class QuizzPage extends StatefulWidget{
  @override
  State createState() => new QuizzPageState();

}

class QuizzPageState extends State<QuizzPage>{
  Question currentQuestion;
  Quizz quizz = new Quizz();
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quizz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quizz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quizz.answer(isCorrect);
    this.setState(() {
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget> [
              new AnswerButton(true, () => handleAnswer(true)), // True button
              new QuestionText(questionText, questionNumber),
              new AnswerButton(false, () => handleAnswer(false)), // False Button
          ],
        ),
        overlayVisible ? new CorrectWrongOverlay(
          isCorrect,
            (){
            if (quizz.length == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quizz.score, quizz.length)), (Route route) => route == null);
            }
            currentQuestion = quizz.nextQuestion;
            this.setState(() {
              overlayVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quizz.questionNumber;
            });
            }
        ): new Container(),
      ],
    );
  }

}