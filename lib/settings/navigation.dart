import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lost_children_frontend/interfaces/NavigationItem.dart';
import 'package:lost_children_frontend/interfaces/SpeedDialInfo.dart';
import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';
import 'package:lost_children_frontend/utils/functions/navigateTo.dart';
import 'package:lost_children_frontend/utils/requests/requestImageDetection.dart';
import 'package:lost_children_frontend/utils/requests/requestLostImages.dart';
import 'package:lost_children_frontend/widgets/pages/LostListPage.dart';

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
    onPress: (BuildContext context) => requestImageDetection(
      context,
      ImageSelectionMethod.capture,
      UploadedImageState.lost,
    ),
  ),
  NavigationItem(
    label: 'List Lost Children',
    icon: Icons.people,
    onPress: (BuildContext context) async {
      if (!await navigateTo(context, LostListPage.route)) {
        requestLostImages(context);
      }
    },
  ),
  NavigationItem(
    isPrimary: kIsWeb && !kDebugMode,
    label: 'Search Lost Child',
    icon: Icons.search,
    onPress: (BuildContext context) => requestImageDetection(
      context,
      ImageSelectionMethod.select,
      UploadedImageState.search,
    ),
  ),
  ...kDebugMode
      ? <NavigationItem>[
          NavigationItem(
            isPrimary: true,
            label: 'Select Lost Child',
            icon: Icons.drive_folder_upload,
            onPress: (BuildContext context) => requestImageDetection(
              context,
              ImageSelectionMethod.select,
              UploadedImageState.lost,
            ),
          ),
        ]
      : <NavigationItem>[]
];
