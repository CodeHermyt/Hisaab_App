import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({
    Key key,
    @required this.titleController,
    @required this.amountController,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController amountController;

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
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Cost",
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
            FlatButton(
                onPressed: () {
                  print(titleController.text);
                  print(amountController.text);
                },
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
