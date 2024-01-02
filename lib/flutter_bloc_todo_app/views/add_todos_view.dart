import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componnets/custom_text.dart';
import '../bloc/todo_bloc.dart';

// import 'package:tutorials_project/flutter_bloc_todo_app/cubit/todo_cubit.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({super.key});

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final todoController = TextEditingController();
  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: todoController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  ///Cubit method
                  // context.read<TodoCubit>().addTodo(
                  //       todoController.text.trim(),
                  //     );
                  //Bloc Method
                  context
                      .read<TodoBloc>()
                      .add(AddTodoEvent(name: todoController.text.trim()));
                  todoController.clear();
                  Navigator.pop(context);
                },
                child: const CustomText(text: 'Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
