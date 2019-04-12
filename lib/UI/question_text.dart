import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget{
  final String _question;
  final int _questionNumber;
  QuestionText(this._question,this._questionNumber);

  @override
  State createState()=>new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin{

  Animation<double> _fontSizeAnimation;
  AnimationController _fontAnimationController;

  @override

  void initState(){
    super.initState();
    _fontAnimationController=new AnimationController(duration: new Duration(milliseconds: 500),vsync: this);
    _fontSizeAnimation=new CurvedAnimation(parent: _fontAnimationController, curve: Curves.easeInOut);
    _fontSizeAnimation.addListener(()=>this.setState(() {}));
    _fontAnimationController.forward();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question){
      _fontAnimationController.reset();
      _fontAnimationController.forward();
    }
  }
  @override
  void dispose(){
    _fontAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return    new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text("Statement " + widget._questionNumber.toString()+ " :"+widget._question
          ,style: new TextStyle(fontSize: _fontSizeAnimation.value*15),
          ),
        ),
      ),
    );
  }
}