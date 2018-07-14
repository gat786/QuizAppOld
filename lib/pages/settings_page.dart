import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz/ui/settings_image_clipped.dart';
import 'package:quiz/util/shared_preference.dart';

class SettingsPage extends StatefulWidget{

  @override
    State<StatefulWidget> createState() {
      
      // TODO: implement createState
      return new SettingsPageState();
    }
}
bool saveData=true;
class SettingsPageState extends State<SettingsPage>{
  SettingsPageState(){
    getPreference();
  }
  
  Future getPreference()async {
    saveData=await getSoundPreference();
    this.setState((){});
  }

  @override
    Widget build(BuildContext context) {
      //getPreference();
      // TODO: implement build
      return new Scaffold(
        body: new Material(
          child: new Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new ClippedPath(),

                  new Container(
                    height: 280.0,
                    child: new Center(
                      child:new Text("Settings",style: new TextStyle(color: Colors.white,fontSize: 40.0),)
                    ),
                  )
                  
                ],
              ),

              new Padding(
                padding: EdgeInsets.fromLTRB(10.0,30.0,10.0,0.0),
                child: new SwitchListTile(
                  value: saveData,
                  onChanged: (bool a){   setState(() {  
                    saveData=a;  
                    saveSoundPreference(saveData);
                  });  },
                  title: new ListTile(
                    leading: new Icon( Icons.audiotrack ),
                    title: new Text("Sound"),
                  ),
                ),
              )

            ],
          )
        ),
      );
    }
}