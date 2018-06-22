import 'package:flutter/material.dart';
import 'package:quiz/pages/quiz_page.dart';

class LandingPage extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return new Material(
        color: Colors.greenAccent,
        child: new InkWell(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Lets Start",style: new TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,color: Colors.white),), 
              new Text("Tap To Start",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),)
            ],
          ),
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext build)=>new Quizpage())),
        ),
      );
    }
}