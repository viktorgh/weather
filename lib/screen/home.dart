import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/notifiers/weather_change_notifier.dart';
import 'package:weather/widgets/details.dart';
import 'package:weather/widgets/summary_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<WeatherChangeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: appState.isFetching
                ? const Text("loading")
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SummaryData(),
                      Expanded(
                        child: Details(),
                      )
                    ],
                  ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => appState.fetchData(),
        tooltip: 'Update weather',
        child: const Icon(Icons.rotate_right_sharp),
      ),
    );
  }
}
