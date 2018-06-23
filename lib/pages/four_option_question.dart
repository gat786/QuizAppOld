import 'package:flutter/material.dart';
import 'package:quiz/ui/option_button.dart';
import 'package:quiz/ui/question_display.dart';

class FourQuestion extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Material(
          child: new Column(
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
          )
        ),
      );
    }
}
