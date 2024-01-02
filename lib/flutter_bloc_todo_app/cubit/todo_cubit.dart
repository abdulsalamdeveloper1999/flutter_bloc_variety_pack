import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be emphty');
      return;
    }
    final Todo todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );
    // state.add(todo);
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    log('Todo- $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    log(error.toString());
  }
}
