import 'package:flutter/material.dart';
import 'package:m07_images/app/app_images.dart';
import 'package:m07_images/app/app_textstyles.dart';
import 'package:provider/provider.dart';
import 'package:m07_images/app/app_colors.dart';
import 'package:m07_images/hera_objects/example_hera_model.dart';

class Example extends StatelessWidget {
  const Example({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heraObjectInstance = Provider.of<HeraObject>(context);
    return ValueListenableBuilder<String>(
      valueListenable: heraObjectInstance.mainAppBarString,
      builder: (BuildContext context, String mainAppBarString, Widget child) {
        heraObjectInstance.changeAppBarTitle('Working Samples');
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.darkTheme24dpElevationOverlay,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 16),
                Image.asset(AppImages.jumping,),
                const SizedBox(height: 16),
                Image.network(AppImages.owl,),
                const SizedBox(height: 16),
                Image.network(AppImages.invertedJenny,),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.asset,
                  image: AppImages.jumping,
                  fit: BoxFit.fill,
                  text: 'fill',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.owl,
                  fit: BoxFit.fill,
                  text: 'fill',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.invertedJenny,
                  fit: BoxFit.fill,
                  text: 'fill',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.asset,
                  image: AppImages.jumping,
                  fit: BoxFit.contain,
                  text: 'contain',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.owl,
                  fit: BoxFit.contain,
                  text: 'contain',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.invertedJenny,
                  fit: BoxFit.contain,
                  text: 'contain',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.asset,
                  image: AppImages.jumping,
                  fit: BoxFit.cover,
                  text: 'cover',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.owl,
                  fit: BoxFit.cover,
                  text: 'cover',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.invertedJenny,
                  fit: BoxFit.cover,
                  text: 'cover',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.asset,
                  image: AppImages.jumping,
                  fit: BoxFit.fitHeight,
                  text: 'fitHeight',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.owl,
                  fit: BoxFit.fitHeight,
                  text: 'fitHeight',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.invertedJenny,
                  fit: BoxFit.fitHeight,
                  text: 'fitHeight',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.asset,
                  image: AppImages.jumping,
                  fit: BoxFit.fitWidth,
                  text: 'fitWidth',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.owl,
                  fit: BoxFit.fitWidth,
                  text: 'fitWidth',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.invertedJenny,
                  fit: BoxFit.fitWidth,
                  text: 'fitWidth',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.asset,
                  image: AppImages.jumping,
                  fit: BoxFit.none,
                  text: 'none',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.owl,
                  fit: BoxFit.none,
                  text: 'none',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.invertedJenny,
                  fit: BoxFit.none,
                  text: 'none',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.asset,
                  image: AppImages.jumping,
                  fit: BoxFit.scaleDown,
                  text: 'scaleDown',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.owl,
                  fit: BoxFit.scaleDown,
                  text: 'scaleDown',
                ),
                const SizedBox(height: 16),
                const ImageSample(
                  type: ImageType.network,
                  image: AppImages.invertedJenny,
                  fit: BoxFit.scaleDown,
                  text: 'scaleDown',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ImageSample extends StatelessWidget {
  const ImageSample({
    Key key,
    this.fit,
    this.image,
    this.text,
    this.type,
  }) : super(key: key);

  final BoxFit fit;
  final String image;
  final String text;
  final ImageType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            child: type == ImageType.network ? Image.network(
              image,
              fit: fit,
            ) : Image.asset(
              image,
              fit: fit,
            )
          ),
          Positioned.fill(
            child: FractionallySizedBox(
              heightFactor: 0.45,
              widthFactor: 0.65,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.blackScrim,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  text,
                  style: AppTextStyles.normal30.copyWith(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: const Offset(2, 2),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum ImageType{
  network,
  asset,
}