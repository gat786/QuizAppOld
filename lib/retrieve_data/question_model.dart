class QuestionModel{
  String quest;
  List<String> options;
  String answer;

  QuestionModel(this.quest,this.options,this.answer);

  String get question => quest;
  List<String> get option =>options;
  String get ans =>answer;

}