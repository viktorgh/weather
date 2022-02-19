import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/notifiers/weather_change_notifier.dart';
import 'package:weather/widgets/weather_card.dart';
import 'package:weather_icons/weather_icons.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<WeatherChangeNotifier>(context).getWeather;
    return CustomScrollView(
      primary: false,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              WeatherCard(
                icon: WeatherIcons.thermometer,
                caption: 'FEELS LIKE',
                color: Colors.green[100]!.withOpacity(0.5),
                content:
                    "${appState.main.feelsLike.roundToDouble().truncate()} \u2103",
              ),
              WeatherCard(
                icon: WeatherIcons.barometer,
                caption: 'PRESSURE',
                color: Colors.green[200]!.withOpacity(0.5),
                content:
                    "${appState.main.pressure.roundToDouble().truncate()} hPa",
              ),
              WeatherCard(
                icon: WeatherIcons.humidity,
                caption: 'HUMIDITY',
                color: Colors.green[300]!.withOpacity(0.5),
                content:
                    "${appState.main.humidity.roundToDouble().truncate()} %",
              ),
              WeatherCard(
                icon: WeatherIcons.strong_wind,
                caption: 'WIND',
                color: Colors.green[400]!.withOpacity(0.5),
                content:
                    "${appState.main.humidity.roundToDouble().truncate()} \u2103",
              ),
              WeatherCard(
                icon: WeatherIcons.sunrise,
                caption: 'SUNRISE',
                color: Colors.green[500]!.withOpacity(0.5),
                content:
                    "${appState.main.humidity.roundToDouble().truncate()} \u2103",
              ),
              WeatherCard(
                icon: WeatherIcons.sunset,
                caption: 'SUNSET',
                color: Colors.green[400]!.withOpacity(0.5),
                content:
                    "${appState.main.feelsLike.roundToDouble().truncate()} \u2103",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
