import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This example demonstrates one way to  access three different
/// variables within the same class, this time using a Selector
///
/// For this approach, we extend ChangeNotifier in the Model
/// Any changes to the Model instance *at all* will trigger an update
class SelectorExampleModel extends ChangeNotifier {

  bool _isRed = true;
  bool _isOrange = true;
  bool _isGreen = true;

  bool get isRed => _isRed;
  bool get isOrange => _isOrange;
  bool get isGreen => _isGreen;

  void toggleRed() {
    _isRed = !_isRed;
    notifyListeners();
  }

  void toggleOrange() {
    _isOrange = !_isOrange;
    notifyListeners();
  }

  void toggleGreen() {
    _isGreen = !_isGreen;
    notifyListeners();
  }
}

class SelectorAppExample extends StatefulWidget {
  const SelectorAppExample({Key key}) : super(key: key);

  @override
  _SelectorAppExampleState createState() => _SelectorAppExampleState();
}

class _SelectorAppExampleState extends State<SelectorAppExample> {
  @override
  Widget build(BuildContext context) {

    /// The ChangeNotifierProvider is exposing our Model.
    /// By putting it here, we have access to it throughout the rest of the tree.
    /// Notice  we are not putting it at the base of the app, only at the base of the
    /// tree we need to access it in. This prevents up from "polluting the scope".
    ///
    /// The ChangeNotifierProvider can be anywhere in the tree, as long as
    /// there is a new Context created between it and where we use it.
    return ChangeNotifierProvider(
      builder: (context) => SelectorExampleModel(),
      child: const MaterialApp(

        /// ProviderExampleHome creates a new Context in its build method
        /// giving us the new Context we need
        home: ProviderExampleHome(),
      ),
    );
  }
}

class ProviderExampleHome extends StatelessWidget {
  const ProviderExampleHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text('Selector Demo'),
            ),
            body: Container(
              height: constraints.maxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,

                    /// Here is where the magic happens
                    child: Selector<SelectorExampleModel, bool>(

                      /// From the docs:
                      /// "[Selector] will obtain a value using [Provider.of], then pass that value
                      /// to `selector`. That `selector` callback is then tasked to return an object
                      /// that contains only the informations needed for `builder` to complete." (sic)
                      ///
                      /// When using this your Context names need to be the same in the selector and
                      /// build, but what you really care about is that the name you use for your
                      /// instance in the selector parameter are going to be the names you use within
                      /// the rest of the scope.
                      ///
                      /// The selector is going to return something about our model instance.. here we
                      /// return the State of isRed
                      selector: (localContext, selectorExampleModelInstance) => selectorExampleModelInstance.isRed,
                      builder: (localContext, valueOfSelectedVariable, child) => Container(
                        padding: const EdgeInsets.all(8),
                        height: 150,
                        width: 300,

                        /// And here is where we use the State of isRed
                        color: valueOfSelectedVariable == true ? Colors.red : Colors.grey,

                        /// NOTE: Our ChangeNotifier is going to alert the Selector every time
                        /// anything in the Model changes, not just isRed. A normal Consumer will
                        /// rebuild its chile on any change at all, but the selector will only rebuild
                        /// if the value we told it to select was changed.
                        ///
                        /// So, changes to anything other than isRed will not cause this cube to rebuild,
                        /// only changes to isRed will.
                        ///
                        /// This approach has every selector being notified of every change, then filtering
                        /// those changes. For a different approach that doesn't even notify your tree
                        /// unless the thing that changed is what you care about, see the examples for
                        /// ValueNotifier
                        alignment: Alignment.center,
                        child: Text(
                          'Each update passes in the whole Model/Object.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Selector<SelectorExampleModel, bool>(
                      selector: (localContext, selectorExampleModelInstance) => selectorExampleModelInstance.isOrange,
                      builder: (localContext, valueOfSelectedVariable, child) => Container(
                        padding: const EdgeInsets.all(8),
                        height: 150,
                        width: 300,
                        color: valueOfSelectedVariable == true ? Colors.orange : Colors.grey,
                        alignment: Alignment.center,
                        child: Text(
                          'Each cube is in a Selector that checks to see if',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Selector<SelectorExampleModel, bool>(

                      /// Again, we're naming our model to use this name within our local scope,
                      /// then telling the Selector what we care about by returning its value here.
                      selector: (localContext, selectorExampleModelInstance) => selectorExampleModelInstance.isGreen,
                      builder: (localContext, valueOfSelectedVariable, child) => Container(
                        padding: const EdgeInsets.all(8),
                        height: 150,
                        width: 300,
                        color: valueOfSelectedVariable == true ? Colors.green : Colors.grey,
                        alignment: Alignment.center,
                        child: Text(
                          'what changed was that cube\'s value.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 100,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Spacer(),

                        FloatingActionButton(
                          backgroundColor: Colors.red,

                          /// Our onPressed function is using the same approach as a standard Provider
                          onPressed: () => Provider.of<SelectorExampleModel>(context, listen: false).toggleRed(),
                          child: Icon(Icons.autorenew),
                        ),

                        ///
                        const Spacer(),

                        ///
                        FloatingActionButton(
                          backgroundColor: Colors.orange,
                          onPressed: () => Provider.of<SelectorExampleModel>(context, listen: false).toggleOrange(),
                          child: Icon(Icons.autorenew),
                        ),

                        const Spacer(),

                        ///
                        FloatingActionButton(
                          backgroundColor: Colors.green,
                          onPressed: () => Provider.of<SelectorExampleModel>(context, listen: false).toggleGreen(),
                          child: Icon(Icons.autorenew),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
