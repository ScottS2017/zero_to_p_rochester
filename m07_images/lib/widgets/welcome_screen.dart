import 'package:flutter/material.dart';
import 'package:m07_images/app/app_textstyles.dart';
import 'package:provider/provider.dart';
import 'package:m07_images/app/app_colors.dart';
import 'package:m07_images/hera_objects/example_hera_model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heraObjectInstance = Provider.of<HeraObject>(context);
    return ValueListenableBuilder<String>(
      valueListenable: heraObjectInstance.mainAppBarString,
      builder: (BuildContext context, String mainAppBarString, Widget child) {
        heraObjectInstance.changeAppBarTitle('Zero to Productive: Images');
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.normal22.copyWith(
                        color: AppColors.blackTextColor,
                        height: 1.1,
                      ),
                      children: [
                        const TextSpan(
                            text: "The Image Widget provides several constructors to display different "
                                "images from different sources.\n\n "),
                        const TextSpan(text: " Image.asset", style: AppTextStyles.boldItalic22),
                        const TextSpan(text: " is one of the constructors you'll use most often. Per the docs:\n\n"),
                        const TextSpan(
                            text:
                                "Creates a widget that displays an ImageStream obtained from an asset bundle. The key for the image is given by the name argument.",
                            style: AppTextStyles.italic18),
                        const TextSpan(text: " \n\nImage.network", style: AppTextStyles.boldItalic22),
                        const TextSpan(
                            text: " will probably be your other favorite constructor. It does exactly "
                                "what you'd think it does:\n\n"),
                        const TextSpan(
                            text: " Creates a widget that displays an [ImageStream] obtained from the network.",
                            style: AppTextStyles.italic18),
                        const TextSpan(
                            text: "\n\nWhen working with images, there are a few parameters you'll want to "
                                "become familiar with:\n\n"),
                        TextSpan(
                            text: "     ${String.fromCharCode(8226)} fit"
                                "\n     ${String.fromCharCode(8226)} scale"
                                "\n     ${String.fromCharCode(8226)} semanticsLabel"
                                "\n     ${String.fromCharCode(8226)} excludeFromSemantics"),
                        const TextSpan(
                            text: "\n\nFit is the main one you're going to need to spend time with because the vast "
                              "marjority of time you're going to be putting Images inside of Containers, and it's very "
                              "important that you control how your image is going to be zoomed or shrank, displayed "
                              "with its original aspect ratio or contorted to fit its Container in one axis... even if that means "
                              "the image will become distorted."),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
