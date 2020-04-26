import 'package:art_flutter/data/BusinessCard.dart';
import 'package:art_flutter/globalVariables.dart';
import 'package:flutter/material.dart';

class MBusinessCard extends StatelessWidget {
  // sets the aspect ratio
  final double aspectRatio = .59;
  final double borderRadius = 18;
  final double offset = 25;
  final BusinessCard card;

  MBusinessCard({Key key, this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _drawBusinessCard(context, purple, offset * 2),
        _drawBusinessCard(context, red, offset),
        _drawBusinessCard(context, dark_blue, 0, card),
      ],
    ));
  }

  Widget _drawBusinessCard(BuildContext context, Color color,
      [double offset = 0, BusinessCard card]) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: offset * .8, right: offset, left: offset),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          color: color,
          height: width * aspectRatio,
          alignment: Alignment.center,
          child: card == null
              ? SizedBox()
              : CustomPaint(
                  painter: BGPaint(),
                  child: _drawCardDetails(card),
                ),
        ),
      ),
    );
  }

/* 
  Draws the main card with details.
 */
  Widget _drawCardDetails(BusinessCard card) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                card.nameOwner,
                style: TextStyle(fontSize: 26, color: white),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                card.nameCard,
                style: TextStyle(
                    fontSize: 16, color: white, fontWeight: FontWeight.w500),
              ),
              _getMargin(),
              Text(
                _parseCardNumber(card.number),
                style: TextStyle(fontSize: 18, color: white),
              ),
              _getMargin(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '\$${card.balance}',
                    style: TextStyle(
                        fontSize: 23,
                        color: white,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                      height: 16,
                      child: card.operators.toLowerCase() == 'visa'
                          ? Image(image: AssetImage('assets/img/visa.png'))
                          : Text('This operator not found'))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _getMargin() {
    return SizedBox(height: 10);
  }

  String _parseCardNumber(int number) {
    String pattern = ' •••• •••• ';
    String string = number.toString();
    return string.substring(0, 4) +
        pattern +
        string.substring(string.length - 4);
  }
}

/* 
  Draws two circles on the card.
 */
class BGPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerFirst = Offset(size.width * .1, size.height * .7);
    final paintFirst = Paint()..color = deep_purple;

    final centerSecond = Offset(size.width * .95, size.height * .15);
    final paintSecond = Paint()..color = light_blue;

    canvas.drawCircle(centerFirst, 200, paintFirst);
    canvas.drawCircle(centerSecond, 100, paintSecond);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
