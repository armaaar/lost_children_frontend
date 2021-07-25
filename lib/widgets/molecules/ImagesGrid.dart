import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    return StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: images.length,
      staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
      itemBuilder: (BuildContext context, int index) =>
          ImageTile(image: images[index]),
    );
  }
}
