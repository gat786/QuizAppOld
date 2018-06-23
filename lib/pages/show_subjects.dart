import 'package:flutter/material.dart';
import 'package:quiz/ui/subject_button.dart';
import 'four_option_question.dart';


class SubjectShow extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        color: Colors.white,
        child: new ListView(
          
          children: <Widget>[
            new SubjectButton(Colors.redAccent, "Science",()=>Navigator.of(context).
            push(new MaterialPageRoute(builder: (BuildContext build) => new FourQuestion(17)))),

            new SubjectButton(Colors.pinkAccent, "History",()=>Navigator.of(context).
            push(new MaterialPageRoute(builder: (BuildContext build) => new FourQuestion(23)))),

            new SubjectButton(Colors.orangeAccent, "Geography",()=>Navigator.of(context).
            push(new MaterialPageRoute(builder: (BuildContext build) => new FourQuestion(22)))),
            
            new SubjectButton(Colors.greenAccent, "Computer Science",()=>Navigator.of(context).
            push(new MaterialPageRoute(builder: (BuildContext build) => new FourQuestion(18)))),
          ],
        ),
      );
    }
}