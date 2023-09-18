class WeatherData {
  final Map<String, dynamic> coord;
  final List<Map<String, dynamic>> weather;
  final String base;
  final Map<String, dynamic> main;
  final int visibility;
  final Map<String, dynamic> wind;
  final Map<String, dynamic> clouds;
  final int dt;
  final Map<String, dynamic> sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherData({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      coord: json['coord'],
      weather: List<Map<String, dynamic>>.from(json['weather']),
      base: json['base'],
      main: json['main'],
      visibility: json['visibility'],
      wind: json['wind'],
      clouds: json['clouds'],
      dt: json['dt'],
      sys: json['sys'],
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
