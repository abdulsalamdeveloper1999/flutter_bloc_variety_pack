import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<AddTodoEvent, List<Todo>> {
  TodoBloc() : super([]) {
    on<AddTodoEvent>(addTodos);
  }

  void addTodos(AddTodoEvent event, Emitter<List<Todo>> emit) {
    Todo todo = Todo(name: event.name, createdAt: DateTime.now());
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    log('Change $change');
  }
}
