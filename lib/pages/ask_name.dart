import 'package:flutter/material.dart';
import 'package:quiz/util/shared_preference.dart';

class AskName extends StatelessWidget{
  final String choice;
  final Color background;


  final Color variableColor=Colors.white;
  final double fontSize=20.0;

  AskName(this.choice,this.background);
  final nameInput=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();

  void saveName(String nameToSave) async {
    print("name is "+nameToSave);
    saveToPreferences("name",nameToSave);
  }

  void saveEmail(String nameToSave) async {
    print("Email is "+nameToSave);
    saveToPreferences("email",nameToSave);
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        color:background,
        child:new Center(
          widthFactor: 50.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Padding(
               padding: EdgeInsets.all(0.0),
               child:  new Container(
               decoration: new BoxDecoration(
                  border: Border.all(color: variableColor),
                  borderRadius: BorderRadius.all(Radius.circular(8.0),)
                ),
                width: 300.0,
                child: new Padding(
                  padding: EdgeInsets.all(10.0),
                  child:  new TextField(
                    style: new TextStyle(fontSize: fontSize,color: variableColor),
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration.collapsed(
                      hintStyle: new TextStyle(fontSize: fontSize,color: variableColor),
                      fillColor: Colors.yellow,
                      hintText: 'Enter Username',),
                    controller: nameInput,
                  ),
                )
              ),
             ),


             new Padding(
               padding: EdgeInsets.all(10.0),
               child:  new Container(
                 decoration: new BoxDecoration(
                  border: Border.all(color: variableColor),
                  borderRadius: BorderRadius.all(Radius.circular(8.0),)
                ),
                width: 300.0,
                child: new Padding(
                  padding: EdgeInsets.all(10.0),
                  child:  new TextField(
                    style: new TextStyle(fontSize: fontSize,color: variableColor),
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration.collapsed(
                      hintStyle: new TextStyle(fontSize: fontSize,color: variableColor),
                      fillColor: Colors.yellow,
                      hintText: 'Enter Email',),
                    controller: email,
                  ),
                )
              ),
             ),

             new Padding(
               padding: EdgeInsets.all(0.0),
               child:  new Container(
                 decoration: new BoxDecoration(
                  border: Border.all(color: variableColor),
                  borderRadius: BorderRadius.all(Radius.circular(8.0),)
                ),
                width: 300.0,
                child: new Padding(
                  padding: EdgeInsets.all(10.0),
                  child:  new TextField(
                    obscureText: true,
                    style: new TextStyle(fontSize: fontSize,color: variableColor),
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration.collapsed(
                      hintStyle: new TextStyle(fontSize: fontSize,color: variableColor),
                      fillColor: Colors.yellow,
                      hintText: 'Enter Password',),
                    controller: password,
                  ),
                )
              ),
             ),

              new IconButton(icon: new Icon( Icons.save,color:variableColor ,),onPressed: ()
                {
                  saveName(nameInput.text);
                  saveEmail(email.text);
                }
              )
            ],
          )
        )
      );
    }
}