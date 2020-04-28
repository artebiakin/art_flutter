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
    return ListView.builder(
<<<<<<< HEAD
=======
        padding: EdgeInsets.only(top: 18, left: 0, right: 0, bottom: 0),
>>>>>>> dev
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
<<<<<<< HEAD
                      margin: EdgeInsets.only(top: 10),
=======
                      margin: EdgeInsets.only(top: 15),
>>>>>>> dev
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _parseDate(dateTransaction),
                        style: fontStyleCaption,
                      ),
                    ),
              Padding(
<<<<<<< HEAD
                padding: EdgeInsets.symmetric(vertical: 10),
=======
                padding: EdgeInsets.only(top: 10, bottom: 5),
>>>>>>> dev
                child: MTransaction(
                    transaction: transactions[i],
                    color: colors[i % colors.length]),
              )
            ],
          );
        });
  }

  String _parseDate(DateTime date) {
    if (date.day == currentDate.day && date.month == currentDate.month)
      return 'Today';
    else if (date.day == currentDate.day - 1 && date.month == currentDate.month)
      return 'Yesterday';
    return '${date.day}.${date.month}';
  }
}
