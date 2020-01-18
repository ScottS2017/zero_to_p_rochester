import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This is normally in another file, and requires either the
/// foundation.dart import Or, what we need is also included in the
/// provider.dart import (used here)
class ProviderExampleModel extends ChangeNotifier {
  bool _isRed = true;

  bool get isRed => _isRed;

  void toggleProviderModelColor() {
    // First, increment the counter
    _isRed = ! _isRed;

    // Then notify all the listeners.
    notifyListeners();
  }
}

class ProviderAppExample extends StatelessWidget {
  const ProviderAppExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ProviderExampleModel(),
      child: const MaterialApp(
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Provider Demo'),
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Consumer<ProviderExampleModel>(
          builder: (context, model, child) => Container(
            height: 300,
            width: 300,
            color: model.isRed == true ? Colors.red : Colors.grey,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
          onPressed: () => Provider.of<ProviderExampleModel>(context, listen: false).toggleProviderModelColor(),
          child: Icon(Icons.autorenew),
        ),
      );
  }
}