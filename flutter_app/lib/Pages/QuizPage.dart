import 'package:flutter/material.dart';
import 'package:flutterapp/UI/AnswerButton.dart';
import 'package:flutterapp/UI/CorrectOverlay.dart';
import '../Data/Quiz.dart';
import '../Data/Question.dart';
import '../UI/QuestionText.dart';
import 'ScorePage.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("Who am I ?", 3, {1:'Freelancer', 2:'Competitive Programmer', 3:'Developer', 4:'Designer'}),
    Question("What is my Github userID ?", 2, {1:'piyush', 2:'piyushg9794', 3:'piyush9794', 4:'piyushg'}),
    Question("Why I developed this app ?", 2, {1:'Learn', 2:'Practice', 3:'Showoff', 4:'TImepass'}),
    Question("How to start a animation in flutter ?", 4, {1:'animation.forward()', 2:'animation.addlistener()', 3:'controller.addlistener()', 4:'controller.forward()'}),
    Question("Which keyword is used to tell funtion is asynchoronuos ?", 1, {1:'Async', 2:'Await', 3:'Stream', 4:'Provider'}),
    Question("Didupdatewidget is called when ___", 4, {1:'Widget rebuilds', 2:'Widgwt resets', 3:'Widget changes ', 4:'Widget Configuration changes'}),
    Question("Which of these is not a proxyprovider ?", 1, {1:'multiproxyprovider', 2:'Listenable proxyprovider', 3:'valuelistenable proxyprovider', 4:'All of these'})

  ]);

  String questionText;
  int questionNumber;
  Map optionMap;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override

  void initState() {
    super.initState();
    currentQuestion =  quiz.nextQuestion;
    questionText = currentQuestion.que;
    questionNumber = quiz.questionNumber;
    optionMap = currentQuestion.options;
  }

  void handleAnswer(int answer){
    isCorrect = (currentQuestion.ans == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,

          children: <Widget>[

              Column(
                children: <Widget>[
                  Expanded(
                    child: Material(
                      elevation: 10.0,
                      shape: BeveledRectangleBorder(side: BorderSide(width:3.0, color: Colors.blueGrey), borderRadius: BorderRadius.circular(8.0)),
                      child:QuestionText(questionNumber, questionText),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        AnswerButton(optionMap[1], () => handleAnswer(1), Colors.blueGrey.shade300),
                        AnswerButton(optionMap[2], () => handleAnswer(2), Colors.blueGrey.shade100),
                      ]
                  ),
                  ),
                  Expanded(
                    child: Row(
                        children: <Widget>[
                          AnswerButton(optionMap[3], () => handleAnswer(3), Colors.blueGrey.shade200),
                          AnswerButton(optionMap[4], () => handleAnswer(4), Colors.blueGrey.shade400),
                        ]
                    ),
                  ),
                ],
              ),
            overlayShouldBeVisible == true ? CorrectOverlay(
                isCorrect,
                () {
                  if(quiz.length == questionNumber){
                    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => ScorePage(quiz.score, quiz.length)), (Route route) => route ==null);
                    return;
                  }
                  currentQuestion = quiz.nextQuestion;
                  this.setState(() {
                    overlayShouldBeVisible = false;
                    questionText = currentQuestion.que;
                    questionNumber = quiz.questionNumber;
                    optionMap = currentQuestion.options;
                  });
                }
            ) : Container(),
    ],
        );


  }
}
