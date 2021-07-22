class Question {
 late final String questionText;
 late final  bool questionAnswer;

  Question({required String qtn, required bool ans}) {
    questionText = qtn;
    questionAnswer = ans;
  }
}