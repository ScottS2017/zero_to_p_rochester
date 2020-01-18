import 'package:flutter/material.dart';

class CalculatingBorders extends StatelessWidget {
  final String title;

  const CalculatingBorders({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// Query the device and calculate the border width
    final double border = MediaQuery.of(context).size.width * 0.02;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          color: Colors.yellow,

          /// Pad the child by the amount calculated above
          /// This will cause the color yellow to show through the padded area
          padding: EdgeInsets.all(border),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
