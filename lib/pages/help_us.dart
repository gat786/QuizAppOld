import 'package:flutter/material.dart';
import 'package:quiz/util/ensure_focus.dart';

class HelpUs extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return HelpUsState();
    }
}
  FocusNode _question=new FocusNode();
  FocusNode _answer=new FocusNode();
  FocusNode _option1=new FocusNode();
  FocusNode _option2=new FocusNode();
  FocusNode _option3=new FocusNode();
class HelpUsState extends State<HelpUs> {


  

  Widget listView=new ListView(
              children: <Widget>[

                new DropdownButton<String>(
                  hint: new Text("Select Subject ",style: new TextStyle(color: Colors.black),),
                  items: <String>['Science', 'History', 'Geography', 'Computer Science','Films','Mythology','Sports'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {
                    
                  },
                  style: new TextStyle(color: Colors.black),
                ),

                new EnsureVisibleWhenFocused(
                  focusNode: _question,
                  child: new TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        hintText: "Question",
                        hintStyle: new TextStyle(color: Colors.black38),
                        labelText: "Question",
                        labelStyle: new TextStyle(color: Colors.black),
                      ),
                      focusNode: _question,
                      onSaved: (String value){

                      },
                    ),
                  ), 
                  
                new EnsureVisibleWhenFocused(
                focusNode: _answer,
                child: new TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: new InputDecoration(
                      hintText: "Answer",
                      hintStyle: new TextStyle(color: Colors.black38),
                      labelText: "Answer",
                      labelStyle: new TextStyle(color: Colors.black),
                    ),
                    focusNode: _answer,
                    onSaved: (String value){

                    },
                  ),
                ), 


                new EnsureVisibleWhenFocused(
                  focusNode: _option1,
                  child: new TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        hintText: "First Option",
                        hintStyle: new TextStyle(color: Colors.black38),
                        labelText: "First Option",
                        labelStyle: new TextStyle(color: Colors.black),
                      ),
                      focusNode: _option1,
                      onSaved: (String value){

                      },
                    ),
                  ), 


                new EnsureVisibleWhenFocused(
                  focusNode: _option2,
                  child: new TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        hintText: "Second Option",
                        hintStyle: new TextStyle(color: Colors.black38),
                        labelText: "Second Option",
                        labelStyle: new TextStyle(color: Colors.black),
                      ),
                      focusNode: _option2,
                      onSaved: (String value){

                      },
                    ),
                  ), 

                new EnsureVisibleWhenFocused(
                  focusNode: _option3,
                  child: new TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: new InputDecoration(
                        hintText: "Third Option",
                        hintStyle: new TextStyle(color: Colors.black38),
                        labelText: "Third Option",
                        labelStyle: new TextStyle(color: Colors.black),
                      ),
                      focusNode: _option3,
                      onSaved: (String value){

                      },
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
            );

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        body: new Container(
          height: double.infinity,
          padding: EdgeInsets.all(20.0),
          color: Colors.grey[50],
          child: new Center(
            child: new Form(
              child: listView
            ),
          )
        )
      );
    }
}