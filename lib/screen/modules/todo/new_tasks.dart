import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/screen/shared/bloc/todo/todo_cubit.dart';
import 'package:flutter_playground/screen/shared/bloc/todo/todo_states.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = TodoCubit.get(context).newTasks;
        return Text('${tasks.length}');
      },
    );
  }
}
