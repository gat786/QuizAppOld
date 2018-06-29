import 'package:flutter/material.dart';
import 'package:quiz/ui/ask_choices_button.dart';
import 'ask_name.dart';

class AskChoices extends StatelessWidget{

  void navigateCorrectly(String choice,BuildContext context){
    print("You clicked choice "+choice);
    if(choice=="mcq"){
      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)=>new AskName(choice)));
    }
    else if(choice=="truefalse"){
      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)=>new AskName(choice)));
    }
  }


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        child: new Column(
          children: <Widget>[
            new Expanded(child: new AskChoicesButton("MCQ",Colors.purple,()=>navigateCorrectly("mcq",context)),),
            new Expanded(child: new AskChoicesButton("True Or False",Colors.blue,()=>navigateCorrectly("truefalse",context)),)
          ],
        ),
      );
    }
}