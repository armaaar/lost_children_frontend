import 'package:flutter/material.dart';
import 'package:lost_children_frontend/widgets/templates/StandardTemplate.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';
  final String title;

  const HomePage({
    Key? key,
    this.title = 'Lost Children',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return StandardTemplate(
      title: title,
      body: const Center(
        child: Text(
          'Under construction',
        ),
      ),
    );
  }
}
