import 'package:flutter/material.dart';

class AnimatedIconExample extends StatefulWidget {
  @override
  _AnimatedIconExampleState createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
        this.setState(() {});
      })..addStatusListener((state) => print('$state'));
  }

  void _startAnimation(){
   if(_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FractionallySizedBox(
            heightFactor: 0.2,
            widthFactor: 0.2,
            alignment: const Alignment(0.0, 0.0),
            child: GestureDetector(
              onTap: _startAnimation,
              child: AnimatedIcon(
               icon: AnimatedIcons.add_event,
                progress: _animationController,
                semanticLabel: 'Add Event',
                size: 80.0,
              ),
            ),
        ),
      ],
    );
  }
}
