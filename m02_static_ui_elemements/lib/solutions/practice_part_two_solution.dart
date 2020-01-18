import 'package:flutter/material.dart';

@immutable
class PracticePartTwoSolution extends StatelessWidget {
  const PracticePartTwoSolution({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Practice Part 2'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //
                  // TODO 1) Create a Container that is 150 high. It's width is take care of by CrossAxisAlignment.stretch. Make it grey
                  Container(
                    height: 150,
                    color: Colors.grey,
                    //
                    // TODO 2) Now give this Container margin of 16 on the bottom, padding on the right of 24, and centerRight alignment
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.only(right: 24),
                    alignment: Alignment.centerRight,
                    //
                    // TODO 3) Give it a blue child Container that's 100x100
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ),
                  //
                  // TODO 4) Create a yellow Container 150 high, center aligned, 16 bottom margin
                  Container(
                    height: 150,
                    color: Colors.yellow,
                    margin: const EdgeInsets.only(bottom: 16),
                    alignment: Alignment.center,
                    //
                    // TODO 5) Give it an Icon for a child. Icons take a positional parameter that you put the type 'Icons' in.
                    // Scroll down the list until you find 'wrap_text' and use it. Make it size 64 and black54.
                    child: Icon(
                      Icons.wrap_text,
                      size: 64,
                      color: Colors.black54,
                    ),
                  ),
                  //
                  // TODO 7) Create a red[800] Container 150 high, centerLeft aligned, bottom margin 16 and padding is 32 left, 20 both top and bottom
                  Container(
                    height: 150,
                    color: Colors.red[800],
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.only(left: 32, top: 20, bottom: 20),
                    alignment: Alignment.centerLeft,
                    //
                    // TODO 8) Give it an AspectRatio for a child and set the ratio to 16/9 (CNTL+Space)
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      //
                      // TODO 9) Give the AspectRatio a child that's a green Container, no height or width. Watch what happens, discuss why
                      /// How is the AspectRatio working here and how is the green Container's size being determined?
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  //
                  // TODO 10) Create a grey[800] Container that's 150 high, bottom margin 16, aligned topCenter
                  Container(
                    height: 150,
                    color: Colors.grey[800],
                    margin: const EdgeInsets.only(bottom: 16),
                    alignment: Alignment.topCenter,
                    //
                    // TODO 11) Give it a RotatedBox with 90 degrees rotation
                    child: RotatedBox(
                      quarterTurns: 1,
                      //
                      // TODO 12) Make it's child a white60 Container that's 30 high and 100 wide
                      /// Briefly discuss what happens and why.
                      child: Container(
                        height: 30,
                        width: 100,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  //
                  // TODO 13) Create a purple Container 150 high, margin 16 bottom and align it with numbers of -0.8 and +0.25
                  Container(
                    height: 150,
                    color: Colors.purple,
                    margin: const EdgeInsets.only(bottom: 16),

                    /// Notice that the positive 25 is going down... it's negatives that go up in the vertical axis
                    /// Also, this is NOT 100%... the 0 is in the middle, and the range is -1 to 1, for 200 total points, not 100.
                    alignment: const Alignment(-0.80, 0.25),
                    //
                    // TODO 14) Give it a white Icon that is ac_unit, size 32
                    /// Take a good look at how the coordinate system works and play with the icon's position to get a feel for it
                    child: Icon(
                      Icons.ac_unit,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  //
                  // TODO 15) Create a grey[300] Container that's 150 high, bottom margin 16 and center aligned
                  Container(
                    height: 150,
                    color: Colors.grey[300],
                    margin: const EdgeInsets.only(bottom: 16),
                    alignment: Alignment.center,
                    //
                    // TODO 16) Make its child a RotatedBox with two turns and give that a text that says 'Upside Down Text, Anyone?'
                    child: const RotatedBox(
                      quarterTurns: 2,
                      child: Text('Upside Down Text, Anyone?'),
                    ),
                  ),
                  //
                  // TODO 17) Create a blue [800] Container that's 150 high, bottom margin of 6, align it to x,y coordinates 0.6, -0.2
                  Container(
                    height: 150,
                    color: Colors.blue[800],
                    margin: const EdgeInsets.only(bottom: 16),
                    alignment: const Alignment(
                      0.6,
                      0.2,
                    ),
                    //
                    // TODO 18) Give it an AspectRatio of 1/2, and give that a red Container for a child
                    child: AspectRatio(
                      aspectRatio: 1 / 2,
                      child: Container(
                        height: 1,
                        width: 1,
                        color: Colors.red,
                        //
                        // TODO 19) Give your red container a FractionallySizedBox with height & width factors of 0.5, then give that a white60 Container
                        child: FractionallySizedBox(
                          heightFactor: 0.5,
                          widthFactor: 0.5,
                          child: Container(
                            color: Colors.white60,
                            /// Discuss how the AspectRatio and FractionallySizedBox work together to get this result, and note how the red Container was not
                            /// affected by the -0.2 y alignment parameter since it was already full height... but the white one is affected, since it's not full height.
                            /// OBSERVATION:  The AspectRatio did the size calculations for the red Container based on the available space from the blue
                            /// Container and totally ignored the red Container's size settings. This is because the AspectRatio sets the size of its child
                            /// regardless of what the child wants. If you want to chane the size of the child, wrap the AspectRatio in something else that
                            /// limits its size as needed
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
