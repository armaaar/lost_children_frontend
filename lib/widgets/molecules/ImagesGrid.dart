import 'package:flutter/material.dart';
import 'package:lost_children_frontend/store/faceImage/FaceImage.model.dart';
import 'package:lost_children_frontend/widgets/atoms/ImageTile.dart';

class ImagesGrid extends StatelessWidget {
  final List<FaceImage> images;

  const ImagesGrid({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: images
          .map<ImageTile>((FaceImage image) => ImageTile(image: image))
          .toList(),
    );
  }
}
