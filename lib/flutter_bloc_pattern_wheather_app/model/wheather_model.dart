import 'dart:convert';

class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;
  final List<HourlyForecast> hourlyForecasts;

  WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.hourlyForecasts,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];

    // Extract hourly forecast data
    List<HourlyForecast> hourlyForecasts = List<HourlyForecast>.from(
      map['list'].map((hourlyData) => HourlyForecast.fromMap(hourlyData)),
    );

    return WeatherModel(
      currentTemp: (currentWeatherData['main']['temp'] as num).toDouble(),
      currentSky: currentWeatherData['weather'][0]['main'] as String,
      currentPressure:
          (currentWeatherData['main']['pressure'] as num).toDouble(),
      currentWindSpeed: (currentWeatherData['wind']['speed'] as num).toDouble(),
      currentHumidity:
          (currentWeatherData['main']['humidity'] as num).toDouble(),
      hourlyForecasts: hourlyForecasts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
      'hourlyForecasts':
          hourlyForecasts.map((forecast) => forecast.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    double? currentPressure,
    double? currentWindSpeed,
    double? currentHumidity,
    List<HourlyForecast>? hourlyForecasts,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      hourlyForecasts: hourlyForecasts ?? this.hourlyForecasts,
    );
  }
}

class HourlyForecast {
  final String sky;
  final double temp;
  final String dtTxt; // Added dtTxt field

  HourlyForecast({
    required this.sky,
    required this.temp,
    required this.dtTxt,
  });

  factory HourlyForecast.fromMap(Map<String, dynamic> map) {
    return HourlyForecast(
      sky: map['weather'][0]['main'] as String,
      temp: (map['main']['temp'] as num).toDouble(),
      dtTxt: map['dt_txt'] as String, // Assign dt_txt value
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sky': sky,
      'temp': temp,
      'dtTxt': dtTxt,
    };
  }
}
