import 'package:flutter/material.dart';

class UsingFractionOfSpace extends StatelessWidget {
  final String title;

  const UsingFractionOfSpace({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Query the device and calculate the border width
    final double border = MediaQuery.of(context).size.width * 0.02;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.all(border),
           child:
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topLeft,
            ///
            /// The light green shows the area available to use
            color: Colors.lightGreen,
            child: FractionallySizedBox(
              widthFactor: 0.75,
              heightFactor: 0.333333,
              child: Container(
                ///
                /// The dark blue will tell us how much area actually got used
                color: Colors.blue[900],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
