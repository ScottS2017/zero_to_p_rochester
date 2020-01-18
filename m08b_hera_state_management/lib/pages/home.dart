import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m08b_state_management_overview/hera_objectss/example_hera_model.dart';
import 'package:provider/provider.dart';

import 'package:m08b_state_management_overview/interfaces/user_interface.dart';

class Example extends StatefulWidget {
  const Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  /// General note on Context for those who are still confused:
  ///
  /// Context is *kind of* like: "The current status/values of everything that has already been created
  /// **so far** in this widget tree, but not things created in *this* build method or any others that are
  /// below since they haven't been run yet."
  ///
  /// It's basically a picture taken just before your build method gets run, that tells you the status of
  /// everything within the scope of this tree from its base up until this point.
  ///
  /// This information is important in many ways, and you see it being used whenever a function takes
  /// "context" as a parameter.
  @override
  Widget build(BuildContext context) {
    return Provider<HeraObject>(
      ///
      /// Set the "create" variable to be the constructor of the HeraModel we're using.
      create: (context) => HeraObject(),
      child: const MaterialApp(
        /// ****** Important!!!
        /// The context we have now only contains information that already existed when it was made.
        /// It does not have any info about our Provider because it didn't exist  yet when the current
        /// context object was created.
        ///
        /// So how do we get the Provider we just created into our context, so the rest of our tree can use it?
        ///
        /// We _usually_ run a new build method. There are other ways, but this is the main one people use and
        /// it's more than good enough for this lesson.
        ///
        /// When we run the UserInterface Widget's build method it will create a new context  that will contain
        /// our Provider, allowing us to use it throughout the rest of the tree.
        home: UserInterface(title: 'Value Notifier'),
      ),
    );
  }
}