import 'package:art_flutter/data/BankCard.dart';
import 'package:art_flutter/globalVariables.dart';
import 'package:flutter/material.dart';

class MBusinessCard extends StatelessWidget {
  // aspect for business card
  final double aspectRatio = .59;
  final double borderRadius = 18;
  final double offset = 25;
  static BankCard card = BankCard(
      'John Smith', 4765111111119018, 'Amazon Platinum', 3469.52, 'Visa');

  const MBusinessCard();

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
      [double offset = 0, BankCard card]) {
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

  Widget _drawCardDetails(BankCard card) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                card.nameOwner,
                style: TextStyle(
                    fontSize: 26, color: white, fontWeight: FontWeight.w500),
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
                style: TextStyle(
                    fontSize: 17, color: white, fontWeight: FontWeight.w400),
              ),
              _getMargin(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '\$${card.balance}',
                    style: TextStyle(
                        fontSize: 21,
                        color: white,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    card.operators,
                    style: TextStyle(
                        fontSize: 21,
                        color: white,
                        fontWeight: FontWeight.w700),
                  ),
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
