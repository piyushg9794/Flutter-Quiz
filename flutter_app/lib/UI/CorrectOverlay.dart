import 'package:flutter/material.dart';

class CorrectOverlay extends StatefulWidget {

  final bool _iscorrect;
  final VoidCallback _onTap;
  CorrectOverlay(this._iscorrect, this._onTap);

  @override
  State createState() => CorrectOverlayState();
}

class CorrectOverlayState extends State<CorrectOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(duration: Duration(seconds: 2), vsync:this);
    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                  angle: _iconAnimation.value * 2* 3.14,
                  child: Icon(widget._iscorrect == true ? Icons.done: Icons.clear, size: _iconAnimation.value * 80.0,),
              ),
            ),
            Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            Text(widget._iscorrect == true ? "Correct !": "Wrong !", style: TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}