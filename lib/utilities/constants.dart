import 'dart:ui';

import 'package:flutter/material.dart';

const kApiKey = '02dd32e4466f474010342e5dd536ed3b';
const kOpenWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(Icons.search),
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
    gapPadding: 5,
    borderSide: BorderSide.none,
  ),
);
