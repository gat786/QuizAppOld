import 'package:flutter/material.dart';

class AskName extends StatelessWidget{
  final String choice;
  AskName(this.choice);

  final name=TextEditingController();
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        color: Colors.blueAccent,
        child:new Center(
          widthFactor: 50.0,
          child: new Container(
            width: 250.0,
            child: new TextField(
              style: new TextStyle(fontSize: 40.0,color: Colors.white),
              textAlign: TextAlign.center,
              decoration: new InputDecoration.collapsed(
                hintStyle: new TextStyle(fontSize: 40.0,color: Colors.white),
                fillColor: Colors.yellow,
                hintText: 'Enter Name',),
              controller: name,
            ),
          )
        )
      );
    }
}