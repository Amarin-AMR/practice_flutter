import 'package:clima_app/sevices/location.dart';
import 'package:clima_app/sevices/networking.dart';

const apiKey = '';
const openWeatherMapURL = 'http://api.weatherapi.com/v1/current.json?key=';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) {
    var url = '$openWeatherMapURL$apiKey&q=$cityName';
    print(url);
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location? location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL$apiKey&aqi=yes&q=${location.latitude},${location.longitude}");

    dynamic weatherData = await networkHelper.getData();
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
