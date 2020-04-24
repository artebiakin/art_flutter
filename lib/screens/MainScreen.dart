import 'package:art_flutter/globalVariables.dart';
import 'package:art_flutter/widgets/MAppBar.dart';
import 'package:art_flutter/widgets/MBusinessCard.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: MAppBar(title: 'Transaction report'),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: padding_horizontal, vertical: 15),
          child: Column(
            children: <Widget>[
              MBusinessCard(),
            ],
          ),
        ));
  }
}
