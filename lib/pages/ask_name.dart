import 'package:flutter/material.dart';
import './login_page.dart';


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
      
      var hintColor=Color.fromRGBO(199, 236, 238, 1.0);
      var labelColor=Color.fromRGBO(223, 249, 251, 1.0);
      // TODO: implement build

      var formToFill=new Form(
            child: new ListView(
              
              children: <Widget>[

                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Username",
                    labelText: "Enter Your Username",
                    hintStyle: new TextStyle(color: hintColor),
                    labelStyle: new TextStyle(color: labelColor),
                  ),
                ),

                new TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                    hintText: "Email Address",
                    labelText: "Enter Your Email Adrress",
                    hintStyle: new TextStyle(color: hintColor),
                    labelStyle: new TextStyle(color: labelColor),
                  ),
                ),

                new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Enter Your Password",
                    hintStyle: new TextStyle(color: hintColor),
                    labelStyle: new TextStyle(color: labelColor),
                  ),
                ),

                new Container(
                  margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  child: new RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    child: new Text("Sign Up",style: new TextStyle(color: Colors.white),),
                    color: Color.fromRGBO(255,127,80, 1.0),
                    onPressed: (){},
                  ),
                )
              ],
            ),
          );


      return new Material(
        color: Color.fromRGBO(236, 240, 241, 1.0),
        child: new Padding(
          padding: EdgeInsets.all(0.0),
          child:new Column(
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: <Widget>[
             new Card(

               elevation: 10.0,
               
               child:  new Container(
                
                width: 350.0,
                height: 400.0,
                color: Color.fromRGBO(26, 188, 156, 1.0),
                child: new Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 70.0),
                  child: formToFill
                ),
              ),
             ),

             new MaterialButton(
                child: new Text("Click here to Login",style: new TextStyle(color:Colors.blueAccent),),
                onPressed: (){
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context)=>new LoginPage()));
                },
              )
            ],
          )
        )
      );
    }
}