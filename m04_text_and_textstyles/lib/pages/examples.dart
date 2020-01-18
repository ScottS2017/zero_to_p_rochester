import 'package:flutter/material.dart';
import 'package:m04_text_and_text_style/app/app_colors.dart';
import 'package:m04_text_and_text_style/app/app_strings.dart';

class TextExamples extends StatelessWidget {
  final String title;

  const TextExamples({
    Key key,
    this.title,
  }) : super(key: key);

  /// Text: "A run of text with a single style."

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
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      ///
                      /// After this, all strings will use the AppStrings class
                      'Text',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  ///
                  /// Examples of textAlign
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.textAlign,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.notAlignedDefault,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      AppStrings.notAlignedCenterRight,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.leftAligned,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.centerAlign,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.rightAlign,
                      textAlign: TextAlign.right,
                    ),
                  ),

                  ///
                  /// softWrap
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.softWrap,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.ifSoftwrapIsNotSpecified,
                    ),
                  ),

                  ///
                  /// overflow
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.overflow,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.overflowElipsisTestText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.overflowClipTestText,
                      softWrap: false,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.overflowFadeTestText,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.overflowDiscuss,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),

                  ///
                  /// TextScaleFactor
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.textScaleFactor,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.textScaleFactorTestText,
                      textScaleFactor: 0.75,
                    ),
                  ),

                  ///
                  /// TextStyle
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.textStyle,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),

                  ///
                  /// fontWeights
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.fontWeight,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.w100,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.w200,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.w300,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.w400,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.w500,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.w600,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.w700,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.w700IsBold,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.w800,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.w900,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  ///
                  /// fontStyles
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.fontStyle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.italic,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.normal,
                      style: TextStyle(fontStyle: FontStyle.normal),
                    ),
                  ),

                  ///
                  /// fontSizes
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.fontSize,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.fs10,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.fs12,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.fs14,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.fs18,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.fs20,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  ///
                  /// Drop Shadows
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      AppStrings.shadowsTakesList,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.shadowsEx1,
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: AppColors.darkTheme2dpElevationOverlay,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      AppStrings.shadowsEx2,
                      style: TextStyle(shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: AppColors.primaryDarkPurple,
                          offset: Offset(0, 0),
                        )
                      ]),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.multipleShadows,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 1,
                            color: AppColors.primaryDarkRed,
                            offset: Offset(5, 5),
                          ),
                          Shadow(
                            blurRadius: 1,
                            color: AppColors.primaryDarkBlue,
                            offset: Offset(-5, -5),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///
                  /// font color
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.colorRed,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDarkRed,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: const Text(
                      AppStrings.bgBlue,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkThemeWhite,
                        backgroundColor: AppColors.primaryDarkBlue,
                      ),
                    ),
                  ),

                  ///
                  /// letter spacing
                  Container(
                    child: const Text(
                      AppStrings.letterSpacingExample,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 10,
                      ),
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
