import 'package:lost_children_frontend/interfaces/ImageState.dart';
import 'package:lost_children_frontend/settings/MapSettings.dart';
import 'package:lost_children_frontend/utils/GeoLocation.dart';
import 'package:lost_children_frontend/utils/functions/enumFromString.dart';
import 'package:lost_children_frontend/utils/functions/tryCast.dart';

class FaceImage {
  final int id;
  final String imagePath;
  final DateTime dateTime;
  final ImageState state;
  final GeoLocation location;

  const FaceImage({
    required this.id,
    required this.imagePath,
    required this.dateTime,
    required this.state,
    required this.location,
  });

  FaceImage copy({
    int? id,
    String? imagePath,
    DateTime? dateTime,
    ImageState? state,
    GeoLocation? location,
  }) =>
      FaceImage(
        id: id ?? this.id,
        imagePath: imagePath ?? this.imagePath,
        dateTime: dateTime ?? this.dateTime,
        state: state ?? this.state,
        location: location ?? this.location,
      );

  static FaceImage? fromJson(Map<String, dynamic> json) {
    try {
      return FaceImage(
        id: tryCast<int>(json['id'])!,
        imagePath: tryCast<String>(json['image'])!,
        dateTime: DateTime.parse(tryCast<String>(json['date_time'])!),
        state: enumFromString<ImageState>(
          ImageState.values,
          tryCast<String>(json['state'])!,
        )!,
        location: GeoLocation(
          tryCast<double>(json['latitude']),
          tryCast<double>(json['longitude']),
        ),
      );
    } catch (e) {
      return null;
    }
  }

  String get mapUrl {
    return 'https://www.google.com/maps?q=${location.latitude},${location.longitude}&z=${MapSettings.zoom}';
  }
}
