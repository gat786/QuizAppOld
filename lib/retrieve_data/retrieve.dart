import 'dart:async';
import 'dart:convert';
import 'question_model.dart';
import 'package:http/http.dart' as http;

String url="https://opentdb.com/api.php?amount=10&category=17&difficulty=easy&type=multiple";

Future<List> fetchPost(String urlQuestions) async{
  url=urlQuestions;
  http.Response response = await http.get(url);
  print(jsonDecode(response.body));

  Map<String,dynamic> data = jsonDecode(response.body);
  List required=data["results"];
  
  return required;
}

List<QuestionModel> questionsAnswers(List requiredList){
  int n=requiredList.length;
  List<QuestionModel> returningData;
  while(n!=0){
    List optionsList= requiredList[n]["correct_answer"]+requiredList[n]["incorrect_answers"];
    optionsList.shuffle();
    QuestionModel a=new QuestionModel(requiredList[n]["question"],optionsList,requiredList[n]["correct_answer"] );
    returningData.add(a);
    n=n-1;
  }
  return returningData;
}


