import 'package:flutter/material.dart';
import 'package:quiz/util/ensure_focus.dart';


class HelpUsBoolean extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HelpUsBooleanState();
  }
}

class HelpUsBooleanState extends State<HelpUsBoolean>{
  var _booleanValue=true;
  var typeDrop=new List<DropdownMenuItem<String>>();
  void createTypeDrop(){
    typeDrop=[];
    typeDrop.add(new DropdownMenuItem(child: new Text("Science"),value: "science",));
    typeDrop.add(new DropdownMenuItem(child: new Text("History"),value: "history",));
    typeDrop.add(new DropdownMenuItem(child: new Text("Geography"),value: "geography",));
    typeDrop.add(new DropdownMenuItem(child: new Text("Sports"),value: "sports",));
    typeDrop.add(new DropdownMenuItem(child: new Text("Computer Science"),value: "computers",));
    typeDrop.add(new DropdownMenuItem(child: new Text("Mythology"),value: "myth",));
    typeDrop.add(new DropdownMenuItem(child: new Text("Films"),value: "films",));
  }
  FocusNode _question=new FocusNode();
  String selectedType;
  @override
  Widget build(BuildContext context) {
    createTypeDrop();
    var selector= new DropdownButton<String>(
      items: typeDrop,
      hint: new Text("Please Select a Subject"),
      onChanged: (String value) {
        print("You selected $value");
        selectedType=value;
        this.setState((){});
      },
      value: selectedType,
    );
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[

          new Container(
            child: new Center(child: selector,),
            height: 70.0,
            color: Colors.greenAccent,
          ),
          new Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0),
            child: new EnsureVisibleWhenFocused(
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
          ),
          
          new SwitchListTile(
            value: _booleanValue,
            title: new Text("Select Whether True or False"),
            secondary: new Icon(Icons.keyboard_arrow_right),
            onChanged: (bool value){
              _booleanValue=value;
              this.setState((){});
            },
          ),

          new Padding(
            padding: EdgeInsets.only(top:10.0,bottom: 10.0),
            child: new Center(
              child: Text("Your Selected Answer is $_booleanValue",
                style: new TextStyle(fontSize: 16.0),
              ),
            ),
          ),


          new Padding(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
              child: new MaterialButton(
                color: Colors.blueAccent,
                child: new Text("Submit Question",style: new TextStyle(color:Colors.white),),
                onPressed: (){
                  print("You pressed Submit..");
                },
              )
          )


        ],
      ),
    );
  }
}