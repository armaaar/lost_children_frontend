import 'package:flutter/material.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';
import 'package:lost_children_frontend/widgets/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lost Children',
      theme: ThemeData(
          primarySwatch: ThemeSettings.colorSwatch,
          textTheme: const TextTheme(
              bodyText2: TextStyle(
                  letterSpacing: 0.5,
                  color: ThemeSettings.colorText,
                  fontSize: ThemeSettings.fontSizeNormal))),
      home: const HomePage(title: 'Lost Children'),
    );
  }
}
