import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/wheather_repo.dart';

import 'wheather_event.dart';
import 'wheather_state.dart';

class WheatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo wheatherRepo;
  WheatherBloc(this.wheatherRepo) : super(WeatherInitial()) {
    on<WeatherFetched>(_fetchWheatherHandler);
  }

  void _fetchWheatherHandler(event, Emitter<WeatherState> emit) async {
    try {
      final weather = await wheatherRepo.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }

  @override
  void onChange(Change<WeatherState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
