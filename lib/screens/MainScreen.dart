import 'package:art_flutter/data/BusinessCard.dart';
import 'package:art_flutter/data/Transaction.dart';
import 'package:art_flutter/globalVariables.dart';
import 'package:art_flutter/widgets/MAppBar.dart';
import 'package:art_flutter/widgets/MBusinessCard.dart';
import 'package:art_flutter/widgets/MListTransaction.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MAppBar(title: 'Transaction report'),
      body: CustomPaint(
        painter: BGPaint(),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: padding_horizontal, right: padding_horizontal, top: 15),
              child: Column(
                children: <Widget>[
                  MBusinessCard(card: _initBusinessCard()),
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: MListTransaction(transactions: _initTransaction()))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

/* 
  Init transaction list.
 */
  List<Transaction> _initTransaction() {
    DateTime today = DateTime.now();
    DateTime yesterday = DateTime(today.year, today.month, today.day - 1);
    List<Transaction> listTransaction = [
      Transaction('Water Bill', false, -280, today),
      Transaction('Income: Salary Oct', false, 1200, yesterday),
      Transaction('Electric Bill', false, -480, yesterday),
      Transaction('Income: Jane transfers', false, 500, yesterday),
      Transaction('Internet Bill', true, -100, yesterday),
    ];

    return listTransaction;
  }

/* 
  Init date business card.
 */
  BusinessCard _initBusinessCard() {
    return BusinessCard(
        'John Smith', 4765111111119018, 'Amazon Platinum', 3469.52, 'Visa');
  }
}

/* 
  Draw white block with rounded edges.
 */
class BGPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = white;

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(
              0,
              size.height * .2,
              size.width,
              size.height,
            ),
            Radius.circular(40)),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
