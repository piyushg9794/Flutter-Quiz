import 'package:flutter/material.dart';
import './QuizPage.dart';


class Home extends StatelessWidget {

  Widget build (BuildContext context){
    return Material(child :HomeP(),);
  }
}

  class HomeP extends StatefulWidget{

    @override
    State createState() => HomePState();
  }
  class HomePState extends State<HomeP> with SingleTickerProviderStateMixin{

    Animation<Color> colorAnimation;
    AnimationController colorAnimationController;

    @override
    void initState() {
      super.initState();
      colorAnimationController = AnimationController(duration: Duration(seconds: 5), vsync: this);
      colorAnimation = ColorTween(begin: Colors.indigo, end: Colors.black54).animate(colorAnimationController);
      colorAnimation..addListener(() => this.setState(() {}))..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          colorAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          colorAnimationController.forward();
        }
      });
      colorAnimationController.forward();
    }


  @override
  Widget build(BuildContext context){
    return Material(

        color: colorAnimation.value,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => QuizPage()));
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("FLUTTER QUIZ", style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20.0,
                  width: 20.0,
                ),
                Text("START", style: TextStyle(color: Colors.white, fontSize: 30.0),)
              ]
          ),
        ),
    );
  }
}

