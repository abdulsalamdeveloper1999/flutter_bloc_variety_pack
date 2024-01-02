import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
// import '../cubit/counter_cubit.dart';

class IncDecView extends StatelessWidget {
  const IncDecView({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'inc',
              onPressed: () => counterBloc.add(CounterIncremented()),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: 'dec',
              onPressed: () => counterBloc.add(CounterDecremented()),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
