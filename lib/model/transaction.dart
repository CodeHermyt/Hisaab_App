import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double expense;
  final DateTime date;

  const Transaction({
    @required this.id,
    @required this.title,
    @required this.expense,
    @required this.date,
  });
}
