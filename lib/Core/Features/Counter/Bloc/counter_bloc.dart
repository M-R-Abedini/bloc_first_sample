import 'package:bloc_first_sample/Core/Features/Counter/Bloc/counter_events.dart';
import 'package:bloc_first_sample/Core/Features/Counter/Bloc/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(CounterStates(counter: 0)) {
    on<CounterEvents>((event, emit) {
      if (event == CounterEvents.increment) {
        emit(CounterStates(counter: state.counter + 1));
      } else if (event == CounterEvents.decrement) {
        emit(CounterStates(counter: state.counter - 1));
      }
    });
  }
}
