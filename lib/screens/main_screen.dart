import 'package:flutter/material.dart';
import 'package:hisaab/model/transaction.dart';
import 'package:hisaab/widgets/add_transactions.dart';
import 'package:hisaab/widgets/chart.dart';
import 'package:hisaab/widgets/transaction_list.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Transaction> _transactions = [
    Transaction(
        id: "t1",
        title: "Bought a T-shirt",
        expense: 200,
        date: DateTime.now()),
    Transaction(id: "t2", title: "Milk", expense: 25, date: DateTime.now()),
    Transaction(
        id: "t3", title: "Groceries", expense: 190, date: DateTime.now()),
    Transaction(id: "t4", title: "Shoes", expense: 150, date: DateTime.now()),
    Transaction(id: "t4", title: "Shoes", expense: 150, date: DateTime.now()),
    Transaction(id: "t4", title: "Shoes", expense: 150, date: DateTime.now()),
    Transaction(id: "t4", title: "Shoes", expense: 150, date: DateTime.now()),
    Transaction(id: "t4", title: "Shoes", expense: 150, date: DateTime.now()),
  ];
  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  List<Transaction> get _recentTransaction {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount, DateTime pickedDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      expense: txAmount,
      date: pickedDate,
    );

    setState(() {
      _transactions.add(newTx);
    });

    return;
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: Text("Hisaab"),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          },
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.2,
                child: Chart(
                  recentTransactions: _recentTransaction,
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.72,
                child: TransactionList(
                    transactions: _transactions, delFun: _deleteTransaction),
              ),
              FloatingActionButton(
                onPressed: () {
                  _startAddNewTransaction(context);
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
