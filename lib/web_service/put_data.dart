import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const String base_url="https://quizapprestapi.herokuapp.com/webapi";


Future<String> putDataMultiple(String question,String answer,String option1,String option2,String option3,String subject) async {
  var header=Map<String,String>();
  header["Content-Type"]="application/json";
  var body='''
    {
      "question"=question,
      "answer"=answer,
      "option1"=option1,
      "option2"=option2,
      "option3"=option3,
      "subject"=subject
    }
  ''';
  var scores = jsonEncode(body);
  final response=await http.post(base_url+"/multiple",headers: header,body: scores);
  print(response.body);
  return response.body;
}

Future<String> putDataBoolean(String question,String answer,String subject) async {
  var header=Map<String,String>();
  header["Content-Type"]="application/json";
  var body='''
    {
      "question"=$question,
      "answer"=$answer,
      "subject"=$subject
    }
  ''';
  var scores = jsonEncode(body);
  final response=await http.post(base_url+"/boolean",headers: header,body: scores);
  print(response.body);
  return response.body;
}