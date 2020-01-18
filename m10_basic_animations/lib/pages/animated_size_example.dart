import 'package:flutter/material.dart';

class AnimatedSizeExample extends StatefulWidget {
  @override
  _AnimatedSizeExampleState createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample> with SingleTickerProviderStateMixin {
  double _height;
  double _width;
  double _opacity;

  void _changeHeight() {
    if (_height == 300) {
      _height = 100;
    } else {
      _height = 300;
    }
    setState(() {});
  }

  void _changeWidth() {
    if (_width == 300) {
      _width = 50;
    } else {
      _width = 300;
    }
    setState(() {});
  }

  void _changeOpacity(){
    _opacity == 1.0 ? _opacity = 0.1 : _opacity = 1.0;
    setState(() {});
  }


  @override
  void initState() {
    _opacity = 1.0;
    _height = 300;
    _width = 300;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 500,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50),
            alignment: Alignment.center,

            /// **************************************************************
            /// Better to think of this as an animated clipper

            child: Container(
              color: Colors.blue,
              child: AnimatedSize(
                vsync: this,
                duration: const Duration(seconds: 2),
                alignment: Alignment.bottomLeft,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: _opacity,
                  child: Container(
                    height: _height,
                    width: _width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.yellow],
                          stops: [0.5, 0.5],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: _changeHeight,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        'Change Height',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: _changeWidth,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        'Change Width',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: _changeOpacity,
            child: const FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.center,
              child: Text(
                'Change Opacity',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
