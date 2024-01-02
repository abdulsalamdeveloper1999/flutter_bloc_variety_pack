// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'flutter_bloc_counter/bloc/counter_bloc.dart';
// import 'flutter_bloc_counter/cubit/counter_cubit.dart';

// import 'flutter_bloc_todo_app/bloc/todo_bloc.dart';
// import 'flutter_bloc_todo_app/cubit/todo_cubit.dart';
// import 'flutter_bloc_todo_app/views/add_todos_view.dart';
// import 'flutter_bloc_todo_app/views/todo_view.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => CounterCubit()),
//         BlocProvider(create: (_) => CounterBloc()),
//         BlocProvider(create: (_) => TodoCubit()),
//         BlocProvider(create: (_) => TodoBloc())
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/',
//         theme: ThemeData(
//             useMaterial3: true,
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
//         routes: {
//           '/': (_) => const TodoListView(),
//           '/add-todo': (_) => const AddTodoView(),
//         },
//         // home: const CounterCubitView(),
//         // home: HomePage(),
//       ),
//     );
//   }
// }
// import 'package:bloc_and_bloc_cubit/flutter_bloc_login_form_vlidation/bloc/auth_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'flutter_bloc_login_form_vlidation/pallete.dart';
// import 'flutter_bloc_login_form_vlidation/views/login_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => AuthBloc(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.dark().copyWith(
//           scaffoldBackgroundColor: Pallete.backgroundColor,
//         ),
//         home: const LoginScreen(),
//       ),
//     );
//   }
// }
import 'package:bloc_and_bloc_cubit/flutter_bloc_pattern_wheather_app/bloc/wheather_bloc.dart';
import 'package:bloc_and_bloc_cubit/flutter_bloc_pattern_wheather_app/data/data_provider/wheather_data_provider.dart';
import 'package:bloc_and_bloc_cubit/flutter_bloc_pattern_wheather_app/data/repository/wheather_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flutter_bloc_pattern_wheather_app/presentation/views/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => WeatherRepo(WeatherDataProvider()),
      child: BlocProvider(
        create: (BuildContext context) => WheatherBloc(
          context.read<WeatherRepo>(), // Ensure that this context is valid
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
