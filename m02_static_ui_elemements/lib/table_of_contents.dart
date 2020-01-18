import 'package:flutter/material.dart';

class TableOfContents extends StatelessWidget {
  final String title;
  final List<Color> pages;

  const TableOfContents({
    Key key,
    @required this.title,
    this.pages = const [Colors.purple, Colors.red],
  }) : super(key: key);

  List<Widget> buildButtons() {
    List<Widget> result;

    for (Color page in pages) {
        final RaisedButton button = RaisedButton(
          onPressed: () {},
          child: Container(
            width: double.infinity,
            height: 50,
            color: page,
          ),
      );
        result.add(button);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: Colors.white,
          child: Column(
            children: buildButtons(),
          ),
        ),
      ),
    );
  }
}
