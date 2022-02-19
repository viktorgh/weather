import 'package:flutter/material.dart';
class WeatherCard extends StatelessWidget {
  const WeatherCard(
      {Key? key,
        required this.icon,
        required this.caption,
        required this.color,
        required this.content})
      : super(key: key);

  final IconData icon;
  final String caption;
  final Color color;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8),
                child: Text(
                  caption,
                  style: const TextStyle(
                      color: Color(0x636161FF),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          ),
          Text(
            content,
            style: const TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
          )
        ],
      ),
      color: color,
    );
  }
}