import 'package:flutter/material.dart';

import '../globalVariables.dart';

class MAppBar extends StatelessWidget with PreferredSizeWidget {
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
                spacing: 10,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    color: white,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: white),
                  ),
                ],
              )
            ],
          ),
        ),
        // title: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: padding_horizontal),
        //   child: Wrap(
        //     alignment: WrapAlignment.end,
        //     crossAxisAlignment: WrapCrossAlignment.end,
        //     direction: Axis.horizontal,
        //     spacing: 10,
        //     children: <Widget>[
        //       Icon(Icons.arrow_back_ios),
        //       Text(title),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar_height);
}
