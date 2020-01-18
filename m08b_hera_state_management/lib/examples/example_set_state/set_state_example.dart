import 'package:flutter/material.dart';
import 'package:m08_state_management_overview/widgets/page_layout.dart';

class SetStateDemo extends StatefulWidget {
  const SetStateDemo({
    Key key,
  }) : super(key: key);

  @override
  _SetStateDemoState createState() => _SetStateDemoState();
}

class _SetStateDemoState extends State<SetStateDemo> {
  /// Normally we would instantiate here and not leave things null but we're doing it this
  /// way in the course to get you used to using initState properly. If we don't instantiate
  /// when declaring, your code will crash if you try to run without properly using initState
  bool _isPurple;

  /// Any function that changes something is going to change the State. The only way to reflect
  /// this in the UI is to make sure we rebuild our Widget after we make a change.
  void _changeColor() {
    /// Notice that setState isn't only handling the rebuilding, it's setting the new State by
    /// using an anonymous callback, *then* it will rebuild.
    setState(() {
      _isPurple = !_isPurple;

      /// Now that everything in our callback is complete, re-run the build function.
      /// This will completely destroy our Widget and rebuild a new one with our new value
    });
  }

  /// initState exists for a reason so use it!
  @override
  void initState() {
    _isPurple = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Set State Demo'),
      ),
      cubes: <Widget>[
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 100),
              height: constraints.maxHeight,
              width: constraints.maxWidth,

              /// Here is where we make a decision based on the state of _isPurple
              color: _isPurple ? Colors.purple : Colors.grey,
              alignment: Alignment.topCenter,
              child: Text(
                'setState is fine within a single Widget, but can become an organizational nightmare very quickly if you have more than a handful of Widgets',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            );
          },
        ),
      ],
      buttons: <Widget>[
        FloatingActionButton(
          /// Since everything is contained within this Widget's own scope,
          /// we can call _changeColor directly, without the need to use any
          /// other mechanism involved in other State Management approaches
          onPressed: _changeColor,
          backgroundColor: Colors.purple,
          child: Icon(Icons.autorenew),
        ),
      ],
    );
  }
}
