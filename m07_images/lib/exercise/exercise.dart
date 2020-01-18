import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:m07_images/app/app_images.dart';
import 'package:m07_images/hera_objects/example_hera_model.dart';

class Exercise extends StatelessWidget {
  const Exercise({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heraObjectInstance = Provider.of<HeraObject>(context);
    return ValueListenableBuilder<String>(
      valueListenable: heraObjectInstance.mainAppBarString,
      builder: (BuildContext context, String mainAppBarString, Widget child) {
        heraObjectInstance.changeAppBarTitle('Exercise Solutions');

        const Widget xxxxxxxxxxxxxxxxxxxxxxxxxxxxx = SizedBox(height: 16);

        return Container(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,

            //TODO 1) Create a child Column with cross axis alignment set to stretch
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //TODO ***** For the rest of the TODOs in this file: Use our custom separator (above) and then create a square, teal container. Put whatever the TODO tells you inside of one of those Containers.

                // TODO 2) Use the asset 'dive' for as an image and set its scale to 1

                //TODO 3) Repeat what you did in #2 but this time make the scale 2. Compare and discuss.

                //TODO 4) Use the keyboardHelp image from AppImages and set its fit to contain

                // TODO 5) Same thing as 4 but set the fit to cover. Compare and discuss

                // TODO 6) The AppImage name is jumping, use a scale of 0.5 and set the color to purple. Watch what happens.

                // TODO 7) Do the same thing as 6 but this time add a blend mode of modulate. Experiment with and discuss blend modes for a few minute, if time allows.

                // TODO 8) No frills, just display the image. It's in the app images file and called inverted or something like that. Go look and just display it here. No scale, color or anything.

                // TODO 9) Use jumping again but this time try fitWidth. Look closely at the result.

                // TODO 10) This time use the image named "owl". Set its width and height both to 50. Discuss the result. There are two factors that combine to create that result. Make sure you understand them both.

                // TODO 11) Last one. Owl, fit is none, scale is 1/3 and alignment is -25%, -65%. Discuss.

                // THE END!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                //
              ],
            ),
          ),
        );
      },
    );
  }
}
