import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather/screen/home.dart';

import 'notifiers/weather_change_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<WeatherChangeNotifier>(
          create: (_) => WeatherChangeNotifier(),
          child: const Home(title: 'Weather'),
        )
        // home: const Home(title: 'Flutter Demo Home Page'),
        );
  }
}
