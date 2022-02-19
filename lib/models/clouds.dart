class Clouds {
  int id;
  String main;
  String description;
  String icon;

  Clouds(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  Clouds.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        main = json['main'],
        description = json['description'],
        icon = json['icon'];
}
