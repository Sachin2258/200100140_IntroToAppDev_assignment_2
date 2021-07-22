//dart=2.9
import 'package:flutter/material.dart';
import 'package:quiz_assignment2/class.dart';
import 'details.dart';


void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}
// Note that the above class calls the QuizPage class 

//Here in the QuizPage class, we build teh widgets that actually //displays the questions and buttons
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
  List<Icon> scores = [];
  
  Details quizClass = Details();

  void Answercheck(bool userAnswer) {
    bool? correctAns = quizClass.getQuestionAnswer();
    setState(() {
      if (quizClass.nextQuestion() == true) {
        if (userAnswer == correctAns) {
          scores.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scores.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      } else {
        if (userAnswer == correctAns) {
          scores.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scores.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildQuestionsPage();
  }

  Column buildQuestionsPage() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizClass.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.black,
                  color: Colors.blue,
                  onPressed: () {
                    Answercheck(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    Answercheck(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          SafeArea(
            child: Row(
              children: scores,
            ),
          )
        ],
      );
  }
}