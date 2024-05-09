import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Map<String, double>> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: true);
      double latitude = position.latitude;
      double longitude = position.longitude;
      print(latitude);
      print(longitude);
      return {'latitude': latitude, 'longitude': longitude};
    } catch (e) {
      print('Error getting location: $e');
      return {
        'latitude': 0.0,
        'longitude': 0.0
      }; // Default location or handle error
    }
  }
}
