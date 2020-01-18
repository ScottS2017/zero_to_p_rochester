import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m08b_state_management_overview/hera_objectss/example_hera_model.dart';
import 'package:provider/provider.dart';

class UserInterface extends StatelessWidget {
  final String title;


  const UserInterface({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Provide an instance of our HeraObject we can use.
    final heraObjectInstance = Provider.of<HeraObject>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// ******** If you don't use a ValueListenableBuilder, then you can still call the
                    /// functions in the HeraObject but your UI won't update on a change.
                    /// This is why the "power" button never updates its color even though it does
                    /// trigger the function that changes the light icon's color.
                    ///
                    /// The other buttons do use ValueListenableBuilders, and this is why they all
                    /// update their colors. Notice how the button you press isn't only changing
                    /// itself.  With this approach,ALL of the widgets that listen for a particular
                    /// variable value will rebuild whenever that value changes.
                    ///
                    /// If you're accustomed to ChangeNotifiers, then you might be wondering about
                    /// the "listen" parameter. It isn't used in this architecture because we're using
                    /// ValueListenableBuilders directly, instead of putting them into Consumers.
                    /// The listen parameter is used with Consumers, but not with ValueListenableBuilders, so
                    /// we don't need them here.
                    ///
                    /// Note: ValueListenableBuilder is part of the framework, it's not part of Provider.

                    /// Next: ValueListenableBuilder needs to be told what Type to listen for.
                    /// In this case, we're listening for a Color:
                    ValueListenableBuilder<Color>(
                      ///
                      /// This says the value we're listening for the firstColor variable in our
                      /// HeraObject instance., which we created above.
                      valueListenable: heraObjectInstance.firstColor,
                      ///
                      /// The builder takes the current context. Then you tell it the Type your ValueListenableBuilder
                      /// is listening for and give it a name for use only inside of this builder function (Here we're using
                      /// Color color).
                      ///
                      /// You don't use the ValueListenable to rebuild your child Widget, you use its value.
                      /// That's why the second parameter here is a Color, which is the type of the value, instead of
                      /// a ValueListenable.
                      ///
                      /// Note: The third parameter can be "Widget child", and then you can pass in a child widget
                      /// or even an entire Widget tree. But because we aren't using it here, we just put "_" as a
                      /// way of telling Flutter to ignore this parameter because we aren't using it right now.
                      builder: (BuildContext context, Color color, _ ) {
                        return FloatingActionButton(
                          ///
                          /// For a background color we're going to use the value of the ValueListenable called "firstColor",
                          /// that is located in our heraObjectInstance
                          backgroundColor: heraObjectInstance.firstColor.value,

                          ///
                          /// When pressed, call the heraObjectInstance's "reactByChangingTheColor" function:
                          onPressed: () => heraObjectInstance.reactByChangingTheColor(1),
                          child: Icon(
                            Icons.lightbulb_outline,
                            color: Colors.black54,
                          ),
                        );
                      },
                    ),

                    ///
                    /// The rest of these ValueListenableBuilders are just repeating the same approach as above.
                    /// However, the "power button" is just Floating Action Button, without a
                    /// ValueListenableBuilder. More on that, below.
                    ValueListenableBuilder<Color>(
                      valueListenable: heraObjectInstance.secondColor,
                      builder: (BuildContext context, Color color, Widget child) {
                        return FloatingActionButton(
                          backgroundColor: heraObjectInstance.secondColor.value,
                          onPressed: () => heraObjectInstance.reactByChangingTheColor(2),
                          child: Icon(Icons.autorenew),
                        );
                      },
                    ),
                  ],
                ),
              ),

              /// ************ Empty Placeholder ***********
              const Expanded(
                child: Placeholder(
                  fallbackWidth: 100,
                  fallbackHeight: 100,
                ),
              ),
              /// ************ /Empty Placeholder ***********

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ///
                    /// Here is our "power button". The only difference between this and the others is that
                    /// this is *not* contained inside of a ValueListenableBuilder. Therefore, it won't
                    /// rebuild no matter how many times we change the value of firstColor, or no matter
                    /// how many times we press it to call reactByChangingTheColor
                    FloatingActionButton(
                      backgroundColor: heraObjectInstance.firstColor.value,
                      onPressed: () => heraObjectInstance.reactByChangingTheColor(1),
                      child: Icon(
                        Icons.settings_power,
                        color: Colors.black54,
                      ),
                    ),
                    ValueListenableBuilder<Color>(
                      valueListenable: heraObjectInstance.secondColor,
                      builder: (BuildContext context, Color color, Widget child) {
                        return FloatingActionButton(
                          backgroundColor: heraObjectInstance.secondColor.value,
                          onPressed: () => heraObjectInstance.reactByChangingTheColor(2),
                          child: Icon(Icons.autorenew),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
