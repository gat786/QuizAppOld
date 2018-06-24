import 'package:flutter/material.dart';
import 'package:quiz/util/quiz.dart';
import 'package:quiz/ui/answer_button.dart';
import 'package:quiz/util/question.dart';
import 'package:quiz/ui/question_display.dart';
import 'package:quiz/ui/correct_wrong_overlay.dart';
import 'score_page.dart';

class Quizpage extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new QuizPageState();
    }
}

class QuizPageState extends State<Quizpage>{
    bool displayOverlay=false;
    bool result;
    Question currentQuestion;
    int questionNumber=1;
    int counter=0;


    Quiz quiz=new Quiz([
      new Question("Pizza is Healthy", false),
      new Question("Is Waking Up A Good Habit", true),
      new Question("India Is Great", true),
      new Question("Is Google a Social Network", false),
      new Question("Capital of India is Mumbai", false),
      new Question("Flutter is Awesome", true ),
      new Question("Android Apps are Great ", true),
      new Question("Earth is a Star", false),
      new Question("Sun is a Planet ", false),
      new Question("Nasa is a Space Organization ", true),
    ]);
String questionText;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentQuestion=quiz.question;
    questionText=currentQuestion.question;
    questionNumber=quiz.currentQuestionNumber;
  }


  void handleAnswer(bool userAnswer){
    counter=counter+1;
    if (userAnswer==currentQuestion.answer){
      result=true;
    }
    else{
      result=false;
    }
    quiz.answer(result);
    this.setState((){
      displayOverlay=true;
    });
  }

    @override
      Widget build(BuildContext context) {
        print("Updating UI "+questionText+questionNumber.toString());
        // TODO: implement build
        return new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(              
              children: <Widget>[
                new Expanded(child: new AnswerButton(true,(){ handleAnswer(true); } ),),
                new Row(children: <Widget>[
                  new Expanded(child:new QuestionDisplay(questionText,questionNumber)),
                ],),
                new Expanded(child: new AnswerButton(false,(){ handleAnswer(false); } ),)
              ],
            ),
          (displayOverlay)?new CorrectWrongOverlay(result,(){
            if (counter<quiz.lengthQuestions){
            currentQuestion=quiz.nextQuestion;
            questionText=currentQuestion.question;
            questionNumber=quiz.currentQuestionNumber;
            print("current "+currentQuestion.question);
          this.setState((){
            displayOverlay=false;
          });
            }
            else{
              Navigator.of(context).push(new MaterialPageRoute(builder:( BuildContext context)=>new ScorePage(quiz.score, quiz.lengthQuestions),));
            }
          },result.toString()):new Container(),  
          ],
        );
      }
}