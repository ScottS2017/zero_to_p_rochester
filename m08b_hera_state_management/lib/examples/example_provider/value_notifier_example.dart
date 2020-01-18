import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m08_state_management_overview/widgets/page_layout.dart';
import 'package:provider/provider.dart';

/// Since Provider typically works with types instead of individual variables,
/// one way to do things is to make enums.
enum cube1MulticolorWithEnum { red, orange, blue, pink, purple, teal }
enum cube2FakeBoolWithEnum { isTrue, isFalse }

class ValueNotifierExampleModel {

  /// Initialize our variables. We'll use these first two to represent our enums.
  /// This is significant because with some approaches the types we use have to be
  /// unique, and one way to get around this is to use enums, even if we give
  /// them only two possible values, simulating boolean (as with cube2).
  final _cubeOneMulticolor = ValueNotifier<cube1MulticolorWithEnum>(cube1MulticolorWithEnum.red);
  ValueNotifier<cube1MulticolorWithEnum> get cubeOne => _cubeOneMulticolor;
  ///
  final _cubeTwoFakeBool = ValueNotifier<cube2FakeBoolWithEnum>(cube2FakeBoolWithEnum.isTrue);
  ValueNotifier<cube2FakeBoolWithEnum> get cubeTwo => _cubeTwoFakeBool;

  /// As an example of how we can have more than one ValueNotifier of the same Type,
  /// we'll also use a couple of plain normal bools
  final _cubeThree = ValueNotifier<bool>(true);
  final _cubeFour = ValueNotifier<bool>(true);
  

  ValueNotifier<bool> get cube3 => _cubeThree;
  ValueNotifier<bool> get cube4 => _cubeFour;

  /// ***************************************************************

  /// Logic: The first two are enums, so we cycle through their values.
  /// The last one is a bool we can toggle.
  void toggleCubeOne() {
    _cubeOneMulticolor.value = cube1MulticolorWithEnum.values[(_cubeOneMulticolor.value.index + 1) % cube1MulticolorWithEnum.values.length];
  }

  void toggleCubeTwo() {
    _cubeTwoFakeBool.value = cube2FakeBoolWithEnum.values[(_cubeTwoFakeBool.value.index + 1) % cube2FakeBoolWithEnum.values.length];
  }

  void toggleCubeThree() {
    _cubeThree.value = !_cubeThree.value;
  }

  void toggleCubeFour() {
    _cubeFour.value = !_cubeFour.value;
  }
}

/// ***************************************************************

class ValueNotifierAppExample extends StatefulWidget {
  const ValueNotifierAppExample({Key key}) : super(key: key);

  @override
  _ValueNotifierAppExampleState createState() => _ValueNotifierAppExampleState();
}

class _ValueNotifierAppExampleState extends State<ValueNotifierAppExample> {

  /// We need to provide the model, so we create an instance
  final _model = ValueNotifierExampleModel();

  @override
  Widget build(BuildContext context) {

    /// MultiProvider just makes  multiple providers easier to read
    return MultiProvider(
      providers: [
        Provider<ValueNotifierExampleModel>(builder: (context) => _model),
        ValueListenableProvider<cube1MulticolorWithEnum>(builder: (context) => _model.cubeOne),
      ],
      child: const MaterialApp(
        home: ValueNotifierExampleHome(),
      ),
    );
  }
}

class ValueNotifierExampleHome extends StatelessWidget {
  const ValueNotifierExampleHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('ValueNotfier Demo'),
      ),
      cubes: <Widget>[
        Consumer<cube1MulticolorWithEnum>(
          builder: (BuildContext localContext, cube1MulticolorWithEnum value, Widget child) {
            return Container(
              color: value == cube1MulticolorWithEnum.red
                  ? Colors.red
                  : value == cube1MulticolorWithEnum.orange
                ? Colors.orange
                : value == cube1MulticolorWithEnum.blue
                ? Colors.blue
                : value == cube1MulticolorWithEnum.pink
                ? Colors.pink
                : value == cube1MulticolorWithEnum.purple
                ? Colors.purple
                : value == cube1MulticolorWithEnum.teal
                ? Colors.teal
                : Colors.black,
            );
          },
        ),
        Consumer<ValueNotifierExampleModel>(
          builder: (BuildContext localContext, ValueNotifierExampleModel model, Widget child) {
            return ValueListenableBuilder<cube2FakeBoolWithEnum>(
              valueListenable: model.cubeTwo,
              builder: (BuildContext context, cube2FakeBoolWithEnum value, Widget child) {
                return Container(
                  color: value == cube2FakeBoolWithEnum.isTrue
                    ? Colors.brown
                    :  Colors.transparent,
                );
              },
            );
          },
        ),
        Consumer<ValueNotifierExampleModel>(
          builder: (BuildContext localContext, ValueNotifierExampleModel model, Widget child) {
            return ValueListenableBuilder<bool>(
              valueListenable: model.cube3,
              builder: (BuildContext context, bool value, Widget child) {
                return Container(
                  color: value == true ? Colors.yellow : Colors.grey,
                );
              },
            );
          },
        ),
        Consumer<ValueNotifierExampleModel>(
          builder: (BuildContext localContext, ValueNotifierExampleModel model, Widget child) {
            return ValueListenableBuilder<bool>(
              valueListenable: model.cube4,
              builder: (BuildContext context, bool value, Widget child) {
                return Container(
                  color: value == true ? Colors.cyan : Colors.black,
                );
              },
            );
          },
        ),
      ],
      buttons: <Widget>[
        Consumer<cube1MulticolorWithEnum>(
          builder: (BuildContext localContext, cube1MulticolorWithEnum value, Widget child) {
            return
              FloatingActionButton(
                backgroundColor: value == cube1MulticolorWithEnum.red
              ? Colors.red
                : value == cube1MulticolorWithEnum.orange ? Colors.orange : value == cube1MulticolorWithEnum.blue ? Colors.blue : value == cube1MulticolorWithEnum.pink
              ? Colors.pink
                : value == cube1MulticolorWithEnum.purple ? Colors.purple : value == cube1MulticolorWithEnum.teal ? Colors.teal : Colors.black,
                onPressed: () => Provider.of<ValueNotifierExampleModel>(context, listen: false).toggleCubeOne(),
                child: Icon(Icons.autorenew),
              );
          },
        ),
        Consumer<ValueNotifierExampleModel>(
          builder: (BuildContext localContext, ValueNotifierExampleModel model, Widget child) {
            return ValueListenableBuilder<cube2FakeBoolWithEnum>(
              valueListenable: model.cubeTwo,
              builder: (BuildContext context, cube2FakeBoolWithEnum value, Widget child) {
                return FloatingActionButton(
                  backgroundColor:  value == cube2FakeBoolWithEnum.isTrue
                    ? Colors.brown
                    : Colors.transparent,
                  onPressed: () => Provider.of<ValueNotifierExampleModel>(context, listen: false).toggleCubeTwo(),
                  child: Icon(Icons.autorenew),
                );
              },
            );
          },
        ),
        Consumer<ValueNotifierExampleModel>(
          builder: (BuildContext localContext, ValueNotifierExampleModel model, Widget child) {
            return ValueListenableBuilder<bool>(
              valueListenable: model.cube3,
              builder: (BuildContext context, bool value, Widget child) {
                return  FloatingActionButton(
                  backgroundColor: value == true ? Colors.yellow : Colors.grey,
                  onPressed: () => Provider.of<ValueNotifierExampleModel>(context, listen: false).toggleCubeThree(),
                  child: Icon(Icons.autorenew),
                );
              },
            );
          },
        ),
        Consumer<ValueNotifierExampleModel>(
          builder: (BuildContext localContext, ValueNotifierExampleModel model, Widget child) {
            return ValueListenableBuilder<bool>(
              valueListenable: model.cube4,
              builder: (BuildContext context, bool value, Widget child) {
                return  FloatingActionButton(
                  backgroundColor: value == true ? Colors.cyan : Colors.black,
                  onPressed: () => Provider.of<ValueNotifierExampleModel>(context, listen: false).toggleCubeFour(),
                  child: Icon(Icons.autorenew),
                );
              },
            );
          },
        ),
      ],
    );
  }
}