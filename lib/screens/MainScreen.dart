import 'package:art_flutter/data/BusinessCard.dart';
import 'package:art_flutter/data/Transaction.dart';
import 'package:art_flutter/globalVariables.dart';
import 'package:art_flutter/widgets/MAppBar.dart';
import 'package:art_flutter/widgets/MBusinessCard.dart';
import 'package:art_flutter/widgets/MListTransaction.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter/rendering.dart';
>>>>>>> dev

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
<<<<<<< HEAD
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
=======
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
>>>>>>> dev
      ),
    );
  }

<<<<<<< HEAD
/* 
=======
  /* 
>>>>>>> dev
  Init transaction list.
 */
  List<Transaction> _initTransaction() {
    DateTime today = DateTime.now();
    DateTime yesterday = DateTime(today.year, today.month, today.day - 1);
    List<Transaction> listTransaction = [
<<<<<<< HEAD
      Transaction('Water Bill', false, -280, today),
      Transaction('Income: Salary Oct', false, 1200, yesterday),
      Transaction('Electric Bill', false, -480, yesterday),
      Transaction('Income: Jane transfers', false, 500, yesterday),
      Transaction('Internet Bill', true, -100, yesterday),
=======
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
>>>>>>> dev
    ];

    return listTransaction;
  }

/* 
  Init date business card.
 */
  BusinessCard _initBusinessCard() {
    return BusinessCard(
<<<<<<< HEAD
        'John Smith', 4765111111119018, 'Amazon Platinum', 3469.52, 'Visa');
=======
        nameOwner: 'John Smith',
        number: 4765111111119018,
        nameCard: 'Amazon Platinum',
        balance: 3469.52,
        operators: 'Visa');
>>>>>>> dev
  }
}

/* 
  Draw white block with rounded edges.
 */
class BGPaint extends CustomPainter {
<<<<<<< HEAD
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
=======
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
>>>>>>> dev
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
