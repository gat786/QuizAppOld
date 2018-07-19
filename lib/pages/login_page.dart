import 'package:flutter/material.dart';
import '../util/ensure_focus.dart';

class LoginPage extends StatelessWidget{
  FocusNode name=new FocusNode();
  FocusNode password = new FocusNode();
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Material(
        child: new Padding(
          padding: EdgeInsets.all(0.0),
          child: new Form(
          child:ListView(
            children: <Widget>[
              Row(children: <Widget>[
                new Icon(Icons.favorite,size: 100.0,),
                new Text("Login",style: new TextStyle(fontSize: 75.0),)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              ),
              
              EnsureVisibleWhenFocused(
                focusNode: name,
                child: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Username",
                    labelText: "Enter Your Username"
                  ),
                  focusNode: name,
                  onSaved: (String value){},
                ),
              ),

              EnsureVisibleWhenFocused(
                focusNode: password,
                child: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Enter Your Password"
                  ),
                  focusNode: password,
                  onSaved: (String value){},
                ),
                
              ),


            new Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: new RaisedButton(
                  padding: EdgeInsets.all(10.0),
                  child: new Text("Sign In",style: new TextStyle(color: Colors.white),),
                  color: Colors.blueAccent,
                  onPressed: (){},
                ),
              )

                     
            ],
          ) 
        ),
        )
      );
    }
}