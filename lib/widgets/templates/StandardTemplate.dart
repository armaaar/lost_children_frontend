import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:lost_children_frontend/interfaces/NavigationItem.dart';
import 'package:lost_children_frontend/interfaces/SpeedDialInfo.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';
import 'package:lost_children_frontend/settings/navigation.dart';

class StandardTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final List<NavigationItem>? navigationItems;
  final SpeedDialInfo speedDialInfo;

  const StandardTemplate({
    Key? key,
    required this.body,
    required this.title,
    this.navigationItems,
    this.speedDialInfo = standardSpeedDialInfo,
  }) : super(key: key);

  List<NavigationItem> get nonNullNavigationItems {
    // used to provide a default value that's not constant
    final List<NavigationItem> navItems =
        navigationItems ?? standardNavigationItems;

    return !kIsWeb
        ? navItems
        : navItems
            .where(
                (NavigationItem navigationItem) => !navigationItem.onlyMobile)
            .toList();
  }

  List<NavigationItem> get primaryNavigationItems {
    return nonNullNavigationItems
        .where((NavigationItem navigationItem) => navigationItem.isPrimary)
        .toList();
  }

  List<NavigationItem> get normalNavigationItems {
    return nonNullNavigationItems
        .where((NavigationItem navigationItem) => !navigationItem.isPrimary)
        .toList();
  }

  bool get speedDialExists {
    return primaryNavigationItems.length > 1;
  }

  bool get floatingButtonExists {
    return primaryNavigationItems.isNotEmpty;
  }

  bool get navigationBarExists {
    return normalNavigationItems.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: speedDialExists
          ? SpeedDial(
              icon: Icons.add,
              activeIcon: Icons.close,
              spacing: ThemeSettings.spaceNotch,
              tooltip: 'Open Speed Dial',
              renderOverlay: false,
              children: primaryNavigationItems
                  .map<SpeedDialChild>(
                    (NavigationItem navigationItem) => SpeedDialChild(
                      onTap: () => navigationItem.onPress!(context),
                      label: navigationItem.label,
                      child: Icon(navigationItem.icon),
                    ),
                  )
                  .toList(),
            )
          : floatingButtonExists
              ? FloatingActionButton(
                  onPressed: () => primaryNavigationItems[0].onPress!(context),
                  tooltip: primaryNavigationItems[0].label,
                  child: Icon(primaryNavigationItems[0].icon),
                )
              : null,
      floatingActionButtonLocation: navigationBarExists
          ? FloatingActionButtonLocation.endDocked
          : FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: navigationBarExists
          ? BottomAppBar(
              color: ThemeSettings.colorNavigation,
              shape: const CircularNotchedRectangle(),
              notchMargin: ThemeSettings.spaceNotch,
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
                            tooltip: navigationItem.label,
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
