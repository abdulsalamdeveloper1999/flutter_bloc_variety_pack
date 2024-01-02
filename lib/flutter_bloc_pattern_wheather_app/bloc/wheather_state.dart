import 'package:bloc_and_bloc_cubit/flutter_bloc_pattern_wheather_app/model/wheather_model.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccess({required this.weatherModel});
}

final class WeatherFailure extends WeatherState {
  final String error;

  WeatherFailure(this.error);
}

final class WeatherLoading extends WeatherState {}
