import 'package:flutter/material.dart';

@immutable
class PracticePartOneSolution extends StatelessWidget {
  const PracticePartOneSolution({
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
        body:
            // TODO 1) Create a blue Container that uses calculatedHeight and calculatedWidth
            Container(
          height: calculatedHeight,
          width: calculatedWidth,
          color: Colors.blue,
          // TODO 2) Give it a child Container that has height and width double.infinity, is grey and has margin of 8
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            margin: const EdgeInsets.all(8),

              // TODO 3) Give it a yellow child Container that is height & width double.infinity and has symmetric margins of 25 vertical and 50 horizontal
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.yellow,
                margin: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 20,
                ),
                // TODO 4) Give it a child FractionallySizedBox that has a heightFactor of 75%, a widthFactor of 90% and is topCenter aligned
                child: FractionallySizedBox(
                  heightFactor: 0.75,
                  widthFactor: 0.90,
                  alignment: Alignment.topCenter,
                  // TODO 5) Give it a brown child Container that is aligns its child bottom center and has padding of 50 top, 16 left and 24 right
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.brown,
                    // TODO 6) Give it a white child Container that is height and width double.infinity, has a center alignment and margin all around of 16
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.white,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(16),
                      // TODO 7) Give it a pink child Container that has a margin of 16 all the way around and padding of 50 top, 10 bottom, 20 left and 20 right
                      child: Container(
                        color: Colors.pink,
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.only(
                          top: 50,
                          bottom: 10,
                          left: 20,
                          right: 20,
                        ),
                        // TODO8) Give it a black child Container that has horizontal padding of 30 and is center aligned
                        child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          alignment: Alignment.center,
                          // TODO 9) Give it a child FractionallySizedBox that has a heightFactor of 50%
                          child: FractionallySizedBox(
                            heightFactor: 0.50,
                            // TODO 10) Give it a white child Container that is center aligned. Do not specify a height or width
                            child: Container(
                              color: Colors.white,
                              alignment: Alignment.center,
                              // TODO 11) Give it a child Text that that says 'All done!', with the text aligned center
                              child: Text(
                                '${calculatedHeight - 200}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
