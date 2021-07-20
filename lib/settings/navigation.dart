import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lost_children_frontend/interfaces/NavigationItem.dart';
import 'package:lost_children_frontend/interfaces/SpeedDialInfo.dart';
import 'package:lost_children_frontend/utils/functions/uploadImageForDetection.dart';

const SpeedDialInfo standardSpeedDialInfo = SpeedDialInfo(
  label: 'Add a child',
  icon: Icons.add,
  activeIcon: Icons.close,
);

final List<NavigationItem> standardNavigationItems = <NavigationItem>[
  NavigationItem(
    isPrimary: true,
    onlyMobile: true,
    label: 'Capture Lost Child',
    icon: Icons.camera_alt,
    onPress: (BuildContext context) =>
        uploadImageForDetection(context, ImageSelectionMethod.capture),
  ),
  NavigationItem(
    isPrimary: true,
    onlyMobile: true,
    label: 'Select Lost Child',
    icon: Icons.drive_folder_upload,
    onPress: (BuildContext context) =>
        uploadImageForDetection(context, ImageSelectionMethod.select),
  ),
  const NavigationItem(
    isPrimary: kIsWeb,
    label: 'Search Lost Child',
    icon: Icons.search,
  ),
  const NavigationItem(
    label: 'List Lost Children',
    icon: Icons.people,
  ),
];
