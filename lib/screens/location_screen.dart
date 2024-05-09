import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import '../utilities/constants.dart';
import 'package:weather_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String weatherIcon;
  late String city;
  late int temprature;
  late String message;
  late String bgImage;

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
    print(temprature);
  }

  updateUi(dynamic weatherData) async {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        city = 'Connect!';
        weatherIcon = 'ERROR';
        message = 'Unable to ';
        bgImage =
            'https://cdn.pixabay.com/photo/2023/12/20/07/04/clouds-8459053_1280.jpg';
        return;
      }
      var condition = weatherData['weather'][0]['id'];
      city = weatherData['name'];
      var temp = weatherData['main']['temp'];
      temprature = temp.toInt();
      weatherIcon = weather.getWeatherIcon(condition);
      message = weather.getMessage(temprature);
      bgImage = weather.getWeatherBg(condition);
      print(condition);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(bgImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() async {
                        var weatherData = weather.getLocationWeather();
                        await updateUi(weatherData);
                      });
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CityScreen();
                      }));
                      var weatherData = await weather.getCityWeather(typedName);
                      updateUi(weatherData);
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '$temprature°',
                        style: kTempTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
