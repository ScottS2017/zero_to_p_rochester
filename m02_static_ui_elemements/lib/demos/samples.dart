import 'package:flutter/material.dart';
import 'package:m02_static_ui_elements/app/app_strings.dart';

class Samples extends StatelessWidget {
  final String title;

  ///
  /// Every Widget constructor should be const and have a Key.
  /// But not all constructors are for widgets, such as a State object.
  const Samples({
    Key key,
    this.title,
  }) : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          ///
          /// The AppBar is using a Text widget, which is using the string
          /// that we passed in. The title of an AppBar is what gets used for
          /// the title/icon/whatever in the AppBar at the top of the screen
          title: Text(AppStrings.staticUiElements),
        ),

        /// The Scaffold does not take a child, it takes a body.
        /// SingleChildScrollView and Column are covered in a different
        /// module.
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ///
              /// A simple sized box with maximum width
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),

              /// *****************************************************************
              /// A placeholder you can use for quick mock-ups
              Placeholder(
                color: Colors.red,
                fallbackHeight: 50,
                fallbackWidth: 100,
              ),

              /// *****************************************************************
              /// Simple containers with padding, margin, sizes and colors
              Container(
                ///
                /// Padding is the bubble wrap inside your box. It protects the contents
                padding: const EdgeInsets.all(30),

                /// Margin is the space around your box, allowing you to walk around it
                margin: const EdgeInsets.all(50),
                width: 200,
                height: 200,
                color: Colors.grey,
                child: Container(
                  ///
                  /// double.infinity is Flutterspeak for, "be as big as you can"
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.red,
                ),
              ),

              /// *****************************************************************
              /// The Constrained box and its Constraints create a set of "fences".
              /// It's child is constrained to be no larger than the maximums and
              /// no smaller than the minimums
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 150,
                  maxWidth: 150,
                  minHeight: 50,
                  minWidth: 50,
                ),

                /// *****************************************************************
                /// How a Container gets sized is a little complicated. Use the
                /// Flutter inspector to see the outlines of each example:
                ///
                /// If there is no child and Constraints were passed to it (like
                /// the ones above), then it tries to be as large as it can within
                /// those Constraints (in other words, it uses the maximums)
                child: Container(
                  color: Colors.green,
                ),
              ),

              ///
              /// If there is no child and Constraints were NOT passed to it, then it tries
              /// to be as small as possible.
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: Colors.red,
              ),

              /// If there is a child, then it will match the size of its child
              Container(
                color: Colors.yellow,
                child: const Text('Nothing specified, this matches its child'),
              ),

              /// If height and width were specified, they will override all of the above
              Container(
                width: 350,
                margin: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.cyan,
                child: const Text('Only width was specified'),
              ),

              ///
              /// - If there is a child and that child is larger than the Container's height
              /// and width will accommodate, you will get an overflow error (black and yellow
              /// bars)

              /// *****************************************************************
              /// The RotatedBox will rotate its child in quarter turn increments,
              /// which have to be specified as an int, not a double.
              const RotatedBox(
                quarterTurns: 1,
                child: Text("Text is RotatedBox's child"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}