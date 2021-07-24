import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:lost_children_frontend/settings/APISettings.dart';
import 'package:lost_children_frontend/store/faceImage/FaceImage.model.dart';
import 'package:lost_children_frontend/widgets/atoms/StandardButton.dart';

class ImageTile extends StatelessWidget {
  final FaceImage image;

  const ImageTile({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(maxHeight: 300),
          child: FullScreenWidget(
            child: Center(
              child: Hero(
                tag: image.id.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    APISettings.mediaUrl + image.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: StandardButton(
            text: 'X',
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
