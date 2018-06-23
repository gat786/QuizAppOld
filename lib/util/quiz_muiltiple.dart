import './question_multiple.dart';

class QuizMultiple{
  List<QuestionMultiple> _questions;
  int _currentQuestionNumber;
  int _score,_length;

  QuizMultiple(this._questions){
    _currentQuestionNumber=1;
    _score=0;
    _questions.shuffle();
    _length=_questions.length;
  }

  int get score => _score;

  int get currentQuestionNumber => _currentQuestionNumber;

  QuestionMultiple get question => _questions[currentQuestionNumber-1];

  QuestionMultiple get nextQuestion{
    _currentQuestionNumber=_currentQuestionNumber+1;
    return (isNextAvailable)?_questions[currentQuestionNumber-1]:null;
  }

  int get lengthQuestions => _questions.length;

  bool get isNextAvailable{return (currentQuestionNumber<=_length)?true:false;}

  void answer(bool isCorrect){
    (isCorrect)?_score=_score+1:_score=_score;
  }
}