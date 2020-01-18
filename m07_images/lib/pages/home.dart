import 'dart:async';

import 'package:flutter/material.dart';
import 'package:m07_images/exercise/exercise.dart';
import 'package:m07_images/solution/solutions.dart';
import 'package:m07_images/widgets/example.dart';
import 'package:m07_images/widgets/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:m07_images/app/app_colors.dart';
import 'package:m07_images/app/app_images.dart';
import 'package:m07_images/hera_objects/example_hera_model.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool _splashScreenIsOnstage = true;
  bool _startFade = false;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    fadeTimer();
    offstageTimer();
  }

  Future<Timer> fadeTimer() async {
    return Timer(
      const Duration(seconds: 2),
      () => setState(
        () {
          _startFade = true;
        },
      ),
    );
  }

  Future<Timer> offstageTimer() async {
    return Timer(
      const Duration(seconds: 4),
      () => setState(
        () {
          _splashScreenIsOnstage = false;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heraObjectInstance = Provider.of<HeraObject>(context);
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: AppColors.silver,
            appBar: AppBar(
              backgroundColor: AppColors.darkThemeTealPrimary,
              title: ValueListenableBuilder<String>(
                valueListenable: heraObjectInstance.mainAppBarString,
                builder: (BuildContext context, String newTitle, Widget child) {
                  return Text(
                    newTitle,
                    style: const TextStyle(
                      color: AppColors.blackTextColor,
                    ),
                  );
                },
              ),
            ),

            /// Bottom NavBar
            bottomNavigationBar: BottomNavigationBar(
              onTap: (tappedItemIndex) => setState(() {
                _index = tappedItemIndex;
              }),
              backgroundColor: AppColors.darkThemeTealPrimary,
              currentIndex: _index,
              type: BottomNavigationBarType.fixed,
              items: bottomNavBarItems,
              selectedItemColor: AppColors.darkTheme2dpElevationOverlay,
              unselectedItemColor: AppColors.darkThemeTealVariant,
            ),

            body: decideWhichBodyToUse(),
          ),
          ///
          /// Splash Screen
          Positioned(
            top: _splashScreenIsOnstage == true ? 0 : MediaQuery.of(context).size.height,
            child: AnimatedOpacity(
              opacity: _startFade == true ? 0: 1.0,

              duration: const Duration(milliseconds: 3000),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColors.darkThemeNoElevation,
                child: Image.asset(AppImages.flutterLogo),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget decideWhichBodyToUse() {
    Widget result;

  if (_index == 0) {
    result = const WelcomeScreen();
  } else if (_index == 1) {
    result = const Example();
  } else if (_index == 2) {
    result = const Exercise();
  } else  if (_index == 3)  {
    result = const Solutions();
  }
    return result;
  }

  /// Icon Buttons
  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: const Text('Welcome'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.clear_all),
      title: const Text('Examples'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.live_help),
      title: const Text('Exercises'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.functions),
      title: const Text('Solutions'),
    ),
  ];
}
