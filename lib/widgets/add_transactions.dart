import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  AddTransaction(this.addTx);

  final Function addTx;

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final titleText = titleController.text;
    final amountText = double.parse(amountController.text);

    if (titleText.isEmpty || amountText <= 0) {
      return;
    }
    addTx(titleText, amountText);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: TextStyle(color: Colors.purple)),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Cost",
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
                onPressed: submitData,
                child: Text(
                  "Add Transaction",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
