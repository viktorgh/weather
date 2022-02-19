class Coordinates {
  double lon;
  double lat;

  Coordinates({required this.lon, required this.lat});

  Coordinates.fromJson(Map<String, dynamic> json)
      : lon = json['lon'],
        lat = json['lat'];
}
