import 'package:flutter/material.dart';
import 'package:m02_static_ui_elements/app/app_strings.dart';

class NoScaffoldOrMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// Without a Material or Scaffold,we get  red text and yellow lines
    /// With a Scaffold or Material,, we get the expected behavior

    /// Wrap the Container with a Material or Scaffold and see
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: const Text(
        AppStrings.testStingOne,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
