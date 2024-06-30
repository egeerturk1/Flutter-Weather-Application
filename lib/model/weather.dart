class Weather {
  String name;
  double temp_c;
  String text;
  String icon;



  Weather(this.name, this.temp_c, this.text, this.icon);

  Weather.fromMap(Map<String,dynamic> map):
      name = map["location"]["name"] ?? "",
  temp_c = map["current"]["feelslike_c"],
  text = map["current"]["condition"]["text"],
  icon = map["current"]["condition"]["icon"];
}

