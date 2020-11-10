import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  IconData weatherIcon;
  String cityName;
  String message;
  String messageAndCity;
  List<Color> weatherColors;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = WeatherIcons.na;
        cityName = '';
        messageAndCity = 'Unable to fetch device location.';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      message = weather.getMessage(temperature);
      messageAndCity = '$message in $cityName';
      weatherColors = weather.getWeatherColors(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            //colors: [Color(0xFF2A4563), Color(0xFF1D2B45)],
            colors: weatherColors,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationData();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      String cityName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                      if (cityName != null) {
                        var weatherData =
                            await weather.getWeatherByCityName(cityName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Text(
                'Friday',
                style: kDayTextStyle,
              ),
              Text(
                '$temperature°',
                style: kTempTextStyle,
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  cityName,
                  style: kCityNameTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              BoxedIcon(
                weatherIcon,
                size: 100.0,
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  messageAndCity,
                  textAlign: TextAlign.center,
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
