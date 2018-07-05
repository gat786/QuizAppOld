import 'package:flutter/material.dart';

class AskName extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return AskNameState();
    }
}

class AskNameState extends State<AskName>{

   


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        color:Colors.grey[50],
        child: new Container(
          padding: EdgeInsets.all(20.0),
          child: new Form(
            child: new ListView(
              
              children: <Widget>[

                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Username",
                    labelText: "Enter Your Username"
                  ),
                ),

                new TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                    hintText: "Email Address",
                    labelText: "Enter Your Email Adrress"
                  ),
                ),

                new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Enter Your Password"
                  ),
                ),

                new Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: new RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    child: new Text("Sign Up",style: new TextStyle(color: Colors.white),),
                    color: Colors.blueAccent,
                    onPressed: (){},
                  ),
                )
              ],
            ),
          ),
        )
      );
    }
}