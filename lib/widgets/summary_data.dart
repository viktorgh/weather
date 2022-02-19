import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/notifiers/weather_change_notifier.dart';

class SummaryData extends StatelessWidget {
  const SummaryData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<WeatherChangeNotifier>(context).getWeather;
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            appState.name,
            style: TextStyle(
              fontSize: 28,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.blue[700]!,
            ),
          ),
          Text("${appState.main.temp.roundToDouble().truncate()} \u2103",
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = Colors.blue[700]!,
              )),
          Text(appState.clouds.description),
          Image.network(
              'http://openweathermap.org/img/wn/${appState.clouds.icon}.png')
        ],
      ),
      color: Colors.blueAccent[100]!.withOpacity(0.5),
    );
  }
}
