import 'package:flutter/material.dart';
import './Home.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your Score: ", style: TextStyle(color: Colors.white, fontSize: 50.0),),
          Text(score.toString() + "/" + totalQuestions.toString(), style: TextStyle(color:  Colors.white, fontSize: 50.0),),
          new IconButton(
              icon: new Icon(Icons.arrow_right),
              color: Colors.white,
              iconSize: 50.0,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new Home()), (Route route) => route == null)
          )
        ],
      ),
    );
  }
}