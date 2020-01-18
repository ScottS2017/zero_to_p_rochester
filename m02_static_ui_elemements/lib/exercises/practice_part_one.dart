import 'package:flutter/material.dart';

@immutable
class PracticePartOne extends StatelessWidget {
  const PracticePartOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double calculatedHeight = MediaQuery.of(context).size.height;
    final double calculatedWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Practice Part 1'),
        ),
        body: const Placeholder(
          fallbackHeight: 500,
          fallbackWidth: 500,
        ),
        // TODO 1) Create a blue Container that uses calculatedHeight and calculatedWidth

        // TODO 2) Give it a child Container that has height and width double.infinity, is grey and has margin of 8

        // TODO 3) Give it a yellow child Container that is height & width double.infinity and has symmetric margins of 25 vertical and 50 horizontal

        // TODO 4) Give it a child FractionallySizedBox that has a heightFactor of 75%, a widthFactor of 90% and is topCenter aligned

        // TODO 5) Give it a brown child Container that is aligns its child bottom center and has padding of 50 top, 16 left and 24 right

        // TODO 6) Give it a white child Container that is height and width double.infinity, has a center alignment and margin all around of 16

        // TODO 7) Give it a pink child Container that has a margin of 16 all the way around and padding of 50 top, 10 bottom, 20 left and 20 right

        // TODO 8) Give it a black child Container that has horizontal padding of 30 and is center aligned

        // TODO 9) Give it a child FractionallySizedBox that has a heightFactor of 50%

        // TODO 10) Give it a white child Container that is center aligned. Do not specify a height or width

        // TODO 11) Give it a child Text that that says 'All done!', with the text aligned center
      ),
    );
  }
}
