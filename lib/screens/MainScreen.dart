import 'package:art_flutter/data/BusinessCard.dart';
import 'package:art_flutter/data/Transaction.dart';
import 'package:art_flutter/globalVariables.dart';
import 'package:art_flutter/widgets/MAppBar.dart';
import 'package:art_flutter/widgets/MBusinessCard.dart';
import 'package:art_flutter/widgets/MListTransaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _scrollController;
  double scroll = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setOffset());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  setOffset() {
    setState(() {
      scroll = _scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BGPaint(scroll),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        slivers: <Widget>[
          MAppBar(title: 'Transaction report'),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: padding_horizontal),
                    child: Wrap(
                      children: <Widget>[
                        MBusinessCard(card: _initBusinessCard()),
                        MListTransaction(transactions: _initTransaction()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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
  double scroll;

  BGPaint(this.scroll);

  @override
  void paint(Canvas canvas, Size size) {
    final double defaultHeight = size.height * .26;
    final double maxHeight = size.height * .06;

    double height = defaultHeight - scroll;

    if (height < maxHeight) height = maxHeight;

    Paint paint = Paint()..color = white;

    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTRB(0.0, size.height, size.width, height),
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
