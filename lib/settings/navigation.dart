import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_children_frontend/interfaces/NavigationItem.dart';
import 'package:lost_children_frontend/interfaces/SpeedDialInfo.dart';
import 'package:lost_children_frontend/utils/ImageSelector.dart';

const SpeedDialInfo standardSpeedDialInfo = SpeedDialInfo(
  label: 'Add a child',
  icon: Icons.add,
  activeIcon: Icons.close,
);

final List<NavigationItem> standardNavigationItems = <NavigationItem>[
  NavigationItem(
    isPrimary: true,
    label: 'Capture Lost Child',
    icon: Icons.camera_alt,
    onlyMobile: true,
    onPress: (_) async {
      final XFile? image = await ImageSelector().captureImage();
      if (image != null) {
        debugPrint(image.path);
      }
    },
  ),
  NavigationItem(
    isPrimary: true,
    label: 'Select Lost Child',
    icon: Icons.drive_folder_upload,
    onPress: (_) async {
      final XFile? image = await ImageSelector().selectImage();
      if (image != null) {
        debugPrint(image.path);
      }
    },
  ),
  const NavigationItem(
    label: 'Search Lost Child',
    icon: Icons.search,
  ),
  const NavigationItem(
    label: 'List Lost Children',
    icon: Icons.people,
  ),
];
