import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await Location().getCurrentLocation();
    print('getlocation is triggered');
    print('lat = ${location.latitude}');
    print('lon = ${location.longitude}');
  }

  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b1b15e88fa797225412429c1c50c122a1'),
    );
    String data = response.body;
    var latitude = jsonDecode(data)['weather'][0]['id'];
    var longitude = jsonDecode(data)['main']['temp'];
    var weather = jsonDecode(data)['name'];
    print('id = $latitude');
    print('temperature = $longitude');
    print('city = $weather');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getData();
          },
          child: const Text('Get weather'),
        ),
      ),
    );
  }
}
