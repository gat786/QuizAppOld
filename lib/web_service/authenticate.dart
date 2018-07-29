import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const String base_url="https://quizapprestapi.herokuapp.com/webapi";


Future<String> registerUser(String username,String email,String password)async{
    var header=Map<String,String>();
  header["Content-Type"]="application/json";
  var body='''
    {
      "username"=$username,
      "email"=$email,
      "password"=$password
    }
  ''';
  var scores = jsonEncode(body);
  final response=await http.post(base_url+"/register",headers: header,body: scores);
  print(response.body);
  return response.body;
}

Future<String> loginUser(String username,String password)async{
    var header=Map<String,String>();
  header["Content-Type"]="application/json";
  var body='''
    {
      "username"=$username,
      "password"=$password
    }
  ''';
  var scores = jsonEncode(body);
  final response=await http.post(base_url+"/login",headers: header,body: scores);
  print(response.body);
  return response.body;
}

Future<String> getScore(String username,String score)async{
    var header=Map<String,String>();
  header["Content-Type"]="application/json";
  var body='''
    {
      "username"=$username,
      "score"=$score
    }
  ''';
  var scores = jsonEncode(body);
  final response=await http.post(base_url+"/score",headers: header,body: scores);
  print(response.body);
  return response.body;
}