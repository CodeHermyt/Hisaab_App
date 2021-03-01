import 'package:flutter/material.dart';
import 'package:hisaab/model/transaction.dart';
import 'package:hisaab/widgets/add_transactions.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Hisaab"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startAddNewTransaction(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  child: Center(
                    child: Text(
                      "Chart",
                    ),
                  ),
                ),
              ),
              TransactionList(transactions: _transactions),
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
