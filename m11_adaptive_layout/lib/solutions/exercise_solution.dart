import 'package:flutter/material.dart';

class ExerciseSolution extends StatelessWidget {
  final String title;

  const ExerciseSolution({Key key, this.title}) : super(key: key);

  //TODO 1) Take a good look at buildMeStuff and be sure you understand what it's doing
  ListView buildMeStuff(BuildContext context, Axis scrollDirection, int itemCount, double aspectRatio, Color color) {
    return ListView.builder(
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return AspectRatio(
          aspectRatio: aspectRatio,
          child: Card(
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
              ///
              ///
              const SizedBox(
                height: 16,
              ),
              // TODO 2) AspectRatio of 3, child is buildMeStuff. Details are horizontal, 10, 1 and red
              AspectRatio(
                aspectRatio: 3.0,
                child: buildMeStuff(
                  context,
                  Axis.horizontal,
                  10,
                  1,
                  Colors.red,
                ),
              ),

              ///
              ///
              const SizedBox(
                height: 16,
              ),
              // TODO 3) AspectRatio of 3.5, child is buildMeStuff. Details are horizontal, 10, 1 and blue
              AspectRatio(
                aspectRatio: 3.5,
                child: buildMeStuff(
                  context,
                  Axis.horizontal,
                  10,
                  1,
                  Colors.blue,
                ),
              ),

              ///
              ///
              const SizedBox(
                height: 16,
              ),
              // TODO 4) Now it's your turn to use a list view builder. It's returned horizontal list needs have 10 green cards with an aspect ratio of 1 and centered text that says 'Test"
              AspectRatio(
                aspectRatio: 3.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const AspectRatio(
                      aspectRatio: 1,
                      child: Card(
                        color: Colors.green,
                        // ***************************** use alt+enter here to add center
                        child: Center(
                          child: Text(
                            'Test',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // TODO 5) No more Mr. Nice Guy.
              // TODO :     Inside of an Expanded, make a Container with a solid cyan border 20 wide and round the outside edges of the corners by 20
              Expanded(
                child: Container(decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.cyan,
                    width: 20,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                  // TODO 6)  Give it a Column that has two Expandeds with flexes that give the first one two-thirds of the space and the second gets the rest
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 66,
                        // TODO 7) In the first Expanded put a max-width container with a 10-stop gradient. Use the colors in pairs to make three sets of black and two sets of red, for a total of ten colors. Don't think too hard, just go, "black black, red red, black black, red red, black black". It will make sense very soon.
                        // TODO 8) Begin your gradient at center left and end it at center right. The stops are zero, point zero-six, point two, point three, point four-eight, point five-two, point seven, point eight, point nine-four and one.

                        // TODO 9) In the other Expanded you want to create the same gradient except flip the colors. You need three pairs of red and two pairs of black.

                        // TODO 10)                   THE END
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.black,
                                Colors.red,
                                Colors.red,
                                Colors.black,
                                Colors.black,
                                Colors.red,
                                Colors.red,
                                Colors.black,
                                Colors.black,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0,.06,.20,.30,.48,.52,.70,.80,.94,1]
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 33,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.red,
                                Colors.red,
                                Colors.black,
                                Colors.black,
                                Colors.red,
                                Colors.red,
                                Colors.black,
                                Colors.black,
                                Colors.red,
                                Colors.red,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0,.06,.20,.30,.48,.52,.70,.80,.94,1]
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
