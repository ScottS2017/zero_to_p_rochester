import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m08_state_management_overview/widgets/page_layout.dart';
import 'package:provider/provider.dart';

/// Since Provider typically works with types instead of individual variables.
/// This means we can't use this approach with primitives. However, it works
/// very well if we use enums.
enum topCubeColorsListEnum { red, orange, blue, pink, purple, teal }
enum bottomCubeFakeBooleanEnum { isTrue, isFalse }

///
/// Notice that unlike using a ChangeNotifier or ScopedModel, here our object doesn't
/// extend anything. It's the object's members that are doing the notifying.
class ValueNotifierOnePerTypeModel {
  ///
  /// As mentioned above, our types need to be unique, and they are, but notice how each
  /// one is declared inside the constructor of aValueNotifier.
  ///
  /// The reason we can't use the same type more than once here is the same reason we can't
  /// use a type more than once with a regular ChangeNotifier. The Consumer will stop looking
  /// at the first one it finds of the type it's looking for.
  final _topCube = ValueNotifier<topCubeColorsListEnum>(topCubeColorsListEnum.red);
  ValueNotifier<topCubeColorsListEnum> get topCube => _topCube;

  final _bottomCube = ValueNotifier<bottomCubeFakeBooleanEnum>(bottomCubeFakeBooleanEnum.isTrue);
  ValueNotifier<bottomCubeFakeBooleanEnum> get bottomCube => _bottomCube;

  /// These simply cycle through the lists, incrementing once each time they're called
  void toggleCubeOne() {
    _topCube.value = topCubeColorsListEnum.values[(_topCube.value.index + 1) % topCubeColorsListEnum.values.length];
  }

  void toggleCubeTwo() {
    _bottomCube.value =
        bottomCubeFakeBooleanEnum.values[(_bottomCube.value.index + 1) % bottomCubeFakeBooleanEnum.values.length];
  }
}

/// If you're ever using a StatelessWidget and having trouble because the linter complains
/// and you can't make your constructor constant no matter what you try, odds are good you
/// have a state variable in there and that's what making it impossible to have a const constructor.
///
/// This is why we use a StatefulWidget here. Remember, all *Widget* constructors need to be const.
/// But when we use a StatefulWidget, it can be const. It's now the State object that has the state
/// variable, and it's not supposed to be const.
class ValueNotifierOnePerTypeApp extends StatefulWidget {
  const ValueNotifierOnePerTypeApp({Key key}) : super(key: key);

  @override
  _ValueNotifierOnePerTypeAppState createState() => _ValueNotifierOnePerTypeAppState();
}

class _ValueNotifierOnePerTypeAppState extends State<ValueNotifierOnePerTypeApp> {
  ///
  /// We need to provide the model, so we create an instance
  final _model = ValueNotifierOnePerTypeModel();

  @override
  Widget build(BuildContext context) {
    ///
    /// MultiProvider just makes  multiple providers easier to read
    return MultiProvider(
      providers: [
        ///
        /// The Provider approach will expose (provide) the entire model
        Provider<ValueNotifierOnePerTypeModel>(builder: (context) => _model),

        ///
        /// The ValueListenableProvider approach will only provide the value we
        /// tell it to, in this case we're listening only for the top cube's enum value
        ValueListenableProvider<topCubeColorsListEnum>(builder: (context) => _model.topCube),
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
        title: const Text('ValueNotfier Restricted One Per Type'),
      ),
      cubes: <Widget>[
        Consumer<topCubeColorsListEnum>(
          builder: (BuildContext localContext, topCubeColorsListEnum value, Widget child) {
            return Container(
              color: value == topCubeColorsListEnum.red
                  ? Colors.red
                  : value == topCubeColorsListEnum.orange
                      ? Colors.orange
                      : value == topCubeColorsListEnum.blue
                          ? Colors.blue
                          : value == topCubeColorsListEnum.pink
                              ? Colors.pink
                              : value == topCubeColorsListEnum.purple
                                  ? Colors.purple
                                  : value == topCubeColorsListEnum.teal ? Colors.teal : Colors.black,
              alignment: Alignment.center,
              child: Text(
                'Multicolor Enum',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            );
          },
        ),
        Consumer<ValueNotifierOnePerTypeModel>(
          builder: (BuildContext localContext, ValueNotifierOnePerTypeModel model, Widget child) {
            return ValueListenableBuilder<bottomCubeFakeBooleanEnum>(
              valueListenable: model.bottomCube,
              builder: (BuildContext context, bottomCubeFakeBooleanEnum value, Widget child) {
                return Container(
                  color: value == bottomCubeFakeBooleanEnum.isTrue ? Colors.brown : Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'Fake Boolean Enum',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
      buttons: <Widget>[
        Consumer<topCubeColorsListEnum>(
          builder: (BuildContext localContext, topCubeColorsListEnum value, Widget child) {
            return FloatingActionButton(
              backgroundColor: value == topCubeColorsListEnum.red
                  ? Colors.red
                  : value == topCubeColorsListEnum.orange
                      ? Colors.orange
                      : value == topCubeColorsListEnum.blue
                          ? Colors.blue
                          : value == topCubeColorsListEnum.pink
                              ? Colors.pink
                              : value == topCubeColorsListEnum.purple
                                  ? Colors.purple
                                  : value == topCubeColorsListEnum.teal ? Colors.teal : Colors.black,
              onPressed: () => Provider.of<ValueNotifierOnePerTypeModel>(context, listen: false).toggleCubeOne(),
              child: Icon(Icons.autorenew),
            );
          },
        ),
        Consumer<ValueNotifierOnePerTypeModel>(
          builder: (BuildContext localContext, ValueNotifierOnePerTypeModel model, Widget child) {
            return ValueListenableBuilder<bottomCubeFakeBooleanEnum>(
              valueListenable: model.bottomCube,
              builder: (BuildContext context, bottomCubeFakeBooleanEnum value, Widget child) {
                return FloatingActionButton(
                  backgroundColor: value == bottomCubeFakeBooleanEnum.isTrue ? Colors.brown : Colors.transparent,
                  onPressed: () => Provider.of<ValueNotifierOnePerTypeModel>(context, listen: false).toggleCubeTwo(),
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
