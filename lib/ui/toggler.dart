import 'package:flutter/material.dart';

class Toggler extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return TogglerState();
    }
}

class TogglerState extends State<Toggler>{
  VoidCallback _onTap;
  @override
    Widget build(BuildContext context) {
      var styleText=new TextStyle(color: Colors.white,fontSize: 16.0);
      // TODO: implement build
      return new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(
              color: Colors.green,
              child: new Text("True",style: styleText,),
              onPressed: _onTap,
            ),
            
            new FlatButton(
              color: Colors.red,
              child: new Text("False",style: styleText,),
              onPressed: _onTap,
            )
          ],
        ),
      );
    }
}