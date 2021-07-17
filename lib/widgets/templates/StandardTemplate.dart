import 'package:flutter/material.dart';
import 'package:lost_children_frontend/interfaces/NavigationItem.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';

class StandardTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final List<NavigationItem> navigationItems;

  const StandardTemplate({
    Key? key,
    required this.body,
    required this.title,
    this.navigationItems = const <NavigationItem>[],
  }) : super(key: key);

  bool get floatingButtonExists {
    return navigationItems.isNotEmpty;
  }

  bool get navigationBarExists {
    return navigationItems.length >= 2;
  }

  NavigationItem get primaryNavigationItem {
    return navigationItems.firstWhere(
      (NavigationItem navigationItem) => navigationItem.isPrimary,
      orElse: () => navigationItems.first,
    );
  }

  List<NavigationItem> get normalNavigationItems {
    return navigationItems
        .where((NavigationItem navigationItem) =>
            navigationItem != primaryNavigationItem)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: floatingButtonExists
          ? FloatingActionButton(
              onPressed: () => primaryNavigationItem.onPress!(context),
              tooltip: primaryNavigationItem.title,
              child: Icon(primaryNavigationItem.icon),
            )
          : null,
      floatingActionButtonLocation: navigationBarExists
          ? FloatingActionButtonLocation.endDocked
          : FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: navigationBarExists
          ? BottomAppBar(
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
                  children: normalNavigationItems
                      .map<Widget>((NavigationItem navigationItem) =>
                          IconButton(
                            icon: Icon(
                              navigationItem.icon,
                              color: ThemeSettings.colorText,
                            ),
                            tooltip: navigationItem.title,
                            onPressed: () => navigationItem.onPress!(context),
                          ))
                      .toList(),
                ),
              ),
            )
          : null,
    );
  }
}
