import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

int totalScore=0;
int totalMatches=0;



class PersonalScore extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return PersonalScoreState();
    }
}


class PersonalScoreState extends State<PersonalScore>{

    void getScore() async {
      totalScore=0;
      var databases=await getDatabasesPath();
      String path=join(databases,"QuizApp.db");

      Database database = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              "CREATE TABLE Scores (matchid INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, score INTEGER)");
        });

      List<Map> list=await database.rawQuery("Select * from Scores");
      for(var a in list){
        totalScore=totalScore+a["score"];
      }
      totalMatches=list.length;
      this.setState((){
        totalScore=totalScore;
        totalMatches=totalMatches;
      }
      );
    }
    @override
    Widget build(BuildContext context) {

      getScore();
      // TODO: implement build
      return new Scaffold(
        body: new Material(
            child:new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child: new Card(
                color: Colors.blue,
                child: new Container(
                  width: double.infinity,
                  height: 200.0,
                  child: new ListView(
                    children: <Widget>[
                      new Text("Your Score is",textAlign: TextAlign.center,style: new TextStyle(color: Colors.white),),
                      new Padding(
                        padding: EdgeInsets.all(10.0),
                        child: new Row(
                        children: <Widget>[
                            new Expanded(child: new Text("Points",textAlign: TextAlign.center,style: new TextStyle(color: Colors.white),),),
                            new Expanded(child: new Text("Matches",textAlign: TextAlign.center,style: new TextStyle(color: Colors.white),)),
                          ],
                        ),
                      ),

                      new Padding(
                        padding: EdgeInsets.all(10.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              child:new Text(totalScore.toString(),
                                textAlign: TextAlign.center,
                                style: new TextStyle(color: Colors.white,
                                fontSize: 50.0
                                ),
                              ),
                            ),
                            new Text("in",textAlign: TextAlign.center,style: new TextStyle(color: Colors.white),),
                            new Expanded(
                                child:new Text(totalMatches.toString(),
                                textAlign: TextAlign.center,
                                style: new TextStyle(color: Colors.white,
                                fontSize: 50.0
                              ),
                              )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
            )
          )
      );
    }
}