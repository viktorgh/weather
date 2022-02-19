import 'package:flutter/material.dart';

import 'coordinates.dart';
import 'clouds.dart';
import 'main.dart';

class Weather extends ChangeNotifier {
  Coordinates coordinates;
  Clouds clouds;
  // String base;
  Main main;
  int visibility;
  // Wind wind;
  // DateTime dt;
  // Sys sys;
  // int timezone;
  String name;

  Weather(
      {required this.coordinates,
      required this.clouds,
      // required this.base,
      required this.main,
      required this.visibility,
      // required this.wind,
      // required this.dt,
      // required this.sys,
      // required this.timezone,
      required this.name}) {
    notifyListeners();
  }

  Weather.fromJson(Map<String, dynamic> json)
      : coordinates = json["coord"] == null
            ? Coordinates(lon: 0.0, lat: 0.0)
            : Coordinates.fromJson(json["coord"]),
        main = json["main"] == null
            ? Main(
                temp: 0.0,
                feelsLike: 0.0,
                tempMin: 0.0,
                tempMax: 0.0,
                pressure: 0,
                humidity: 0)
            : Main.fromJson(json["main"]),
        clouds = json["weather"] == null
            ? Clouds(
                id: 0, main: "Clear", description: "description", icon: "01d")
            : Clouds.fromJson(json["weather"][0]),
        visibility = json['visibility'],
        name = json['name'];
}
