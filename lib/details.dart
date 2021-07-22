import 'class.dart';


class Details{
  int _questionNumber = 0;

  List<Question> _questionList = [
    Question(qtn: 'Some cats are allergic to human', ans: false),
    Question(qtn: 'You can lead a cow downstairs but not upstairs', ans: true),
    Question(qtn: "A slug's blood is green",ans: true),
    Question(qtn: 'Do camels have three sets of eyelids?', ans: true),
    Question(qtn: 'The highest number of shopping malls can be found in New Jersey.', ans: true),
    Question(qtn: 'Is it possible to sneeze while asleep', ans: false),
    Question(qtn: 'There is no railway system in Iceland.', ans: true),
    Question(qtn: "A group of crows is called a ‘murder’.", ans: false),
  ];

  dynamic nextQuestion(){
    if(_questionNumber < _questionList.length - 1){
      print(_questionNumber);
      _questionNumber++;
    }else{
      bool completed = true;
      return completed;
    }
  }

  String getQuestionText(){
    return _questionList[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questionList[_questionNumber].questionAnswer;
  }

}