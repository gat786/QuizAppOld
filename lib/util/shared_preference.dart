import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveToPreferences(String key,String value) async {
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString(key, value);
  return true;
}

Future<bool> saveSoundPreference(bool value) async {
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setBool("sound", value);
  print("Sound is "+value.toString());
  return true;
}



Future<bool> getSoundPreference() async { 
  SharedPreferences prefs=await SharedPreferences.getInstance();
  bool value=prefs.getBool("sound");
  print("Sound is "+value.toString());
  return value;
}

Future<String> getNamePreference()async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  String name=prefs.getString("name");
  return name;
}

Future<bool> checkUserExists() async {
  SharedPreferences prefs=await SharedPreferences.getInstance();
  String name=prefs.getString("name");
  String email=prefs.getString("email");
  if( name.isNotEmpty && email.isNotEmpty){
    return true;
  }
  return false;
}

Future<bool> checkScoreUploaded(int score) async {
  bool isSaved;
  SharedPreferences prefs=await SharedPreferences.getInstance();
  int scoreRetrieved=prefs.getInt("uploadedScore");
  if (score==scoreRetrieved){
    isSaved=true;
  }
  else{isSaved=false;}
  return isSaved;
}

Future<bool> saveScoreUploaded(int score) async {
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setInt("uploadedScore", score);
  return true;
}

Future<bool> saveUserRegistrationDetails(String name,String password,String email)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString("username", name);
  prefs.setString("email", email);
  prefs.setString("password", password);
  return true;
}


Future<bool> saveUserLoginDetails(String name,String password)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString("username", name);
  prefs.setString("password", password);
  return true;
}