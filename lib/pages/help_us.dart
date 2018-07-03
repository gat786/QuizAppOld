import 'package:flutter/material.dart';

class HelpUs extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return HelpUsState();
    }
}

class HelpUsState extends State<HelpUs> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        child: new Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.yellow[100],
          child: new Form(
            child: new ListView(
              children: <Widget>[

                  new Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: 
                    new TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        hintText: "Question",
                        labelText: "Question",
                      ),
                    ),
                  ),
                  
                  
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child:new TextFormField(
                      decoration: new InputDecoration(
                        hintText: "Answer",
                        labelText: "Answer"
                      ),
                    ),
                  ),
                  
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child:new TextFormField(
                      decoration: new InputDecoration(
                        hintText: "Option 1",
                        labelText: "Option 1"
                      ),
                    ),
                  ),
                  
                new Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child:new TextFormField(
                      decoration: new InputDecoration(
                        hintText: "Option 2",
                        labelText: "Option 2",
                        hintStyle: new TextStyle(color: Colors.blueAccent)
                        
                      ),
                    ),
                  ),
                  
                  new Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child:new TextFormField(
                      decoration: new InputDecoration(
                        hintText: "Option 3",
                        labelText: "Option 3"
                      ),
                    ),
                  ),

                  new Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: new MaterialButton(
                      color: Colors.blueAccent,
                      child: new Text("Submit Question....",style: new TextStyle(color:Colors.white),),
                      onPressed: (){
                        print("You pressed Submit..");
                      },
                    )
                  )
              ],
            )
          ),
        )
      );
    }
}