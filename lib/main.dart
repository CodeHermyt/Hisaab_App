import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hisaab",
      home: MainScreen(),
    );
  }
}
