 import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import 'Score_Page.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState()=>new QuizPageState();
}
class QuizPageState extends State<QuizPage>{

  Question currentQuestion;
  Quiz quiz = new Quiz(
    [
    new Question( "Elon Musk is human",false),
      new Question("qizza is healthy", false),
      new Question("Flutter is awesome", true),
      new Question("Nishant kumar is CHAMPA", true),
      //new Question("Nishant kumar is ", answer)
    ]
  );

  String questionText;
  int QuestionNumber;
  bool iscorrect;
  bool overlayShouldbevisible = false;
  @override
  void initState(){
    super.initState();
    currentQuestion=quiz.nextQuestion;
    questionText=currentQuestion.question;
    QuestionNumber=quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    iscorrect = (answer==currentQuestion.answer);
    quiz.answer(iscorrect);
    this.setState((){
      overlayShouldbevisible =true;
    });
  }

  @override
   Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
           new QuestionText(questionText,QuestionNumber),
           new AnswerButton(false,() => handleAnswer(false))
          ],
        ),
       overlayShouldbevisible ==true ? new CorrectWrongOverlay(
         iscorrect,
           (){
              currentQuestion=quiz.nextQuestion;
              this.setState((){
                if(currentQuestion ==null) {
                  Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
                      builder: (BuildContext context) => new ScorePage(quiz.score,quiz.length)),(Route route)=>route==null);
                  return;
                }
                overlayShouldbevisible=false;
                questionText = currentQuestion.question;
                QuestionNumber = quiz.questionNumber;
              });
           }

       ) : new Container()
      ],
    );
  }
}