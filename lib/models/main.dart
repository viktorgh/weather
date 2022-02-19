class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  Main(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity});

  Main.fromJson(Map<String, dynamic> json)
      : temp = json['temp'],
        feelsLike = json['feels_like'],
        tempMin = json['temp_min'],
        tempMax = json['temp_max'],
        pressure = json['pressure'],
        humidity = json['humidity'];
}
