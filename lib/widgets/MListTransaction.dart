import 'package:art_flutter/data/Transaction.dart';
import 'package:art_flutter/globalVariables.dart';
import 'package:art_flutter/widgets/MTransaction.dart';
import 'package:flutter/material.dart';

class MListTransaction extends StatelessWidget {
  static List<Color> colors = [dark_purple, red, light_blue, orange, green];
  static DateTime currentDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  static DateTime dateTransaction;

  final List<Transaction> transactions;

  MListTransaction({Key key, this.transactions}) : super(key: key);

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
                        transaction: transactions[i],
                        color: colors[i % colors.length]),
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
