import 'package:flutter/material.dart';
import 'package:quiz/ui/subject_button.dart';


class SubjectShow extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        color: Colors.white,
        child: new ListView(
          
          children: <Widget>[
            new SubjectButton(Colors.redAccent, "Science",()=>{}),
            new SubjectButton(Colors.pinkAccent, "History",()=>{}),
            new SubjectButton(Colors.orangeAccent, "Geography",()=>{}),
            new SubjectButton(Colors.greenAccent, "Computer Science",()=>{}),
          ],
        ),
      );
    }
}