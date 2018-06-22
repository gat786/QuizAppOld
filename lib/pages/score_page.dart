import 'package:flutter/material.dart';
import 'landing_page.dart';

class ScorePage extends StatelessWidget{
  final int score;
  final int totalQuestion;

  ScorePage(this.score,this.totalQuestion);

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        color: Colors.blue,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Your Score Is ",style: new TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold),),
            new Text(score.toString()+"/"+totalQuestion.toString(),style: new TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold),),
            new IconButton(
              icon: new Icon(Icons.arrow_right),
              iconSize: 50.0,
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new LandingPage()))
            )
          ],
        ),
      );
    }
}