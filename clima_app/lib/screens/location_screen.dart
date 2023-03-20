import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima_app/sevices/weather.dart';
import 'dart:convert';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    super.key,
    this.locationWeather,
  });

  final dynamic locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late double? temperature;
  late String? place;
  late String? condition;
  late String? weatherIcon;
  // late String? icon;

  @override
  void initState() {
    super.initState();
    // debugPrint(widget.locationWeather ?? 'nothing');
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        int? condiCode =
            jsonDecode(weatherData)['current']['wind_degree'] ?? 'NoData';
        place = jsonDecode(weatherData)['location']['name'] ?? 'NoData';
        temperature = jsonDecode(weatherData)['current']['temp_c'] ?? 0;
        condition =
            jsonDecode(weatherData)['current']['condition']['text'] ?? 'NoData';
        weatherIcon = weather.getWeatherIcon(condiCode ?? -1);
      },
    );
    // icon = 'http:' + jsonDecode(weatherData)['current']['condition']['icon'];
    // debugPrint('$place $temp ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
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
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    style: flatButtonStyle,
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typeName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CityScreen();
                          },
                        ),
                      );
                      if (typeName != null) {
                        var weatherData =
                            await weather.getCityWeather(typeName);
                        updateUI(weatherData);
                      }
                    },
                    style: flatButtonStyle,
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(children: <Widget>[
                  Text(
                    '$temperature',
                    style: kTempTextStyle,
                  ),
                  // Image.network(
                  //   icon ?? '',
                  // ),
                  Text(
                    weatherIcon!,
                    style: kConditionTextStyle,
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '$condition $place',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
