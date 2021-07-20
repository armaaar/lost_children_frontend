import 'package:location/location.dart';

double? _tryParseToDouble(dynamic jsonValue) {
  if (jsonValue is double) {
    return jsonValue;
  }

  if (jsonValue is String) {
    return double.tryParse(jsonValue);
  }

  return null;
}

class GeoLocation {
  final double? latitude; // Latitude, in degrees
  final double? longitude; // Longitude, in degrees

  bool get isAvailable {
    return latitude != null && longitude != null;
  }

  GeoLocation(this.latitude, this.longitude);

  Map<String, dynamic> toJson() => <String, double?>{
        'latitude': latitude,
        'longitude': longitude,
      };

  GeoLocation.fromJson(Map<String, dynamic> json)
      : latitude = _tryParseToDouble(json['latitude']),
        longitude = _tryParseToDouble(json['longitude']);

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<GeoLocation> getCurrentLocation() async {
    final Location location = Location();

    // Test if location services are enabled.
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      // Request location service
      serviceEnabled = await location.requestService();
      // If not granted, return error
      if (!serviceEnabled) {
        return Future<GeoLocation>.error('Location services are disabled.');
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future<GeoLocation>.error('Location permissions are denied');
      }
    }

    if (permissionGranted == PermissionStatus.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future<GeoLocation>.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final LocationData locationData = await location.getLocation();

    return GeoLocation(
      locationData.latitude,
      locationData.longitude,
    );
  }
}
