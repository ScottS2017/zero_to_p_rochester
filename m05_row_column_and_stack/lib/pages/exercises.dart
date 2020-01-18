import 'package:flutter/material.dart';

class TextExercises extends StatelessWidget {
  final String title;
  const TextExercises({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ///
                  /// ********** All Containers or SizedBoxes get 32 dp bottom margin. Decide when to use a Container or a SizedBox wrapped in a Padding
                  ///

                  const Placeholder(
                    color: Colors.black54,
                    fallbackHeight: 400,
                    fallbackWidth: 100,
                    strokeWidth: 5,
                  ),
                  // TODO 1) Delete the above PlaceHolder and add the following strings to AppStrings.dart:
                  // All 7 days of the week,
                  // 'Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.'

                  // TODO 2) Make each text according to the below instructions. * Use semantics for everything! *

                  // Mon: centered, red (pick one), w600, size 18 and italic

                  // Tues: In a Container that has a color of 24 dp elevation, (it's in AppColors) with padding all around of 16, text is right aligned, blue, bold, size 18, with a letter spacing of 12 and a background color of dark theme light yellow

                  // Wed: centered, size 24 with a drop shadow color of dark theme 3dp elevation overlay, blur radius of 2 and an offset of 3, 3

                  //  Thurs: green w200, size 48

                  // Fri: bold italic with a drop shadow color of dropShadowColor(?!), blur 1 offset 2-2

                  // Sat: ***NEW!!! Use AppTextStyles.dart to implement a bold italic 36 font

                  // Sun Align the text right and use AppTextStyles.dart and "copyWith" to implement a bold italic 24 font in primaryRed

                  // Make examples of fade right, fade bottom and ellipsis overflows using the first line of the Gettysburg address and use AppTextStyles to set the font to normal and 18
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
