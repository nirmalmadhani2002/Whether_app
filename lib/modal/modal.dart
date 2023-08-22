class Weather {
  final String name;
  final String description;
  final double feelsLike;
  final int humidity;
  final double speed;
  final int pressure;

  Weather({
    required this.name,
    required this.description,
    required this.feelsLike,
    required this.speed,
    required this.humidity,
    required this.pressure,
  });

  factory Weather.fromMap({required Map data}) {
    return Weather(
      name: data["name"],
      description: data["weather"][0]["description"],
      feelsLike: data["main"]["feels_like"],
      speed: data["wind"]["speed"],
      humidity: data["main"]["humidity"],
      pressure: data["main"]["pressure"],);
  }
}