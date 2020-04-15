import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final option;
  final _onTap;
  final col;

  AnswerButton(this.option, this._onTap, this.col);

  @override
  Widget build(BuildContext context){
    return AnswerBut(option, _onTap, col);
  }
}
class AnswerBut extends StatefulWidget {

  final String option;
  final VoidCallback _onTap;
  final col;

  AnswerBut(this.option, this._onTap, this.col);
  State createState() => AnswerButState();

}

class AnswerButState extends State<AnswerBut> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    animationController.forward();
  }

  @override
  void didUpdateWidget(AnswerBut oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.option != widget.option) {
      animationController.reset();
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 30.0,
        shadowColor: Colors.purpleAccent,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)),
        color: widget.col,
        child: InkWell(
          onTap: () => widget._onTap(),
          child: Center(
            child: FadeTransition(
                opacity: animation,
                child: Text(widget.option, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),),
            ),
          ),
        ),
      ),
    );
  }

}
