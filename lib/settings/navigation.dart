import 'package:flutter/material.dart';
import 'package:lost_children_frontend/interfaces/NavigationItem.dart';

final List<NavigationItem> standardNavigationItems = <NavigationItem>[
  NavigationItem(
    isPrimary: true,
    title: 'Capture Lost Child',
    icon: Icons.camera_alt,
  ),
  NavigationItem(
    title: 'Search Lost Child',
    icon: Icons.search,
  ),
  NavigationItem(
    title: 'List Lost Children',
    icon: Icons.people,
  ),
];
