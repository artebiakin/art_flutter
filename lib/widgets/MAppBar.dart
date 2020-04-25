import 'package:art_flutter/widgets/icons/ArrowLeft.dart';
import 'package:flutter/material.dart';

import '../globalVariables.dart';

class MAppBar extends StatelessWidget with PreferredSizeWidget {
  final double appBarHeight = 70;
  final String title;

  MAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          padding: EdgeInsets.symmetric(horizontal: padding_horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: <Widget>[
                  Container(
                    width: 17,
                    height: 17,
                    child: CustomPaint(
                      painter: ArrowLeft(),
                    ),
                  ),
                  // Icon(
                  //   Icons.arrow_back_ios,
                  //   color: white,
                  // ),
                  Text(
                    title,
                    style: fontStyleTitle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
