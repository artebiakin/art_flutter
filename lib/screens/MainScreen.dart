import 'package:art_flutter/data/BusinessCard.dart';
import 'package:art_flutter/data/Transaction.dart';
import 'package:art_flutter/globalVariables.dart';
import 'package:art_flutter/widgets/MAppBar.dart';
import 'package:art_flutter/widgets/MBusinessCard.dart';
import 'package:art_flutter/widgets/MListTransaction.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double offset = MediaQuery.of(context).size.height * .15;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomPaint(
        painter: BGPaint(),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            MAppBar(title: 'Transaction report'),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Container(
                margin: EdgeInsets.only(top: offset),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: offset,
                          right: padding_horizontal,
                          left: padding_horizontal),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: MListTransaction(transactions: _initTransaction()),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -offset, 0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: padding_horizontal),
                        child: MBusinessCard(card: _initBusinessCard()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
      Transaction(
          name: 'Water Bill', isSuccessfully: false, value: -280, data: today),
      Transaction(
          name: 'Income: Salary Oct',
          isSuccessfully: false,
          value: 1200,
          data: yesterday),
      Transaction(
          name: 'Electric Bill',
          isSuccessfully: false,
          value: -480,
          data: yesterday),
      Transaction(
          name: 'Income: Jane transfers',
          isSuccessfully: false,
          value: 500,
          data: yesterday),
      Transaction(
          name: 'Internet Bill',
          isSuccessfully: true,
          value: -100,
          data: yesterday),
    ];

    return listTransaction;
  }

/* 
  Init date business card.
 */
  BusinessCard _initBusinessCard() {
    return BusinessCard(
        nameOwner: 'John Smith',
        number: 4765111111119018,
        nameCard: 'Amazon Platinum',
        balance: 3469.52,
        operators: 'Visa');
  }
}

/* 
  Draw white block with rounded edges.
 */
class BGPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = white;

    canvas.drawRect(
        Rect.fromLTRB(0.0, size.height, size.width, size.height / 1.6), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
