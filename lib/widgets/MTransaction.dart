import 'package:art_flutter/data/Transaction.dart';
import 'package:art_flutter/globalVariables.dart';
import 'package:art_flutter/widgets/icons/Drop.dart';
import 'package:flutter/material.dart';

class MTransaction extends StatelessWidget {
  final Transaction transaction;
  final Color color;

  MTransaction({Key key, this.transaction, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: <Widget>[
                _drawDropIcon(color),
                Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Text(transaction.name, style: fontStyleHeader),
                    Text(
                        transaction.isSuccessfully
                            ? 'Successfully'
                            : 'Unsuccessfully',
                        style: fontStyleCaption),
                  ],
                ),
              ],
            ),
            _parseValue(transaction.value),
=======
=======
>>>>>>> dev
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _drawDropIcon(color),
            SizedBox(width: 15),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(transaction.name,
                    style: fontStyleHeader,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false),
                Text(
                    transaction.isSuccessfully
                        ? 'Successfully'
                        : 'Unsuccessfully',
                    style: fontStyleCaption),
              ],
            )),
            SizedBox(width: 15),
            _parseValue(transaction.value)
<<<<<<< HEAD
>>>>>>> dev
          ],
        ),
        SizedBox(
          height: 13,
=======
          ],
        ),
        SizedBox(
          height: 10,
>>>>>>> dev
        ),
        SizedBox(
          width: double.infinity,
          height: 1,
          child: Container(
            color: Colors.black12,
          ),
        )
      ],
<<<<<<< HEAD
<<<<<<< HEAD
    ));
=======
    );
>>>>>>> dev
=======
    );
>>>>>>> dev
  }

  Widget _drawDropIcon(Color color) {
    double _size = 44;
    double _radius = 13;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_radius)),
      child: Container(
          width: _size,
          height: _size,
          color: color,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Drop(),
          )),
    );
  }

  Widget _parseValue(double value) {
    int val = value.toInt().abs();
    bool isPositive = value >= 0 ? true : false;
    String result = isPositive ? '+ \$$val' : '- \$$val';
    return Text(result,
        style: fontStyleHeader.merge(TextStyle(
            color: isPositive ? dark_purple : red,
            fontWeight: FontWeight.w600)));
  }
}
