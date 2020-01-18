import 'package:flutter/material.dart';

class Exercise extends StatelessWidget {
  final String title;

  const Exercise({Key key, this.title}) : super(key: key);

  // TODO ******************************************************************************************
  // TODO Take a good look at buildMeStuff and be sure you understand what it's doing
  ListView buildMeStuff(BuildContext context, Axis scrollDirection, int itemCount, double aspectRatio, Color color) {
    ///
    /// ListView.builder will return a List that contains whatever you have its function put in it. You write those instructions
    /// in the return, below.
    return ListView.builder(
      /// We passed in the scrollDirection and itemCount
      scrollDirection: scrollDirection,
      itemCount: itemCount,

      ///
      /// This index isn't specified by you. It helps the function know which item it's working on at any given time..
      /// You tell the builder how many items to build when you specify the itemCount. The builder automatically takes care of
      /// using the index once for each item.
      itemBuilder: (BuildContext context, int index) {
        return AspectRatio(
          /// We passed in the aspectRatio
          aspectRatio: aspectRatio,

          /// A card is just a fancy kind of container that looks like it floats above the background and has rounded corners
          child: Card(
            /// We passed in the color, too
            color: color,
            child: const Center(
              child: Text('Test'),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // TODO 1) Delete this Expanded and its Placeholder:
              const Expanded(
                child: Placeholder(
                  fallbackWidth: 100,
                  fallbackHeight: 100,
                ),
              )

              // TODO 2) SizedBox 16 high, then AspectRatio of 3, child is buildMeStuff. Details are horizontal, 10, 1 and red

              // TODO 3) SizedBox 16 high, then AspectRatio of 3.5, child is buildMeStuff. Details are horizontal, 10, 1 and blue

              // TODO 4) SizedBox 16 high, then it's your turn to use a list view builder. It's returned horizontal list needs have 10 green cards with an aspect ratio of 1 and centered text that says 'Test"

              // TODO 5) SizedBox 16 high... and no more Mr. Nice Guy.
              // TODO :     Inside of an Expanded, make a Container with a solid cyan border 20 wide and round the outside edges of the corners by 20

              // TODO 6)  Give it a Column that has two Expandeds with flexes that give the first one two-thirds of the space and the second gets the rest

              // TODO 7) In the first Expanded put a max-width container with a 10-stop gradient. Use the colors in pairs to make three sets of black and two sets of red, for a total of ten colors. Don't think too hard, just go, "black black, red red, black black, red red, black black". It will make sense very soon.
              // TODO 8) Begin your gradient at center left and end it at center right. The stops are zero, point zero-six, point two, point three, point four-eight, point five-two, point seven, point eight, point nine-four and one.

              // TODO 9) In the other Expanded you want to create the same gradient except flip the colors. You need three pairs of red and two pairs of black.

              // TODO 10)                   THE END
            ],
          ),
        ),
      ),
    );
  }
}
