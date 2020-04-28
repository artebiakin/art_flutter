import 'package:art_flutter/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'globalVariables.dart';

void main() => runApp(ArtFlutter());

class ArtFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Removes the statusBar on the Android.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
        backgroundColor: dark_purple,
      ),
      home: MainScreen(),
    );
  }
}

/* 
  Remove scroll glow.
 */
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
