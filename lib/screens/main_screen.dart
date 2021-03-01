import 'package:flutter/material.dart';
import 'package:hisaab/widgets/user_transaction.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hisaab"),
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
              UserTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}
