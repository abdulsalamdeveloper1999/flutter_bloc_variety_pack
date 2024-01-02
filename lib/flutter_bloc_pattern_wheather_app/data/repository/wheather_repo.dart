import 'dart:convert';
import 'dart:developer';

import '../../model/wheather_model.dart';
import '../data_provider/wheather_data_provider.dart';

class WeatherRepo {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepo(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';
      log(cityName);
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
