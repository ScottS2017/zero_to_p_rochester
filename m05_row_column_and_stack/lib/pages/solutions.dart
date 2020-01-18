import 'package:flutter/material.dart';
import 'package:m04_text_and_text_style/app/app_colors.dart';
import 'package:m04_text_and_text_style/app/app_strings.dart';
import 'package:m04_text_and_text_style/app/app_textstyles.dart';

class TextSolutions extends StatelessWidget {

  final String title;

  const TextSolutions({
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
                  // TODO 1) Add the following strings to AppStrings.dart:
                  // All 7 days of the week,
                  // 'Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.'

                  // TODO 2) Make the days of the week. * Use semantics for everything! *
                  // Mon: centered, red (pick one), w600, size 18 and italic
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    child: const Text(
                      AppStrings.mon,
                      semanticsLabel: AppStrings.mon,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryDarkRed,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  // Tues: In a Container that has a color of 24 dp elevation, (look up a grey in AppColors) with padding all around of 16 you want text that is right aligned, blue, bold, size 18 and with a letter spacing of 12 and a background color of dark theme light yellow
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    padding: const EdgeInsets.all(16),
                    color: AppColors.darkTheme24dpElevationOverlay,
                    child: const Text(
                      AppStrings.tu,
                      semanticsLabel: AppStrings.tu,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.primaryDarkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 12,
                        backgroundColor: AppColors.primaryDarkLightYellow,
                      ),
                    ),
                  ),
                  // Wed: centered, size 24 with a drop shadow color of dark theme 3dp elevation overlay, blur radius of 2 and an offset of 3, 3
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: SizedBox(
                      child: Text(
                        AppStrings.wed,
                        semanticsLabel: AppStrings.wed,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          shadows: [
                            Shadow(
                              color: AppColors.darkTheme3dpElevationOverlay,
                              blurRadius: 2,
                              offset: const Offset(3, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //  Thurs: green w200, size 48
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      child: Text(
                        AppStrings.th,
                        semanticsLabel: AppStrings.th,
                        style: TextStyle(
                          color: AppColors.primaryDarkGreen,
                          fontWeight: FontWeight.w200,
                          fontSize: 48,
                        ),
                      ),
                    ),
                  ),
                  // Fri: bold italic with a drop shadow color of dropShadowColor(?!), blur 1 offset 2-2
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    child: Text(
                      AppStrings.fr,
                      semanticsLabel: AppStrings.fr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        shadows: [
                          Shadow(
                            color: AppColors.dropShadowColor,
                            blurRadius: 1,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Sat: ***NEW!!! Use AppTextStyles.dart to implement a bold italic 36 font
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    child: Text(
                      AppStrings.sat,
                      semanticsLabel: AppStrings.sat,
                      style: AppTextStyles.boldItalic36,
                    ),
                  ),
                  // Sun Align the text right and use AppTextStyles.dart and "copyWith" to implement a bold italic 24 font in primaryRed
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    child: Text(
                      AppStrings.sun,
                      semanticsLabel: AppStrings.sun,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.boldItalic24.copyWith(color: AppColors.primaryRed),
                    ),
                  ),
                   // Make examples of fade right, fade bottom and ellipsis overflows using the first line of the Gettysburg address and use AppTextStyles to set the font to normal and 18
                   Container(
                     margin: const EdgeInsets.only(
                       bottom: 32,
                     ),
                     child: Text(
                       AppStrings.getAd,
                       semanticsLabel: AppStrings.getAd,

                       /// To fade right, softWrap has to be false
                       softWrap: false,
                       overflow: TextOverflow.fade,
                       style: AppTextStyles.normal18,
                     ),
                   ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    child: Text(
                      AppStrings.getAd,
                      semanticsLabel: AppStrings.getAd,
                      style: AppTextStyles.normal18,

                      /// It's true by default but this is just here to remind you that to fade bottom you need softWrap to be true.
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 32,
                    ),
                    child: Text(
                      AppStrings.getAd,
                      semanticsLabel: AppStrings.getAd,

                      /// Again, to use TextOverflow.ellipsis, softWrap has to be false
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.normal18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
