import 'package:flutter/material.dart';
import 'package:quiz/util/score_card_leaders.dart';

class SeeLeaders extends StatelessWidget{
  final score=20;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Container(child: new ScoreLeaders(),),


             new Card(
                  child: new Padding(padding: EdgeInsets.all(20.0,),
                    child: new Text("Your Score is $score",textAlign: TextAlign.center,style: new TextStyle(fontSize: 16.0),),
                  )
                )

          ],
        ),
      ),
    );
  }
}