import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// H.E.R.A. (High Efficiency Reactive Architecture):
///
/// - The UI sends events to the logic in the HeraModel.
/// - Each member variable we care about in the UI is wrapped in a ValueNotifier.
/// - The ValueNotifiers are doing the job of a "Model".
/// - When a value we care about changes, its ValueNotifier notifies its listeners in the UI.
/// - ONLY the widgets affected by changing that variable will be rebuild, NO OTHERS.
/// - After the UI has updated for all changes, it sits and waits for the next event.
///
/// Benefits:
///
/// - Rectangular, one way flow of data and events which is an important principle from Redux. That flow is:
///      UI -> Logic -> Variable that gets changed -> That variable's ValueNotifier -> Back to UI
/// The actual flow is:
///     1) UI events call functions in the "HeraModel" logic section. (The HeraModel is your object.)
///     2) Those functions (logic)  change values of member variables in the HeraModel.
///     3) A variable being changed triggers its ValueNotifier. Here, a ValueNotifier does the job of a "Model".
///     4) Each ValueNotifier has one or more ValueListenableBuilders. Every time their ValueNotifier sends the
///          signal, these will *automatically* rebuild whatever child you gave them, using the new variable values.
///
/// - Compared to Redux
///       - Redux passes the entire app state around. HERA only passes the variable you care about.
///       - Boilerplate. The entire self-contained HERA example app is only 98 lines, including
///            main( ), imports and whitespace.
///      - Much more...
///
/// - Compared to ChangeNotifier
///      - ChangeNotifier passes the entire object that extended ChangeNotifier.
///      - ChangeNotifier could cause unnecessary rebuilds if you aren't careful and don't use a Selector.
///      - HERA passes ONLY the individual variable or object that changed.
///           You *can't* get an update for something you don't care about, it's just not possible.
///           Therefore, it's impossible to trigger unnecessary rebuilds. You don't need to plan carefully
///           and there's no more need for Selectors.
///

///    *  Instead of passing the entire app state or an entire object, HERA was designed on the
///    principle that if your Widget only uses one thing, then maybe you should only be passing it
///    that one thing and nothing else.

///  - Compared to BLoC
///       - With HERA, the app-wide logic should still be placed in its own folder and files.
///       - Logic that applies only to a specific HeraModel object should be located in that HeraModel.
///       - NO STREAMS
///            - No need to worry about subscriptions.
///            - No need to worry about single-use vs. broadcast streams.
///            - You will never forget to close a stream again.
class HeraObject {
  ///
  /// First we list all of this object's member variables  that are *not* being listened to in the View (aka UI)
  static final List<Color> _colorOptions = [
    Colors.green,
    Colors.grey,
    Colors.black,
    Colors.purple,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
  ];

  /// Second, put any member variables we want to use in our UI, but we need to put
  /// them in ValueNotifiers. So, instead of just using a "Color" like me normally would,
  /// we use "ValueNotifier<Color>" instead.
  /// (Tip: These are what many other architectures would call the "Models")
  ValueNotifier<Color> firstColor = ValueNotifier<Color>(Colors.white);
  ValueNotifier<Color> secondColor = ValueNotifier<Color>(_colorOptions[0]);

  /// Last, we put any logic that affects our member variables. These are what
  /// some call "Controller" as in MVC, or "Presenter" as in MVP.
  void reactByChangingTheColor(int whichColor) {
    final rng = Random();
    // This just flips the left top between white and yellow, and randoms a color for the right buttons.
    if (whichColor == 1) {
      firstColor.value == Colors.white ? firstColor.value = Colors.yellow : firstColor.value = Colors.white;
    } else if (whichColor == 2) {
      secondColor.value = _colorOptions[rng.nextInt(7)];
    } else {
      print("Error: whichColor wasn't 1 or 2");
    }
  }
}
