import 'package:flutter/material.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';

class StandardTemplate extends StatelessWidget {
  final String title;
  final Widget body;

  const StandardTemplate({
    Key? key,
    required this.body,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: ThemeSettings.colorNavigation,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Padding(
          // make sure icons doesn't slip under the notch
          padding: const EdgeInsets.only(left: 10, right: 90),
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: ThemeSettings.colorText,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.people,
                  color: ThemeSettings.colorText,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
