import 'package:flutter/material.dart';

class UsingRatios extends StatelessWidget {
  final String title;

  const UsingRatios({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 32,
              ),
              AspectRatio(
                aspectRatio: 3.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ListItemBox(
                      color: Colors.teal,
                      text: 'Row: 3:1\n\nBlock: 1:1',
                    ),
                    ListItemBox(
                      color: Colors.teal,
                      text: 'Row: 3:1\n\nBlock: 1:1',
                    ),
                    ListItemBox(
                      color: Colors.teal,
                      text: 'Row: 3:1\n\nBlock: 1:1',
                    ),
                    ListItemBox(
                      color: Colors.teal,
                      text: 'Row: 3:1\n\nBlock: 1:1',
                    ),
                  ],
                ),
              ),

              ///
              /// 3.5 items wide
              const SizedBox(
                height: 32,
              ),
              AspectRatio(
                aspectRatio: 3.5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ListItemBox(
                      color: Colors.red,
                      text: 'Row: 3.5:1\n\nBlock: 1:1',
                    ),
                    ListItemBox(
                      color: Colors.red,
                      text: 'Row: 3.5:1\n\nBlock: 1:1',
                    ),
                    ListItemBox(
                      color: Colors.red,
                      text: 'Row: 3.5:1\n\nBlock: 1:1',
                    ),
                    ListItemBox(
                      color: Colors.red,
                      text: 'Row: 3.5:1\n\nBlock: 1:1',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class ListItemBox extends StatelessWidget {
  final Color color;
  final String text;

  const ListItemBox({
    Key key,
    this.color,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      AspectRatio(
      aspectRatio: 1.0,
      child: Card(
        color: color,
        elevation: 4,
        child:


        Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
