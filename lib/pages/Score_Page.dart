import 'package:flutter/material.dart';
import 'landing_page.dart';

class ScorePage extends StatelessWidget{
    int _score;
    int _totalQuestion;
    ScorePage(this._score,this._totalQuestion);

  @override
  Widget build(BuildContext context){

     return new Material(
       color: Colors.cyanAccent,
       child: new Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           new Text("Score",style: TextStyle(color: Colors.black54,fontSize: 40.0,fontWeight: FontWeight.bold),),
           new Text(_score.toString() +"/"+_totalQuestion.toString(),style: TextStyle(color: Colors.blue,fontSize: 40.0,fontWeight: FontWeight.bold),),
           new IconButton(

               icon: new Icon(Icons.arrow_back),
               color: Colors.black,
               iconSize: 50.0,
               onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context )=> new LandingPage()), (Route route)=>route==null)

           )
         ],
       ),
     );
  }
}