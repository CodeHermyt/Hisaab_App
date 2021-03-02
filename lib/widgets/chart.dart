import 'package:flutter/material.dart';
import 'package:hisaab/model/transaction.dart';
import 'package:hisaab/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({@required this.recentTransactions});

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].expense;
        }
      }
      // print(DateFormat.E().format(weekDay).substring(0, 1));
      // print(totalSum);
      return {
        "day": DateFormat.E().format(weekDay),
        "amount": totalSum,
      };
    });
  }

  double get totalExpense {
    double sum = 0.0;
    for (int i = 0; i < groupedTransaction.length; i++) {
      sum += groupedTransaction[i]["amount"];
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransaction.map(
          (data) {
            return Expanded(
              child: ChartBar(
                data["day"],
                data["amount"],
                (data["amount"] as double) / totalExpense,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
