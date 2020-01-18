import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final List<Widget> cubes;
  final List<Widget> buttons;

  const PageLayout({
    Key key,
    this.appBar,
    @required this.cubes,
    @required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Spacer(),
              for (final individualCube in cubes) ...[
                Expanded(
                  flex: 20,
                  child: individualCube,
                ),
                const Spacer(),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: buttons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
