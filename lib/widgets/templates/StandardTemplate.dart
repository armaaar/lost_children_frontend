import 'package:flutter/material.dart';

class StandardTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton? floatingActionButton;

  const StandardTemplate({
    Key? key,
    required this.body,
    required this.title,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(title),
        ),
        body: body,
        floatingActionButton: floatingActionButton);
  }
}
