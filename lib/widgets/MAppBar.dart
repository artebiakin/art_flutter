import 'package:art_flutter/widgets/icons/ArrowBack.dart';
import 'package:flutter/material.dart';

import '../globalVariables.dart';

class MAppBar extends StatefulWidget {
  final String title;
  MAppBar({Key key, this.title}) : super(key: key);

  @override
  _MAppBarState createState() => _MAppBarState(title);
}

class _MAppBarState extends State<MAppBar> {
  final double appBarHeight = 70;
  final double hiddenAppBarHeight = 40;
  final String title;
  final GlobalKey _appBarContainer = GlobalKey();
  bool isHiddenAppBar = false;
  double heightBar;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) => getHeightBar());
  }

  void getHeightBar() {
    RenderBox box = _appBarContainer.currentContext.findRenderObject();
    double height = box.size.height;

    if (heightBar == null) heightBar = height;

    if (heightBar > height && !isHiddenAppBar) {
      setState(() {
        isHiddenAppBar = true;
      });
    } else if (heightBar == height && isHiddenAppBar) {
      setState(() {
        isHiddenAppBar = false;
      });
    }
  }

  _MAppBarState(this.title);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: dark_purple,
      expandedHeight: appBarHeight,
      bottom: PreferredSize(
          child: SizedBox(),
          preferredSize: Size.fromHeight(hiddenAppBarHeight)),
      floating: true,
      pinned: true,
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding_horizontal),
        child: Padding(
          key: _appBarContainer,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: isHiddenAppBar
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      title,
                      style: fontStyleTitle,
                    )
                  ],
                )
              : Column(
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
                            painter: ArrowBack(),
                          ),
                        ),
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
}

//  extends StatelessWidget with PreferredSizeWidget {
//   // sets app bar heights
//   final double appBarHeight = 70;
//   final String title;

//   MAppBar({Key key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   @override
//   Size get preferredSize => Size.fromHeight(appBarHeight);
// }
