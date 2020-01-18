import 'package:flutter/material.dart';
import 'package:m10_basic_animations/pages/animated_container_example.dart';
import 'package:m10_basic_animations/pages/animated_icon_example.dart';
import 'package:m10_basic_animations/pages/animated_size_example.dart';
import 'package:m10_basic_animations/pages/animated_switcher_example.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget>pages = [
    AnimatedContainerExample(),
    AnimatedIconExample(),
    AnimatedSizeExample(),
    AnimatedSwitcherExample(),
  ];

  PageController controller = PageController(
    initialPage: 0,
  );
  double currentPageValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageView(
          children: pages,
        )
      ),
    );
  }
}
