import 'package:flutter/material.dart';
import './pages/landing_page.dart';

import 'package:quiz/util/shared_preference.dart';
import 'package:quiz/util/save_audio.dart';

import 'package:quiz/web_service/put_data.dart';
import 'package:quiz/web_service/authenticate.dart';


void saveAudioIfPreferenceNull() async
{
  var saveData=await getSoundPreference();
    if (saveData==null){
      saveFile();
      saveSoundPreference(true);
    }
}

void tryFunctions(){
  putDataBoolean("Is Baldr Brother of Thor", "True", "mythology");
  putDataMultiple("kcjhzehdfs", "jiofshkfh", "jfxhkfhkshe", "kjdhfkuse", "fejhsbd", "fehshkd");
  //getScore("gat786", "320");
}

void main(){
  saveAudioIfPreferenceNull();
  tryFunctions();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,

    home:new LandingPage()
   
  ));
}