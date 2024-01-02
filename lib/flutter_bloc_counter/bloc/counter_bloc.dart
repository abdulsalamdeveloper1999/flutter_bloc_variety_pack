import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>(_handleIncrement);
    on<CounterDecremented>(_handleDecrement);
  }

  void _handleIncrement(CounterIncremented event, Emitter<int> emit) {
    emit(state + 1);
  }

  void _handleDecrement(CounterDecremented event, Emitter<int> emit) {
    if (state == 0) {
      return;
    }
    emit(state - 1);
  }
}
