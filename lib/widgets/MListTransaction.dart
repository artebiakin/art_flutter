import 'package:art_flutter/data/Transaction.dart';
import 'package:art_flutter/globalVariables.dart';
import 'package:art_flutter/widgets/icons/Drop.dart';
import 'package:flutter/material.dart';

class MListTransaction extends StatelessWidget {
  final List<Transaction> transactions;
  static List<Color> colors = [dark_purple, red, light_blue, orange, green];
  static DateTime currentDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  static DateTime dateTransaction;

  const MListTransaction(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (_, i) {
              bool isRepeat = false;

              if (dateTransaction == null ||
                  dateTransaction.day != transactions[i].data.day) {
                dateTransaction = transactions[i].data;
              } else {
                isRepeat = true;
              }

              return Column(
                children: <Widget>[
                  isRepeat
                      ? SizedBox()
                      : Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _parseDate(dateTransaction),
                            style: fontStyleCaption,
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: MTransaction(
                        transactions[i], colors[i % colors.length]),
                  )
                ],
              );
            }));
  }

  String _parseDate(DateTime date) {
    if (date.day == currentDate.day && date.month == currentDate.month)
      return 'Today';
    else if (date.day == currentDate.day - 1 && date.month == currentDate.month)
      return 'Yesterday';
    return '${date.day}.${date.month}';
  }
}

class MTransaction extends StatelessWidget {
  final Transaction transaction;
  final Color color;

  const MTransaction(this.transaction, this.color);

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
        SizedBox(
          height: 13,
        ),
        SizedBox(
          width: double.infinity,
          height: 1,
          child: Container(
            color: Colors.black12,
          ),
        )
      ],
    ));
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
