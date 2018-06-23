import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget{
  final String textString;
  final VoidCallback onTap;
  final Color backColor;

  OptionButton(this.textString,this.onTap,this.backColor);

  @override
    Widget build(BuildContext context) {
      
      // TODO: implement build
      return Material(
        color: backColor,
        child: new InkWell(
          onTap: ()=>onTap(),
            child:new Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child:new Padding(
                  padding: new EdgeInsets.all(0.0),
                  child: new Container(child:new Text(textString,style: new TextStyle(color: Colors.white,fontSize: 30.0,),textAlign: TextAlign.center,),),
                )
              )
            ],
          )
        )
      );
    }
}