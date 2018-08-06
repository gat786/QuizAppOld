import 'package:flutter/material.dart';
import '../util/ensure_focus.dart';
import 'ask_name.dart';
import '../pages/see_leaders.dart';
import 'package:quiz/web_service/authenticate.dart';
import '../util/shared_preference.dart';
import '../ui/loading_ui.dart';

class LoginPage extends StatefulWidget{
  final FocusNode _name=new FocusNode();
  final FocusNode _password = new FocusNode();
  
  @override
  LoginPageState createState() {
    return new LoginPageState();
  }

}
bool isLoading=false;
class LoginPageState extends State<LoginPage> {
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      isLoading=false;
    }

    final _formKey = GlobalKey<FormState>();
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      

      TextEditingController _usernameController=new TextEditingController();
      TextEditingController _passwordController=new TextEditingController();

      var hintColor=Color.fromRGBO(199, 236, 238, 1.0);
      var labelColor=Color.fromRGBO(223, 249, 251, 1.0);

      Widget userInput=EnsureVisibleWhenFocused(
                focusNode: widget._name,
                child: new TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your username';
                    }
                  },
                  controller: _usernameController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    hintText: "Username",
                    labelText: "Enter Your Username",
                    hintStyle: new TextStyle(color: hintColor),
                    labelStyle: new TextStyle(color: labelColor),
                  ),
                  focusNode: widget._name,
                  onSaved: (String value){

                  },
                ),
              );

      Widget passInput= EnsureVisibleWhenFocused(
                focusNode: widget._password,
                child: new TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email-id';
                    }
                  },
                  controller: _passwordController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    hintStyle: new TextStyle(color: hintColor),
                    labelText: "Enter Your Password",
                    labelStyle: new TextStyle(color: labelColor),
                  ),
                  focusNode: widget._password,
                  
                  onSaved: (String value){

                  },
                ),
                
              );

      Widget buttonSaved= new Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: new RaisedButton(
                  padding: EdgeInsets.all(10.0),
                  child: new Text("Sign In",style: new TextStyle(color: Colors.white),),
                  color: Color.fromRGBO(255,127,80, 1.0),
                  onPressed: (){

                    if(_formKey.currentState.validate()){
                      saveUserLoginDetails(_usernameController.text, _passwordController.text);
                      loginUser(_usernameController.text, _passwordController.text);
                    //Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context)=>new SeeLeaders()));
                      this.setState((){  isLoading=true;});
                    }

                    
                    
                  },
                ),
              );

      Widget rowHeader=Row(children: <Widget>[
                new Text("Login",style: new TextStyle(fontSize: 75.0),)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              );

      Widget formToFill=new Form(
            key: _formKey,
            child: ListView(

              children: <Widget>[
                userInput,
                
                passInput,

                buttonSaved,
            
              ],
            ),
          );
      
      return Stack(
        children: <Widget>[
          new Container(
            width: double.infinity,
              child: new Material(
              color: Color.fromRGBO(236, 240, 241, 1.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                        new Container(
                          
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

                            
                            ],
                          )
                        ),

                    new MaterialButton(
                      child: new Text("Click here to Register",style: new TextStyle(color:Colors.blueAccent),),
                      onPressed: (){
                        Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context)=>new AskName()));
                      },
                    )
                ],
              )
            ),
          ),

          (isLoading)?IsLoading():new Container()
        ],
      );
    }
}