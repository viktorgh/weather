class Sys {
  int type;
  int id;
  String country;
  DateTime sunrise;
  DateTime sunset;

  Sys(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});

  Sys.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        id = json['id'],
        country = json['country'],
        sunrise = json['sunrise'],
        sunset = json['sunset'];
}
