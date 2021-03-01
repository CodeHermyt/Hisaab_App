import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'add_transactions.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  List<Transaction> transactions = [
    Transaction(
        id: "t1",
        title: "Bought a T-shirt",
        expense: 200,
        date: DateTime.now()),
    Transaction(id: "t2", title: "Milk", expense: 25, date: DateTime.now()),
    // Transaction(
    //     id: "t3", title: "Groceries", expense: 190, date: DateTime.now()),
    // Transaction(id: "t4", title: "Shoes", expense: 150, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      expense: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(newTx);
    });

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransaction(_addTransaction),
        TransactionList(transactions: transactions),
      ],
    );
  }
}
