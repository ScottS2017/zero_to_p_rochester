import 'package:flutter/material.dart';

class PercentagesForExpandeds extends StatelessWidget {
  final String title;
  static const TextStyle customStyleVariableUsedHereToKeepThisCodeExampleBrief = TextStyle(color: Colors.white, fontSize: 36);

  const PercentagesForExpandeds({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[



              Expanded(
                flex: 47,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: const Text(
                    '43%',
                    style: customStyleVariableUsedHereToKeepThisCodeExampleBrief,
                  ),
                ),
              ),

              Expanded(
                flex: 33,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: const Text(
                    '37%',
                    style: customStyleVariableUsedHereToKeepThisCodeExampleBrief,
                  ),
                ),
              ),

              Expanded(
                flex: 20,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: const Text(
                    '20%',
                    style: customStyleVariableUsedHereToKeepThisCodeExampleBrief,
                  ),
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
class ExpandedBox extends StatelessWidget {
  final String text;
  final int flex;

  const ExpandedBox({
    Key key,
    this.text,
    this.flex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Card(
        color: Colors.blue,
        elevation: 4,
        child: Center(
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
