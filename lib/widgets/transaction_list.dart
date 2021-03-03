import 'package:flutter/material.dart';
import 'package:hisaab/model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final Function delFun;

  const TransactionList({
    @required this.transactions,
    @required this.delFun,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  height: 400,
                  width: 315,
                  child: Image.asset(
                    "lib/assets/images/waiting.png",
                    scale: 2.5,
                  ),
                ),
                Text("No item added yet"),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.deepPurpleAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                          child: Text(
                              "\$${transactions[index].expense.toStringAsFixed(2)}"),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd()
                          .format(transactions[index].date)
                          .toString(),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        delFun(transactions[index].id);
                      },
                    ),
                  ),
                );
              }),
    );
  }
}
