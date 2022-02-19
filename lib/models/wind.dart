class Wind {
  double speed;
  int deg;

  Wind({required this.speed, required this.deg});

  Wind.fromJson(Map<String, dynamic> json)
      : speed = json['speed'],
        deg = json['deg'];
}
