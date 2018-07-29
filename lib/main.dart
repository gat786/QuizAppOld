import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/see_leaders.dart';

import 'package:quiz/util/shared_preference.dart';
import 'package:quiz/util/save_audio.dart';


void saveAudioIfPreferenceNull() async
{
  var saveData=await getSoundPreference();
    if (saveData==null){
      saveFile();
      saveSoundPreference(true);
    }
}

void main(){
  saveAudioIfPreferenceNull();
  
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,

    home:new SeeLeaders()
   
  ));
}