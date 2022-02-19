import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:geolocator/geolocator.dart';

import 'package:weather/models/clouds.dart';
import 'package:weather/models/main.dart';
import 'package:weather/models/coordinates.dart';
import 'package:weather/models/weather.dart';

class WeatherChangeNotifier with ChangeNotifier {
  WeatherChangeNotifier() {
    fetchData();
  }

  Uri _url = Uri(
      scheme: 'http', host: "api.openweathermap.org", path: "data/2.5/weather");

  Weather _weather = Weather(
      coordinates: Coordinates(lat: 0.0, lon: 0.0),
      visibility: 0,
      main: Main(
          temp: 0.0,
          feelsLike: 0.0,
          tempMin: 0.0,
          tempMax: 0.0,
          pressure: 0,
          humidity: 0),
      clouds:
          Clouds(id: 0, main: "Clear", description: "description", icon: "01d"),
      name: "name");

  bool _isFetching = false;

  void setWeather(Weather weather) {
    _weather = weather;
    print("update weather ${_weather.name}");
    notifyListeners();
  }

  Weather get getWeather => _weather;
  bool get isFetching => _isFetching;

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    try {
      Position position = await _determinePosition();
      Map<String, String> queryParameters = {
        "lat": position.latitude.toString(),
        "lon": position.longitude.toString(),
        "appid": "b7e50542afea107b34c20baad58320a6",
        "units": "metric"
      };

      _url = _url.replace(queryParameters: queryParameters);

      print(_url);
    } catch (error) {
      print(error);
    }

    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      _weather = Weather.fromJson(jsonResponse);
      print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    _isFetching = false;
    notifyListeners();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
