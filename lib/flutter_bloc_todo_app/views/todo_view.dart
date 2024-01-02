import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componnets/custom_text.dart';
import '../bloc/todo_bloc.dart';
import '../models/todo_model.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const CustomText(text: 'TODO LIST'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //cubit method
        // child: BlocBuilder<TodoCubit, List<Todo>>(
        child: BlocBuilder<TodoBloc, List<Todo>>(
          builder: (context, state) {
            return state.isEmpty
                ? const Center(child: Text('No Data in list'))
                : ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (_, index) {
                      final todo = state[index];
                      return ListTile(
                        title: Text(todo.name),
                        trailing: Text(todo.createdAt.toString()),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
