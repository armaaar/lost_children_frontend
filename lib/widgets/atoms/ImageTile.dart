import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:intl/intl.dart';
import 'package:lost_children_frontend/settings/APISettings.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';
import 'package:lost_children_frontend/store/faceImage/FaceImage.model.dart';
import 'package:lost_children_frontend/store/ui/actions/loading.action.dart';
import 'package:lost_children_frontend/utils/GlobalRedux.dart';
import 'package:lost_children_frontend/utils/functions/showNavigationSnackBar.dart';
import 'package:lost_children_frontend/widgets/atoms/StandardButton.dart';
import 'package:lost_children_frontend/widgets/atoms/label.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageTile extends StatelessWidget {
  final FaceImage image;

  const ImageTile({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ThemeSettings.radiusTile),
      child: Stack(
        children: <Widget>[
          FullScreenWidget(
            child: Center(
              child: Hero(
                tag: image.id.toString(),
                child: Image.network(
                  APISettings.mediaUrl + image.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: StandardButton(
              icon: Icons.location_on,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(ThemeSettings.radiusTile)),
              onPressed: () async {
                GlobalRedux.dispatch(EnableLoadingAction());
                if (await canLaunch(image.mapUrl)) {
                  await launch(image.mapUrl);
                } else {
                  showNavigationSnackBar(
                    context,
                    'Error: Can\'t open location.',
                    state: SnackBarState.error,
                  );
                }
                GlobalRedux.dispatch(DisableLoadingAction());
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Label(
              text: DateFormat('d MMMM y').add_jm().format(image.dateTime),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(ThemeSettings.radiusTile)),
            ),
          ),
        ],
      ),
    );
  }
}
