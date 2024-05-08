import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = -82.862755;
  double longitude = 135.000000;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: true);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('ERROR $e');
    }
  }
}
