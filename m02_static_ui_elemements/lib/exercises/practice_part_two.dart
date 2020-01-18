import 'package:flutter/material.dart';

@immutable
class PracticePartTwo extends StatelessWidget {
  const PracticePartTwo({
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

                  //
                  // TODO 2) Now give this Container margin of 16 on the bottom, padding on the right of 24, and centerRight alignment

                  //
                  // TODO 3) Give it a blue child Container that's 100x100

                  //
                  // TODO 4) Create a yellow Container 150 high, center aligned, 16 bottom margin

                  //
                  // TODO 5) Give it an Icon for a child. Icons take a positional parameter that you put the type 'Icons' in.
                  // Scroll down the list until you find 'wrap_text' and use it. Make it size 64 and black54.

                  //
                  // TODO 6) Create a red[800] Container 150 high, centerLeft aligned, bottom margin 16 and padding is 32 left, 20 both top and bottom

                  //
                  // TODO 7) Give it an AspectRatio for a child and set the ratio to 16/9 (CNTL+Space Windows or CNT + Shift Space on Mac)

                  //
                  // TODO 8) Give the AspectRatio a child that's a green Container, no height or width. Watch what happens, discuss why
                  /// How is the AspectRatio working here and how is the green Container's size being determined?

                  //
                  // TODO 9) Create a grey[800] Container that's 150 high, bottom margin 16, aligned topCenter

                  //
                  // TODO 10) Give it a RotatedBox with 90 degrees rotation. (People often say "Give it" to mean give it a child).

                  //
                  // TODO 11) Make its child a white Container that's 30 high and 100 wide
                  /// Briefly discuss what happens and why.

                  //
                  // TODO 12) Create a purple Container 150 high, margin 16 bottom and align it with numbers of -0.8 and +0.25

                  /// Notice that the positive 25 is going down... it's negatives that go up in the vertical axis
                  /// Also, this is NOT 100%... the 0 is in the middle, and the range is -1 to 1, for 200 total points, not 100.

                  //
                  // TODO 13) Give it a white60 Icon that is ac_unit, size 32
                  /// Take a good look at how the coordinate system works and play with the icon's position to get a feel for it

                  //
                  // TODO 14) Create a grey[300] Container that's 150 high, bottom margin 16 and center aligned

                  //
                  // TODO 15) Make its child a RotatedBox with two turns and give that a text that says 'Upside Down Text, Anyone?'

                  //
                  // TODO 16) Create a blue [800] Container that's 150 high, bottom margin of 6, align it to x,y coordinates 0.6, -0.2

                  //
                  // TODO 17) Give it an AspectRatio of 1/2, and give that a red Container for a child

                  //
                  // TODO 18) Give your red container a FractionallySizedBox with height & width factors of 0.5, then give that a white60 Container

                  /// Discuss how the AspectRatio and FractionallySizedBox work together to get this result, and note how the red Container was not
                  /// affected by the -0.2 y alignment parameter since it was already full height... but the white one is affected, since it's not full height.
                  /// OBSERVATION:  The AspectRatio did the size calculations for the red Container based on the available space from the blue
                  /// Container and totally ignored the red Container's size settings. This is because the AspectRatio sets the size of its child
                  /// regardless of what the child wants. If you want to chane the size of the child, wrap the AspectRatio in something else that
                  /// limits its size as needed
                ],
              ),
            ),
          )),
    );
  }
}
