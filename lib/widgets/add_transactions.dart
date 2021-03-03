import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction(this.addTx);

  final Function addTx;

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();
  // final _titleFocus = FocusNode();
  // final _amountFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    // _titleFocus.dispose();
    // _amountFocus.dispose();
    _amountController.dispose();
  }

  final _amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitData(BuildContext context) {
    final titleText = _titleController.text;
    final amountText = double.parse(_amountController.text);

    if (titleText.isEmpty || amountText <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(titleText, amountText, _selectedDate);

    Navigator.pop(context);
  }

  void _datePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        _selectedDate = pickedDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.purple)),
                onSubmitted: (_) => _submitData(context),
              ),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: "Cost",
                  labelStyle: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                onSubmitted: (_) => _submitData(context),
              ),
              Container(
                height: 40,
                child: Row(
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Date not selected"
                          : "Picked Date : ${DateFormat.yMd().format(_selectedDate)}",
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          _datePicker(context);
                        });
                      },
                      child: Text(
                        "Select date",
                        style: TextStyle(
                          color: Colors.purpleAccent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: () => _submitData(context),
                  child: Text(
                    "Add Transaction",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
