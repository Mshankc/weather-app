import 'package:weather_app/services/networking.dart';
import '../services/location.dart';
import '../utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await Location().getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$kOpenWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getWeatherBg(int condition) {
    if (condition < 300) {
      return 'https://www.timeforkids.com/wp-content/uploads/2019/03/190301015607.jpg';
    } else if (condition < 400) {
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRahrITg5j7KHLK-dOFseSJ1FQjz-tHpAKbfIZVNFr64Q&s.jpg';
    } else if (condition < 600) {
      return 'https://www.india.com/wp-content/uploads/2021/08/Rain-alert-in-maharashtra-Weather-forecast-in-maharashtra-Heavy-rains-in-next-2-to-4-days-in-the-state-Rainfall-is-likely-to-be-heavy-in-Marathwada-Konkan-and-Central-Maharashtra-1.jpg';
    } else if (condition < 700) {
      return 'https://liverpoolexpress.co.uk/wp-content/uploads/2013/01/Snow-scene-city-centre2.jpg';
    } else if (condition < 800) {
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx20Z7bXH46VSyg_0yZy8ad2rm0QpArL1_1DRa4ap1mw&s.jpg';
    } else if (condition == 800) {
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMnvoGu4r1BjlNk9eDH0h49cRtIwWA0dr0P6kYokGg_A&s.jpg';
    } else if (condition <= 804) {
      return 'https://www.highcountryweather.com/wp-content/uploads/2016/11/2016-november-03-how-snowy.jpg';
    } else {
      return 'https://cdn.pixabay.com/photo/2023/12/20/07/04/clouds-8459053_1280.jpg';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
