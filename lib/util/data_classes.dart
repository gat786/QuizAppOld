class SingleAnswer{
  
  String answer,question,subject;

  SingleAnswer(this.answer,this.question,this.subject);

  SingleAnswer.withoutSubject(this.answer,this.question);

  Map<String, dynamic> toJson() =>
    {
      'answer': answer,
      'question': question,
      'subject': subject
    };

}

class MultipleAnswer{
  
  String answer,question,option1,option2,option3,subject;

  MultipleAnswer(this.answer,this.question,this.option1,this.option2,this.option3,this.subject);

  MultipleAnswer.withoutSubject(this.answer,this.question,this.option1,this.option2,this.option3);

  Map<String, dynamic> toJson() =>
    {
      'answer': answer,
      'question': question,
      'option1':option1,
      'option2':option2,
      'option3':option3,
      'subject': subject
    };

}

class UserProfile{
  String username,email,password;

  UserProfile(this.username,this.email,this.password);

  UserProfile.withoutEmail(this.username,this.password);
}

class ScoreModel{
  String username,score;

  ScoreModel(this.username,this.score);
}