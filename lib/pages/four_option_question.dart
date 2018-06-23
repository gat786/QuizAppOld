import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz/ui/option_button.dart';
import 'package:quiz/ui/question_display.dart';
import 'package:quiz/retrieve_data/retrieve.dart';
import 'package:quiz/ui/correct_wrong_overlay.dart';

class FourQuestion extends StatefulWidget{
  final bool overlayVisible=false;
  final int category;

  FourQuestion(this.category);

  @override
  FourQuestionState createState() {
    return new FourQuestionState();
  }
}


class FourQuestionState extends State<FourQuestion> {
  @override
    Widget build(BuildContext context) {
      String first="https://opentdb.com/api.php?amount=10&category=";
      String second="&difficulty=easy&type=multiple";

      fetchPost(first+widget.category.toString()+second);
      //List<QuestionModel> questionAnswers=questionsAnswers(response);

      // TODO: implement build
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Material(
          child: new Stack(
            children: <Widget>[
                  new Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                      new Expanded(
                      child: new Row(
                        children: <Widget>[
                          new Expanded(child: new OptionButton("One",()=>{},Colors.yellow),),
                          
                          new Expanded(child:new OptionButton("Two",()=>{},Colors.orange),),
                          ],
                        ),
                    ),
                    new Container(
                      child: new QuestionDisplay("Hello I am The Question", 1)
                    ),
                    new Expanded(
                      child: new Row(
                        //#74b9ff
                        children: <Widget>[
                          new Expanded(child: new OptionButton("Three",()=>{},Color.fromRGBO(116, 185, 255, 1.0)),),
                          
                          new Expanded(child: new OptionButton("Four",()=>{},Color.fromRGBO(255, 118, 117, 1.0)),),
                        ],
                      ),
                    ),
                ],
              ),
              (widget.overlayVisible)?new CorrectWrongOverlay(true, ()=>{}):new Container(),
            ],
          )
        ),
      );
    }
}
