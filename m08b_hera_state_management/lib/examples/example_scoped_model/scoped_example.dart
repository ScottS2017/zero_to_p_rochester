import 'package:flutter/material.dart';
import 'package:m08_state_management_overview/widgets/page_layout.dart';
import 'package:scoped_model/scoped_model.dart';

/// This is the page/screen/route
class ScopedModelExamplePage extends StatelessWidget {
  final ExampleGreenModelObject exampleModelInstanceForTheGreenModel;
  final ExampleBlueModelObject exampleModelInstanceForTheBlueModel;

  /// It is advised to use constant constructors and provide a key (it's like an instance name)
  const ScopedModelExamplePage({
    @required this.exampleModelInstanceForTheGreenModel,
    @required this.exampleModelInstanceForTheBlueModel,
    Key key,

    /// The call to super needs the key to know which instance is calling
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Declare the ScopedModel above where you use it, and be sure to create a new BuildContext before trying to use it.
    /// Here, PageBody creates a new BuildContext that will contain our ScopedModel
    return ScopedModel<ExampleGreenModelObject>(
      model: exampleModelInstanceForTheGreenModel,
      child: ScopedModel<ExampleBlueModelObject>(model: exampleModelInstanceForTheBlueModel, child: const PageBody()),
    );
  }
}

class PageBody extends StatelessWidget {

  /// Again, const constructor with a key
  const PageBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// There are a couple of common ways to use ScopedModel, being the ScopedModelDescendant and the ScopedModel.of
    /// You can use either one inline or, in the case of ScopedModel.of, you can use it to instantiate a variable. Just be sure
    /// to do it inside the build method, because you need to use the new Context it creates.
    final blueBlockIsBlue  = ScopedModel.of<ExampleBlueModelObject>(context, rebuildOnChange: true).isBlue;
    ///
    return PageLayout(
      appBar: AppBar(
        title:  FakeAppBar(
          leftColor: Colors.green,
          rightColor: Colors.blue,
          title: 'ScopedModel Demo',
        ),
      ),
      cubes: <Widget>[
        /// Here is where we use our model. We placed ScopedModelDescendant as low in the tree as we can, just above where we use it.
        ScopedModelDescendant<ExampleGreenModelObject>(
          /// The builder parameters are context, child and model. Each ScopedModelDescendant's model instance is unique, *locally scoped*, and can be
          /// named whatever you want. Just to demonstrate this we're using"NumberOne" here and in the button we'll use "NumberTwo"
          /// ******** But updates to our Model will be available in both of these local instances ***********
          builder: (context, child, exampleLocallyScopedModelInstanceThatUsesTheGreenModel) {
            return Container(
              height: 200,
              width: 200,

              /// This is teaching code... in real life PLEASE don't make your variable names so ridiculously long!
              color: exampleLocallyScopedModelInstanceThatUsesTheGreenModel.isGreen ? Colors.green : Colors.grey,
            );
          },
        ),
        ScopedModelDescendant<ExampleBlueModelObject>(
          builder: (context, child, exampleLocallyScopedModelInstanceThatUsesTheBlueModel) {
            return Container(
              height: 200,
              width: 200,

              /// This time we'll use our blueBlockIsBlue variable instead of fetching the value of our Model inline.
              color: blueBlockIsBlue ? Colors.blue : Colors.grey,
            );
          },
        ),
      ],
      buttons: <Widget>[
        ScopedModelDescendant<ExampleGreenModelObject>(
          /// And here is where we designate the other locally scoped instance as "TheGreenModel"
          builder: (context, child, exampleLocallyScopedModelInstanceThatUsesTheGreenModel) {
            return FloatingActionButton(
              /// Again, try to not choke on this variable name...
              onPressed: exampleLocallyScopedModelInstanceThatUsesTheGreenModel.toggleColor,
              backgroundColor: Colors.green,
              child: Icon(Icons.autorenew),
            );
          },
        ),
        ScopedModelDescendant<ExampleBlueModelObject>(
          builder: (context, child, exampleLocallyScopedModelInstanceThatUsesTheBlueModel) {
            return FloatingActionButton(
              onPressed: exampleLocallyScopedModelInstanceThatUsesTheBlueModel.toggleColor,
              backgroundColor: Colors.blue,
              child: Icon(Icons.autorenew),
            );
          },
        ),
      ],
    );
  }
}

@immutable
class FakeAppBar extends StatelessWidget {
  const FakeAppBar({
    Key key,
    this.leftColor = Colors.pink,
    this.rightColor = Colors.pink,
    @required this.title,
  }) : super(key: key);

  final Color leftColor;
  final Color rightColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 25, left: 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [leftColor, rightColor],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// This is the first Model object we're monitoring
class ExampleGreenModelObject extends Model {
  bool _isGreen = true;
  bool get isGreen => _isGreen;

  void toggleColor() {
    _isGreen = !_isGreen;

    /// Make sure the last thing you do when changing anything in your model is notify all the listeners
    notifyListeners();
  }
}

/// This is the first Model object we're monitoring
class ExampleBlueModelObject extends Model {
  bool _isBlue = true;
  bool get isBlue => _isBlue;

  void toggleColor() {
    _isBlue = !_isBlue;

    /// Make sure the last thing you do when changing anything in your model is notify all the listeners
    notifyListeners();
  }
}
