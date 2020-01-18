import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

enum ChangeColorEvent { makeGrey, makeTeal }

class ColorBloc extends Bloc<ChangeColorEvent, Color> {
  @override
  Color get initialState => Colors.teal;

  @override
  Stream<Color> mapEventToState(ChangeColorEvent event) async* {
    switch (event) {
      case ChangeColorEvent.makeTeal:
        yield Colors.teal;
        break;
      case ChangeColorEvent.makeGrey:
        yield Colors.grey;
        break;
    }
  }
}

class BlocExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorBloc>(
      builder: (context) => ColorBloc(),
      child: BlocPage(),
    );
  }
}

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The linter doesn't know the sink gets closed by the BlockProvider
    // ignore: close_sinks
    final ColorBloc counterBloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('BLoC Example'),
      ),
      body: BlocBuilder<ColorBloc, Color>(
        builder: (context, color) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 300,
                    width: 300,
                    color: color,
                    alignment: Alignment.center,
                    child: Text(
                      'A Switch checks which button was pressed and sets the value of an Enum to teal or grey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: Colors.teal,
                      onPressed: () {
                        counterBloc.add(ChangeColorEvent.makeTeal);
                      },
                      child: Icon(Icons.autorenew),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: Colors.grey,
                      onPressed: () {
                        counterBloc.add(ChangeColorEvent.makeGrey);
                      },
                      child: Icon(Icons.autorenew),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
