import 'package:bloc_first_sample/Core/Features/Counter/Bloc/counter_bloc.dart';
import 'package:bloc_first_sample/Core/Features/Counter/Bloc/counter_events.dart';
import 'package:bloc_first_sample/Core/Features/Counter/Bloc/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  CounterView({super.key});
  final CounterBloc counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterStates>(
              bloc: counterBloc,
              builder: (BuildContext context, CounterStates state) {
                return Text(state.counter.toString());
              },
            ),
          ),
          SafeArea(
              child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                      onPressed: () => counterBloc.add(CounterEvents.increment),
                      child: const Icon(Icons.add)),
                  const SizedBox(height: 12),
                  FloatingActionButton(
                      onPressed: () => counterBloc.add(CounterEvents.decrement),
                      child: const Icon(Icons.deck)),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
