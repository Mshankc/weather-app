import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 11.679630;
  double longitude = 75.975304;

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
