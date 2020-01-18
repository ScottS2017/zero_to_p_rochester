import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  @override
  _AnimatedSwitcherExampleState createState() => _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  Widget _child;

  /// If you're changing between 2 widgets of the same type then if there is no key, it won't work
  /// because it's checking for changes in the element layer, meaning it's just seeing the same type twice.
  /// It needs a key to tell it there was a change
  final Widget _blueBox = Container(key: const Key('blueKey'), color: Colors.blue);
  final Widget _yellowBox = Container(key: const Key('yellowKey'), color: Colors.yellow);
  final Icon _addIcon = const Icon(Icons.add) ;
  final Text _anyText = const Text('This can be ANYTHING!') ;

  @override
  void initState() {
    super.initState();
    _child = _blueBox;
  }

  void _changeFirstBox() {
    setState(() {
      _child == _blueBox ?
      _child = _addIcon :
      _child == _addIcon ?
      _child = _anyText :
      _child == _anyText ?
        _child = _yellowBox :
        _child = _blueBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(50),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _changeFirstBox,

        /// The default animation is a fade
        child: AnimatedSwitcher(
          duration: const Duration(
            seconds: 1,
          ),
          child: _child,
        ),
      ),
    );
  }
}
