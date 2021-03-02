import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hisaab",
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
        ),
        // accentColor: Colors.purpleAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
