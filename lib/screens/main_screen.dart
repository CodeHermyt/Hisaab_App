import 'package:flutter/material.dart';
import 'package:hisaab/model/transaction.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(
        id: "t1",
        title: "Bought a T-shirt",
        expense: 200,
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "Bought a T-shirt",
        expense: 200,
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "Bought a T-shirt",
        expense: 200,
        date: DateTime.now()),
    Transaction(
        id: "t1",
        title: "Bought a T-shirt",
        expense: 200,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hisaab"),
      ),
      body: SafeArea(
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
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Title",
                          labelStyle: TextStyle(color: Colors.purple)),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Cost",
                          labelStyle: TextStyle(
                            color: Colors.purple,
                          )),
                    ),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Add Transaction",
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.purple,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.expense}',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.purple,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date), //doesn't work
                            // tx.date.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
