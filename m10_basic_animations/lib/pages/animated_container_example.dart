import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  Color currentColor;
  double currentHeight;
  double currentWidth;
  double currentHorizontalPadding;
  double currentVerticalPadding;

  void changeColor() {
    if (currentColor == Colors.blue) {
      currentColor = Colors.green;
    } else if (currentColor == Colors.green) {
      currentColor = Colors.red;
    } else if (currentColor == Colors.red) {
      currentColor = Colors.yellow;
    } else {
      currentColor = Colors.blue;
    }
    setState(() {});
  }

  void changeHeight() {
    if (currentHeight == 300) {
      currentHeight = 250;
    } else if (currentHeight == 250) {
      currentHeight = 200;
    } else if (currentHeight == 200) {
      currentHeight = 150;
    } else {
      currentHeight = 300;
    }
    setState(() {});
  }

  void changeWidth() {
    if (currentWidth == 300) {
      currentWidth = 250;
    } else if (currentWidth == 250) {
      currentWidth = 200;
    } else if (currentWidth == 200) {
      currentWidth = 150;
    } else {
      currentWidth = 300;
    }
    setState(() {});
  }

  void changeHorizontalPadding() {
    if (currentHorizontalPadding == 50) {
      currentHorizontalPadding = 25;
    } else if (currentHorizontalPadding == 25) {
      currentHorizontalPadding = 10;
    } else {
      currentHorizontalPadding = 50;
    }
    setState(() {});
  }

  void changeVerticalPadding() {
    if (currentVerticalPadding == 50) {
      currentVerticalPadding = 25;
    } else if (currentVerticalPadding == 25) {
      currentVerticalPadding = 10;
    } else {
      currentVerticalPadding = 50;
    }
    setState(() {});
  }

  @override
  void initState() {
    currentColor = Colors.blue;
    currentHeight = 300;
    currentWidth = 300;
    currentHorizontalPadding = 50;
    currentVerticalPadding = 50;
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
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 1000,
              ),
              height: currentHeight,
              width: currentWidth,
              padding: EdgeInsets.symmetric(
                vertical: currentVerticalPadding,
                horizontal: currentHorizontalPadding,
              ),
              color: currentColor,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.black,
                child: const Text(
                  'Black is a child Container',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: changeColor,
            child: Container(
              height: 50,
              width:175,
              alignment: Alignment.center,
              child: const Text(
                'Change Color',
                textAlign: TextAlign.center,
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
                    onPressed: changeHeight,
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
                    onPressed: changeWidth,
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: changeVerticalPadding,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        'Change Vertical Padding',
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
                    onPressed: changeHorizontalPadding,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        'Change Horizontal Padding',
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
          const Spacer(),
        ],
      ),
    );
  }
}
