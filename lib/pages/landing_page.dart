import 'package:flutter/material.dart';
import 'package:quiz/pages/quiz_page.dart';
import './show_subjects.dart';

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
              new Text("Tap To Start",style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),
              new IconButton(icon: new Icon(Icons.more,color: Colors.white,size: 30.0,),
              onPressed: 
              ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext build)=>new SubjectShow())), 
              )
            ],
          ),
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext build)=>new Quizpage())),
        ),
      );
    }
}